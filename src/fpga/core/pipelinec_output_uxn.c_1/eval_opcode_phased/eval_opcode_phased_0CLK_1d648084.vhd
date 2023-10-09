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
entity eval_opcode_phased_0CLK_1d648084 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_1d648084;
architecture arch of eval_opcode_phased_0CLK_1d648084 is
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
-- BIN_OP_AND[uxn_opcodes_h_l3280_c10_5f72]
signal BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3280_c10_8b1f]
signal BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3280_c41_f72d]
signal BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3280_c57_3eb9]
signal CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3280_c10_955c]
signal MUX_uxn_opcodes_h_l3280_c10_955c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3280_c10_955c_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3280_c10_955c_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3280_c10_955c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3281_c18_c754]
signal BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3281_c18_8449]
signal BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3281_c18_fe36]
signal MUX_uxn_opcodes_h_l3281_c18_fe36_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3281_c18_fe36_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3281_c18_fe36_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3281_c18_fe36_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3283_c2_4188[uxn_opcodes_h_l3283_c2_4188]
signal printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3285_c6_9247]
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c7_2e01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3285_c2_a9cd]
signal opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3286_c11_0b78]
signal BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c1_482e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c7_f7eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3286_c7_2e01]
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3286_c41_d0ad]
signal jci_uxn_opcodes_h_l3286_c41_d0ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3286_c41_d0ad_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3286_c41_d0ad_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3286_c41_d0ad_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3286_c41_d0ad_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3286_c41_d0ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3287_c11_1e79]
signal BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c1_d950]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c7_ebf7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3287_c7_f7eb]
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3287_c41_5f67]
signal jmi_uxn_opcodes_h_l3287_c41_5f67_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3287_c41_5f67_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3287_c41_5f67_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3287_c41_5f67_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3287_c41_5f67_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3288_c11_8bb5]
signal BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c1_e874]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c7_b3a3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3288_c7_ebf7]
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3288_c41_4780]
signal jsi_uxn_opcodes_h_l3288_c41_4780_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3288_c41_4780_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3288_c41_4780_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3288_c41_4780_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3288_c41_4780_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3289_c11_8374]
signal BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c1_4b7c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c7_dd9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3289_c7_b3a3]
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3289_c41_a121]
signal lit_uxn_opcodes_h_l3289_c41_a121_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3289_c41_a121_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3289_c41_a121_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3289_c41_a121_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3289_c41_a121_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3290_c11_7971]
signal BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c1_787e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c7_0181]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3290_c7_dd9c]
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3290_c41_4ff6]
signal lit2_uxn_opcodes_h_l3290_c41_4ff6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3290_c41_4ff6_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3290_c41_4ff6_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3290_c41_4ff6_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3291_c11_aeb5]
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c1_f6bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c7_0be9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3291_c7_0181]
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3291_c41_d8f4]
signal lit_uxn_opcodes_h_l3291_c41_d8f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3291_c41_d8f4_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3291_c41_d8f4_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3291_c41_d8f4_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3291_c41_d8f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3292_c11_7f35]
signal BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c1_1bca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c7_a1c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3292_c7_0be9]
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3292_c41_e1f4]
signal lit2_uxn_opcodes_h_l3292_c41_e1f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3292_c41_e1f4_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3292_c41_e1f4_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3292_c41_e1f4_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3293_c11_2ecf]
signal BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c1_c08b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c7_2464]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3293_c7_a1c8]
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3293_c41_07b0]
signal inc_uxn_opcodes_h_l3293_c41_07b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3293_c41_07b0_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3293_c41_07b0_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3293_c41_07b0_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3293_c41_07b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3294_c11_ff67]
signal BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c1_66d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c7_72cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3294_c7_2464]
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3294_c41_ee16]
signal inc2_uxn_opcodes_h_l3294_c41_ee16_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3294_c41_ee16_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3294_c41_ee16_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3294_c41_ee16_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3294_c41_ee16_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3295_c11_8ca5]
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c1_7883]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c7_daa7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3295_c7_72cf]
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3295_c41_a827]
signal pop_uxn_opcodes_h_l3295_c41_a827_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3295_c41_a827_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3295_c41_a827_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3295_c41_a827_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3296_c11_2ecb]
signal BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c1_0437]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c7_53f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3296_c7_daa7]
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3296_c41_3741]
signal pop2_uxn_opcodes_h_l3296_c41_3741_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3296_c41_3741_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3296_c41_3741_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3296_c41_3741_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3297_c11_607f]
signal BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c1_7dd7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c7_c379]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3297_c7_53f2]
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3297_c41_a999]
signal nip_uxn_opcodes_h_l3297_c41_a999_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3297_c41_a999_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3297_c41_a999_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3297_c41_a999_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3297_c41_a999_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3298_c11_33f2]
signal BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c1_ac6e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c7_d7ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3298_c7_c379]
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3298_c41_e087]
signal nip2_uxn_opcodes_h_l3298_c41_e087_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3298_c41_e087_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3298_c41_e087_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3298_c41_e087_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3298_c41_e087_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3299_c11_886c]
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c1_ff1b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c7_9511]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3299_c7_d7ad]
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3299_c41_4081]
signal swp_uxn_opcodes_h_l3299_c41_4081_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3299_c41_4081_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3299_c41_4081_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3299_c41_4081_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3299_c41_4081_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3300_c11_d589]
signal BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c1_eba0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c7_3412]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3300_c7_9511]
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3300_c41_5f05]
signal swp2_uxn_opcodes_h_l3300_c41_5f05_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3300_c41_5f05_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3300_c41_5f05_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3300_c41_5f05_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3300_c41_5f05_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3301_c11_b912]
signal BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c1_79f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c7_9a33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3301_c7_3412]
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3301_c41_6a1f]
signal rot_uxn_opcodes_h_l3301_c41_6a1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3301_c41_6a1f_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3301_c41_6a1f_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3301_c41_6a1f_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3301_c41_6a1f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3302_c11_7131]
signal BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c1_1963]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c7_7a03]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3302_c7_9a33]
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3302_c41_573d]
signal rot2_uxn_opcodes_h_l3302_c41_573d_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3302_c41_573d_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3302_c41_573d_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3302_c41_573d_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3302_c41_573d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3303_c11_4ff8]
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c1_e534]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c7_5005]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3303_c7_7a03]
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3303_c41_0369]
signal dup_uxn_opcodes_h_l3303_c41_0369_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3303_c41_0369_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3303_c41_0369_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3303_c41_0369_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3303_c41_0369_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3304_c11_2a52]
signal BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c1_880d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c7_81d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3304_c7_5005]
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3304_c41_3d9e]
signal dup2_uxn_opcodes_h_l3304_c41_3d9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3304_c41_3d9e_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3304_c41_3d9e_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3304_c41_3d9e_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3305_c11_8d04]
signal BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c1_89eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c7_b73c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3305_c7_81d6]
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3305_c41_ece5]
signal ovr_uxn_opcodes_h_l3305_c41_ece5_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3305_c41_ece5_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3305_c41_ece5_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3305_c41_ece5_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3305_c41_ece5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3306_c11_eb74]
signal BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c1_5122]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c7_1e89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3306_c7_b73c]
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3306_c41_c2c7]
signal ovr2_uxn_opcodes_h_l3306_c41_c2c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3306_c41_c2c7_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3306_c41_c2c7_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3306_c41_c2c7_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3307_c11_e357]
signal BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c1_6dcc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c7_76b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3307_c7_1e89]
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3307_c41_bddb]
signal equ_uxn_opcodes_h_l3307_c41_bddb_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3307_c41_bddb_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3307_c41_bddb_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3307_c41_bddb_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3307_c41_bddb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3308_c11_b762]
signal BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c1_645b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c7_6952]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3308_c7_76b5]
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3308_c41_9649]
signal equ2_uxn_opcodes_h_l3308_c41_9649_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3308_c41_9649_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3308_c41_9649_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3308_c41_9649_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3308_c41_9649_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3309_c11_69cb]
signal BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c1_64e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c7_b4f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3309_c7_6952]
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3309_c41_50ff]
signal neq_uxn_opcodes_h_l3309_c41_50ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3309_c41_50ff_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3309_c41_50ff_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3309_c41_50ff_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3309_c41_50ff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3310_c11_5f79]
signal BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c1_64f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c7_b3d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3310_c7_b4f0]
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3310_c41_7829]
signal neq2_uxn_opcodes_h_l3310_c41_7829_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3310_c41_7829_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3310_c41_7829_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3310_c41_7829_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3310_c41_7829_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3311_c11_10e0]
signal BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c1_de6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c7_7b23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3311_c7_b3d3]
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3311_c41_3fe2]
signal gth_uxn_opcodes_h_l3311_c41_3fe2_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3311_c41_3fe2_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3311_c41_3fe2_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3311_c41_3fe2_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3311_c41_3fe2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3312_c11_2057]
signal BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c1_ba45]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c7_327c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3312_c7_7b23]
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3312_c41_6cb7]
signal gth2_uxn_opcodes_h_l3312_c41_6cb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3312_c41_6cb7_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3312_c41_6cb7_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3312_c41_6cb7_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3313_c11_60c9]
signal BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c1_f764]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c7_92f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3313_c7_327c]
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3313_c41_639f]
signal lth_uxn_opcodes_h_l3313_c41_639f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3313_c41_639f_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3313_c41_639f_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3313_c41_639f_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3313_c41_639f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3314_c11_ef6d]
signal BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c1_c317]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c7_4afb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3314_c7_92f4]
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3314_c41_da07]
signal lth2_uxn_opcodes_h_l3314_c41_da07_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3314_c41_da07_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3314_c41_da07_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3314_c41_da07_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3314_c41_da07_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3315_c11_11ca]
signal BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c1_103c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c7_ac2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3315_c7_4afb]
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3315_c41_f353]
signal jmp_uxn_opcodes_h_l3315_c41_f353_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3315_c41_f353_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3315_c41_f353_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3315_c41_f353_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3315_c41_f353_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3315_c41_f353_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3316_c11_a4fb]
signal BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c1_1001]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c7_ef4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3316_c7_ac2d]
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3316_c41_996f]
signal jmp2_uxn_opcodes_h_l3316_c41_996f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3316_c41_996f_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3316_c41_996f_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3316_c41_996f_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3316_c41_996f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3317_c11_29a6]
signal BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c1_5544]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c7_696b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3317_c7_ef4e]
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3317_c41_7882]
signal jcn_uxn_opcodes_h_l3317_c41_7882_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3317_c41_7882_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3317_c41_7882_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3317_c41_7882_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3317_c41_7882_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3317_c41_7882_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3318_c11_0986]
signal BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c1_faa3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c7_4475]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3318_c7_696b]
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3318_c41_43e5]
signal jcn2_uxn_opcodes_h_l3318_c41_43e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3318_c41_43e5_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3318_c41_43e5_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3318_c41_43e5_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3319_c11_c145]
signal BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c1_0e60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c7_4909]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3319_c7_4475]
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3319_c41_0645]
signal jsr_uxn_opcodes_h_l3319_c41_0645_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3319_c41_0645_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3319_c41_0645_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3319_c41_0645_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3319_c41_0645_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3319_c41_0645_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3320_c11_5e75]
signal BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c1_9735]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c7_3f89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3320_c7_4909]
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3320_c41_2dfc]
signal jsr2_uxn_opcodes_h_l3320_c41_2dfc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3320_c41_2dfc_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3320_c41_2dfc_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3320_c41_2dfc_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3320_c41_2dfc_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3321_c11_45b7]
signal BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c1_67ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c7_a08c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3321_c7_3f89]
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3321_c41_f246]
signal sth_uxn_opcodes_h_l3321_c41_f246_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3321_c41_f246_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3321_c41_f246_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3321_c41_f246_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3321_c41_f246_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3322_c11_6233]
signal BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c1_0ba2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c7_984b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3322_c7_a08c]
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3322_c41_f138]
signal sth2_uxn_opcodes_h_l3322_c41_f138_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3322_c41_f138_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3322_c41_f138_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3322_c41_f138_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3322_c41_f138_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3323_c11_4a56]
signal BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c1_8ee7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c7_8785]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3323_c7_984b]
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3323_c41_31ce]
signal ldz_uxn_opcodes_h_l3323_c41_31ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3323_c41_31ce_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3323_c41_31ce_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3323_c41_31ce_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3323_c41_31ce_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3323_c41_31ce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3324_c11_9011]
signal BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c1_9eca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c7_9e32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3324_c7_8785]
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3324_c41_8625]
signal ldz2_uxn_opcodes_h_l3324_c41_8625_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3324_c41_8625_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3324_c41_8625_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3324_c41_8625_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3324_c41_8625_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3324_c41_8625_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3325_c11_adcf]
signal BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c1_64a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c7_f05c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3325_c7_9e32]
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3325_c41_dfce]
signal stz_uxn_opcodes_h_l3325_c41_dfce_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3325_c41_dfce_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3325_c41_dfce_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3325_c41_dfce_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3325_c41_dfce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3326_c11_0efa]
signal BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c1_2932]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c7_0981]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3326_c7_f05c]
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3326_c41_02bf]
signal stz2_uxn_opcodes_h_l3326_c41_02bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3326_c41_02bf_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3326_c41_02bf_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3326_c41_02bf_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3326_c41_02bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3327_c11_d351]
signal BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c1_f9ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c7_119b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3327_c7_0981]
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3327_c41_8d35]
signal ldr_uxn_opcodes_h_l3327_c41_8d35_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3327_c41_8d35_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3327_c41_8d35_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3327_c41_8d35_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3327_c41_8d35_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3327_c41_8d35_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3327_c41_8d35_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3328_c11_b155]
signal BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c1_ebb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c7_f3aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3328_c7_119b]
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3328_c41_0192]
signal ldr2_uxn_opcodes_h_l3328_c41_0192_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3328_c41_0192_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3328_c41_0192_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3328_c41_0192_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3328_c41_0192_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3328_c41_0192_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3328_c41_0192_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3329_c11_57b7]
signal BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c1_76d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c7_da23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3329_c7_f3aa]
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3329_c41_2e5b]
signal str1_uxn_opcodes_h_l3329_c41_2e5b_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3329_c41_2e5b_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3329_c41_2e5b_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3329_c41_2e5b_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3329_c41_2e5b_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3329_c41_2e5b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3330_c11_e999]
signal BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c1_cccd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3331_c7_9862]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3330_c7_da23]
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3330_c41_0be1]
signal str2_uxn_opcodes_h_l3330_c41_0be1_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3330_c41_0be1_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3330_c41_0be1_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3330_c41_0be1_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3330_c41_0be1_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3330_c41_0be1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3331_c11_e0a7]
signal BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3331_c1_63c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3332_c7_ede0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3331_c7_9862]
signal opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3331_c41_821c]
signal lda_uxn_opcodes_h_l3331_c41_821c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3331_c41_821c_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3331_c41_821c_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3331_c41_821c_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3331_c41_821c_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3331_c41_821c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3332_c11_c069]
signal BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3332_c1_e6bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3333_c7_f417]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3332_c7_ede0]
signal opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3332_c41_1b5f]
signal lda2_uxn_opcodes_h_l3332_c41_1b5f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3332_c41_1b5f_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3332_c41_1b5f_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3333_c11_5df5]
signal BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3333_c1_d877]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c7_c71d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3333_c7_f417]
signal opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3333_c41_4efc]
signal sta_uxn_opcodes_h_l3333_c41_4efc_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3333_c41_4efc_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3333_c41_4efc_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3333_c41_4efc_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3333_c41_4efc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3334_c11_2e7e]
signal BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c1_2ed9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c7_097b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3334_c7_c71d]
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3334_c41_c62f]
signal sta2_uxn_opcodes_h_l3334_c41_c62f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3334_c41_c62f_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3334_c41_c62f_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3334_c41_c62f_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3334_c41_c62f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3335_c11_1f80]
signal BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c1_4457]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c7_4174]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3335_c7_097b]
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3335_c41_28ab]
signal dei_uxn_opcodes_h_l3335_c41_28ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3335_c41_28ab_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3335_c41_28ab_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3335_c41_28ab_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3335_c41_28ab_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3335_c41_28ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3336_c11_9224]
signal BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c1_cda7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c7_fc84]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3336_c7_4174]
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3336_c41_2974]
signal dei2_uxn_opcodes_h_l3336_c41_2974_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3336_c41_2974_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3336_c41_2974_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3336_c41_2974_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3336_c41_2974_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3336_c41_2974_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3337_c11_c1ba]
signal BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c1_e0f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c7_6609]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3337_c7_fc84]
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3337_c41_930a]
signal deo_uxn_opcodes_h_l3337_c41_930a_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3337_c41_930a_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3337_c41_930a_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3337_c41_930a_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3337_c41_930a_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3337_c41_930a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3338_c11_3001]
signal BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c1_6916]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c7_7a71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3338_c7_6609]
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3338_c41_685e]
signal deo2_uxn_opcodes_h_l3338_c41_685e_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3338_c41_685e_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3338_c41_685e_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3338_c41_685e_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3338_c41_685e_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3338_c41_685e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3339_c11_fe77]
signal BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c1_5979]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c7_f030]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3339_c7_7a71]
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3339_c41_8d00]
signal add_uxn_opcodes_h_l3339_c41_8d00_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3339_c41_8d00_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3339_c41_8d00_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3339_c41_8d00_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3339_c41_8d00_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3340_c11_f9c7]
signal BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c1_ee18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c7_b221]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3340_c7_f030]
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3340_c41_0117]
signal add2_uxn_opcodes_h_l3340_c41_0117_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3340_c41_0117_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3340_c41_0117_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3340_c41_0117_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3340_c41_0117_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3341_c11_b8bf]
signal BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c1_e990]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c7_6877]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3341_c7_b221]
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3341_c41_a55d]
signal sub_uxn_opcodes_h_l3341_c41_a55d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3341_c41_a55d_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3341_c41_a55d_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3341_c41_a55d_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3341_c41_a55d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3342_c11_f03c]
signal BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c1_a3c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c7_92a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3342_c7_6877]
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3342_c41_3930]
signal sub2_uxn_opcodes_h_l3342_c41_3930_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3342_c41_3930_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3342_c41_3930_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3342_c41_3930_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3342_c41_3930_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3343_c11_588d]
signal BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c1_225c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c7_2b56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3343_c7_92a9]
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3343_c41_038e]
signal mul_uxn_opcodes_h_l3343_c41_038e_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3343_c41_038e_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3343_c41_038e_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3343_c41_038e_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3343_c41_038e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3344_c11_d1cc]
signal BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c1_3eb4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c7_d759]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3344_c7_2b56]
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3344_c41_128f]
signal mul2_uxn_opcodes_h_l3344_c41_128f_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3344_c41_128f_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3344_c41_128f_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3344_c41_128f_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3344_c41_128f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3345_c11_5fc3]
signal BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c1_da71]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c7_8bf9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3345_c7_d759]
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3345_c41_2d1a]
signal div_uxn_opcodes_h_l3345_c41_2d1a_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3345_c41_2d1a_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3345_c41_2d1a_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3345_c41_2d1a_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3345_c41_2d1a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3346_c11_4d28]
signal BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c1_45ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c7_f72c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3346_c7_8bf9]
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3346_c41_bd4f]
signal div2_uxn_opcodes_h_l3346_c41_bd4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3346_c41_bd4f_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3346_c41_bd4f_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3346_c41_bd4f_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3346_c41_bd4f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3347_c11_81c7]
signal BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c1_b814]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c7_9583]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3347_c7_f72c]
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3347_c41_9811]
signal and_uxn_opcodes_h_l3347_c41_9811_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3347_c41_9811_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3347_c41_9811_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3347_c41_9811_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3347_c41_9811_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3348_c11_6e69]
signal BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c1_c338]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c7_bde7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3348_c7_9583]
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3348_c41_66f2]
signal and2_uxn_opcodes_h_l3348_c41_66f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3348_c41_66f2_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3348_c41_66f2_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3348_c41_66f2_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3348_c41_66f2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3349_c11_f83a]
signal BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c1_f650]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c7_f34b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3349_c7_bde7]
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3349_c41_6ac0]
signal ora_uxn_opcodes_h_l3349_c41_6ac0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3349_c41_6ac0_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3349_c41_6ac0_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3349_c41_6ac0_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3349_c41_6ac0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3350_c11_03ed]
signal BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c1_a001]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c7_fc00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3350_c7_f34b]
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3350_c41_a6b8]
signal ora2_uxn_opcodes_h_l3350_c41_a6b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3350_c41_a6b8_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3350_c41_a6b8_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3350_c41_a6b8_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3351_c11_346c]
signal BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c1_3d3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c7_a342]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3351_c7_fc00]
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3351_c41_9d63]
signal eor_uxn_opcodes_h_l3351_c41_9d63_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3351_c41_9d63_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3351_c41_9d63_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3351_c41_9d63_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3351_c41_9d63_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3352_c11_d430]
signal BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c1_d77c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c7_4603]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3352_c7_a342]
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3352_c41_274e]
signal eor2_uxn_opcodes_h_l3352_c41_274e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3352_c41_274e_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3352_c41_274e_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3352_c41_274e_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3352_c41_274e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3353_c11_bfe3]
signal BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c1_b48d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c7_42b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3353_c7_4603]
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3353_c41_2433]
signal sft_uxn_opcodes_h_l3353_c41_2433_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3353_c41_2433_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3353_c41_2433_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3353_c41_2433_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3353_c41_2433_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3354_c11_9ea2]
signal BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c1_0071]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3355_c1_053b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3354_c7_42b8]
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3354_c41_df30]
signal sft2_uxn_opcodes_h_l3354_c41_df30_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3354_c41_df30_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3354_c41_df30_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3354_c41_df30_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3354_c41_df30_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3355_c9_d3ed[uxn_opcodes_h_l3355_c9_d3ed]
signal printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3357_c2_20b3]
signal sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3357_c2_20b3]
signal sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3358_c3_5ec8]
signal sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3358_c3_5ec8]
signal sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3359_c4_1169]
signal BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3361_c4_becc]
signal BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3367_c19_3bbe]
signal MUX_uxn_opcodes_h_l3367_c19_3bbe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3367_c19_3bbe_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3367_c19_3bbe_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3367_c19_7b0f]
signal BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l3371_c5_30a1]
signal UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output : unsigned(0 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3370_c21_db75]
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_stack_index : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address0 : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read0_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address1 : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read1_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l3380_c26_efde]
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72
BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_left,
BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_right,
BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f
BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_left,
BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_right,
BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d
BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_left,
BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_right,
BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9
CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_x,
CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output);

-- MUX_uxn_opcodes_h_l3280_c10_955c
MUX_uxn_opcodes_h_l3280_c10_955c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3280_c10_955c_cond,
MUX_uxn_opcodes_h_l3280_c10_955c_iftrue,
MUX_uxn_opcodes_h_l3280_c10_955c_iffalse,
MUX_uxn_opcodes_h_l3280_c10_955c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754
BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_left,
BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_right,
BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449
BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_left,
BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_right,
BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output);

-- MUX_uxn_opcodes_h_l3281_c18_fe36
MUX_uxn_opcodes_h_l3281_c18_fe36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3281_c18_fe36_cond,
MUX_uxn_opcodes_h_l3281_c18_fe36_iftrue,
MUX_uxn_opcodes_h_l3281_c18_fe36_iffalse,
MUX_uxn_opcodes_h_l3281_c18_fe36_return_output);

-- printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188
printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188 : entity work.printf_uxn_opcodes_h_l3283_c2_4188_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg0,
printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg1,
printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247
BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_left,
BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_right,
BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd
opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_cond,
opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_left,
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_right,
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01
opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_cond,
opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue,
opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse,
opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output);

-- jci_uxn_opcodes_h_l3286_c41_d0ad
jci_uxn_opcodes_h_l3286_c41_d0ad : entity work.jci_0CLK_8f02dccf port map (
clk,
jci_uxn_opcodes_h_l3286_c41_d0ad_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3286_c41_d0ad_phase,
jci_uxn_opcodes_h_l3286_c41_d0ad_pc,
jci_uxn_opcodes_h_l3286_c41_d0ad_previous_stack_read,
jci_uxn_opcodes_h_l3286_c41_d0ad_previous_ram_read,
jci_uxn_opcodes_h_l3286_c41_d0ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_left,
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_right,
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb
opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond,
opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output);

-- jmi_uxn_opcodes_h_l3287_c41_5f67
jmi_uxn_opcodes_h_l3287_c41_5f67 : entity work.jmi_0CLK_b30fc8f1 port map (
clk,
jmi_uxn_opcodes_h_l3287_c41_5f67_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3287_c41_5f67_phase,
jmi_uxn_opcodes_h_l3287_c41_5f67_pc,
jmi_uxn_opcodes_h_l3287_c41_5f67_previous_ram_read,
jmi_uxn_opcodes_h_l3287_c41_5f67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_left,
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_right,
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7
opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond,
opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output);

-- jsi_uxn_opcodes_h_l3288_c41_4780
jsi_uxn_opcodes_h_l3288_c41_4780 : entity work.jsi_0CLK_8f02dccf port map (
clk,
jsi_uxn_opcodes_h_l3288_c41_4780_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3288_c41_4780_phase,
jsi_uxn_opcodes_h_l3288_c41_4780_pc,
jsi_uxn_opcodes_h_l3288_c41_4780_previous_ram_read,
jsi_uxn_opcodes_h_l3288_c41_4780_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_left,
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_right,
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3
opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond,
opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output);

-- lit_uxn_opcodes_h_l3289_c41_a121
lit_uxn_opcodes_h_l3289_c41_a121 : entity work.lit_0CLK_46011230 port map (
clk,
lit_uxn_opcodes_h_l3289_c41_a121_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3289_c41_a121_phase,
lit_uxn_opcodes_h_l3289_c41_a121_pc,
lit_uxn_opcodes_h_l3289_c41_a121_previous_ram_read,
lit_uxn_opcodes_h_l3289_c41_a121_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_left,
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_right,
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c
opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond,
opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output);

-- lit2_uxn_opcodes_h_l3290_c41_4ff6
lit2_uxn_opcodes_h_l3290_c41_4ff6 : entity work.lit2_0CLK_c26dda62 port map (
clk,
lit2_uxn_opcodes_h_l3290_c41_4ff6_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3290_c41_4ff6_phase,
lit2_uxn_opcodes_h_l3290_c41_4ff6_pc,
lit2_uxn_opcodes_h_l3290_c41_4ff6_previous_ram_read,
lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_left,
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_right,
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3291_c7_0181
opc_result_MUX_uxn_opcodes_h_l3291_c7_0181 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_cond,
opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue,
opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse,
opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output);

-- lit_uxn_opcodes_h_l3291_c41_d8f4
lit_uxn_opcodes_h_l3291_c41_d8f4 : entity work.lit_0CLK_46011230 port map (
clk,
lit_uxn_opcodes_h_l3291_c41_d8f4_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3291_c41_d8f4_phase,
lit_uxn_opcodes_h_l3291_c41_d8f4_pc,
lit_uxn_opcodes_h_l3291_c41_d8f4_previous_ram_read,
lit_uxn_opcodes_h_l3291_c41_d8f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_left,
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_right,
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9
opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_cond,
opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output);

-- lit2_uxn_opcodes_h_l3292_c41_e1f4
lit2_uxn_opcodes_h_l3292_c41_e1f4 : entity work.lit2_0CLK_c26dda62 port map (
clk,
lit2_uxn_opcodes_h_l3292_c41_e1f4_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3292_c41_e1f4_phase,
lit2_uxn_opcodes_h_l3292_c41_e1f4_pc,
lit2_uxn_opcodes_h_l3292_c41_e1f4_previous_ram_read,
lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_left,
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_right,
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8
opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond,
opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output);

-- inc_uxn_opcodes_h_l3293_c41_07b0
inc_uxn_opcodes_h_l3293_c41_07b0 : entity work.inc_0CLK_66ba3dc0 port map (
clk,
inc_uxn_opcodes_h_l3293_c41_07b0_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3293_c41_07b0_phase,
inc_uxn_opcodes_h_l3293_c41_07b0_ins,
inc_uxn_opcodes_h_l3293_c41_07b0_previous_stack_read,
inc_uxn_opcodes_h_l3293_c41_07b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_left,
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_right,
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3294_c7_2464
opc_result_MUX_uxn_opcodes_h_l3294_c7_2464 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_cond,
opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue,
opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse,
opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output);

-- inc2_uxn_opcodes_h_l3294_c41_ee16
inc2_uxn_opcodes_h_l3294_c41_ee16 : entity work.inc2_0CLK_26f67814 port map (
clk,
inc2_uxn_opcodes_h_l3294_c41_ee16_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3294_c41_ee16_phase,
inc2_uxn_opcodes_h_l3294_c41_ee16_ins,
inc2_uxn_opcodes_h_l3294_c41_ee16_previous_stack_read,
inc2_uxn_opcodes_h_l3294_c41_ee16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_left,
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_right,
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf
opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_cond,
opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output);

-- pop_uxn_opcodes_h_l3295_c41_a827
pop_uxn_opcodes_h_l3295_c41_a827 : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l3295_c41_a827_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3295_c41_a827_phase,
pop_uxn_opcodes_h_l3295_c41_a827_ins,
pop_uxn_opcodes_h_l3295_c41_a827_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_left,
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_right,
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7
opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_cond,
opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output);

-- pop2_uxn_opcodes_h_l3296_c41_3741
pop2_uxn_opcodes_h_l3296_c41_3741 : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l3296_c41_3741_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3296_c41_3741_phase,
pop2_uxn_opcodes_h_l3296_c41_3741_ins,
pop2_uxn_opcodes_h_l3296_c41_3741_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_left,
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_right,
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2
opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_cond,
opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output);

-- nip_uxn_opcodes_h_l3297_c41_a999
nip_uxn_opcodes_h_l3297_c41_a999 : entity work.nip_0CLK_6481cb28 port map (
clk,
nip_uxn_opcodes_h_l3297_c41_a999_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3297_c41_a999_phase,
nip_uxn_opcodes_h_l3297_c41_a999_ins,
nip_uxn_opcodes_h_l3297_c41_a999_previous_stack_read,
nip_uxn_opcodes_h_l3297_c41_a999_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_left,
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_right,
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3298_c7_c379
opc_result_MUX_uxn_opcodes_h_l3298_c7_c379 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_cond,
opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue,
opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse,
opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output);

-- nip2_uxn_opcodes_h_l3298_c41_e087
nip2_uxn_opcodes_h_l3298_c41_e087 : entity work.nip2_0CLK_50a1b8d0 port map (
clk,
nip2_uxn_opcodes_h_l3298_c41_e087_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3298_c41_e087_phase,
nip2_uxn_opcodes_h_l3298_c41_e087_ins,
nip2_uxn_opcodes_h_l3298_c41_e087_previous_stack_read,
nip2_uxn_opcodes_h_l3298_c41_e087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_left,
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_right,
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad
opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond,
opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output);

-- swp_uxn_opcodes_h_l3299_c41_4081
swp_uxn_opcodes_h_l3299_c41_4081 : entity work.swp_0CLK_90fc2573 port map (
clk,
swp_uxn_opcodes_h_l3299_c41_4081_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3299_c41_4081_phase,
swp_uxn_opcodes_h_l3299_c41_4081_ins,
swp_uxn_opcodes_h_l3299_c41_4081_previous_stack_read,
swp_uxn_opcodes_h_l3299_c41_4081_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_left,
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_right,
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3300_c7_9511
opc_result_MUX_uxn_opcodes_h_l3300_c7_9511 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_cond,
opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue,
opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse,
opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output);

-- swp2_uxn_opcodes_h_l3300_c41_5f05
swp2_uxn_opcodes_h_l3300_c41_5f05 : entity work.swp2_0CLK_04f7be23 port map (
clk,
swp2_uxn_opcodes_h_l3300_c41_5f05_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3300_c41_5f05_phase,
swp2_uxn_opcodes_h_l3300_c41_5f05_ins,
swp2_uxn_opcodes_h_l3300_c41_5f05_previous_stack_read,
swp2_uxn_opcodes_h_l3300_c41_5f05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_left,
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_right,
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3301_c7_3412
opc_result_MUX_uxn_opcodes_h_l3301_c7_3412 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_cond,
opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue,
opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse,
opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output);

-- rot_uxn_opcodes_h_l3301_c41_6a1f
rot_uxn_opcodes_h_l3301_c41_6a1f : entity work.rot_0CLK_9c3c4e32 port map (
clk,
rot_uxn_opcodes_h_l3301_c41_6a1f_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3301_c41_6a1f_phase,
rot_uxn_opcodes_h_l3301_c41_6a1f_ins,
rot_uxn_opcodes_h_l3301_c41_6a1f_previous_stack_read,
rot_uxn_opcodes_h_l3301_c41_6a1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_left,
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_right,
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33
opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_cond,
opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue,
opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse,
opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output);

-- rot2_uxn_opcodes_h_l3302_c41_573d
rot2_uxn_opcodes_h_l3302_c41_573d : entity work.rot2_0CLK_79985188 port map (
clk,
rot2_uxn_opcodes_h_l3302_c41_573d_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3302_c41_573d_phase,
rot2_uxn_opcodes_h_l3302_c41_573d_ins,
rot2_uxn_opcodes_h_l3302_c41_573d_previous_stack_read,
rot2_uxn_opcodes_h_l3302_c41_573d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_left,
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_right,
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03
opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_cond,
opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue,
opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse,
opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output);

-- dup_uxn_opcodes_h_l3303_c41_0369
dup_uxn_opcodes_h_l3303_c41_0369 : entity work.dup_0CLK_a148083c port map (
clk,
dup_uxn_opcodes_h_l3303_c41_0369_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3303_c41_0369_phase,
dup_uxn_opcodes_h_l3303_c41_0369_ins,
dup_uxn_opcodes_h_l3303_c41_0369_previous_stack_read,
dup_uxn_opcodes_h_l3303_c41_0369_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_left,
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_right,
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3304_c7_5005
opc_result_MUX_uxn_opcodes_h_l3304_c7_5005 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_cond,
opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue,
opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse,
opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output);

-- dup2_uxn_opcodes_h_l3304_c41_3d9e
dup2_uxn_opcodes_h_l3304_c41_3d9e : entity work.dup2_0CLK_8f02dccf port map (
clk,
dup2_uxn_opcodes_h_l3304_c41_3d9e_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3304_c41_3d9e_phase,
dup2_uxn_opcodes_h_l3304_c41_3d9e_ins,
dup2_uxn_opcodes_h_l3304_c41_3d9e_previous_stack_read,
dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_left,
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_right,
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6
opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_cond,
opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output);

-- ovr_uxn_opcodes_h_l3305_c41_ece5
ovr_uxn_opcodes_h_l3305_c41_ece5 : entity work.ovr_0CLK_cf70ec0f port map (
clk,
ovr_uxn_opcodes_h_l3305_c41_ece5_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3305_c41_ece5_phase,
ovr_uxn_opcodes_h_l3305_c41_ece5_ins,
ovr_uxn_opcodes_h_l3305_c41_ece5_previous_stack_read,
ovr_uxn_opcodes_h_l3305_c41_ece5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_left,
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_right,
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c
opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_cond,
opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output);

-- ovr2_uxn_opcodes_h_l3306_c41_c2c7
ovr2_uxn_opcodes_h_l3306_c41_c2c7 : entity work.ovr2_0CLK_084aa6da port map (
clk,
ovr2_uxn_opcodes_h_l3306_c41_c2c7_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3306_c41_c2c7_phase,
ovr2_uxn_opcodes_h_l3306_c41_c2c7_ins,
ovr2_uxn_opcodes_h_l3306_c41_c2c7_previous_stack_read,
ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_left,
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_right,
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89
opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_cond,
opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue,
opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse,
opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output);

-- equ_uxn_opcodes_h_l3307_c41_bddb
equ_uxn_opcodes_h_l3307_c41_bddb : entity work.equ_0CLK_7c2e709f port map (
clk,
equ_uxn_opcodes_h_l3307_c41_bddb_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3307_c41_bddb_phase,
equ_uxn_opcodes_h_l3307_c41_bddb_ins,
equ_uxn_opcodes_h_l3307_c41_bddb_previous_stack_read,
equ_uxn_opcodes_h_l3307_c41_bddb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_left,
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_right,
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5
opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_cond,
opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output);

-- equ2_uxn_opcodes_h_l3308_c41_9649
equ2_uxn_opcodes_h_l3308_c41_9649 : entity work.equ2_0CLK_3a9c1537 port map (
clk,
equ2_uxn_opcodes_h_l3308_c41_9649_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3308_c41_9649_phase,
equ2_uxn_opcodes_h_l3308_c41_9649_ins,
equ2_uxn_opcodes_h_l3308_c41_9649_previous_stack_read,
equ2_uxn_opcodes_h_l3308_c41_9649_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_left,
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_right,
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3309_c7_6952
opc_result_MUX_uxn_opcodes_h_l3309_c7_6952 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_cond,
opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue,
opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse,
opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output);

-- neq_uxn_opcodes_h_l3309_c41_50ff
neq_uxn_opcodes_h_l3309_c41_50ff : entity work.neq_0CLK_7c2e709f port map (
clk,
neq_uxn_opcodes_h_l3309_c41_50ff_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3309_c41_50ff_phase,
neq_uxn_opcodes_h_l3309_c41_50ff_ins,
neq_uxn_opcodes_h_l3309_c41_50ff_previous_stack_read,
neq_uxn_opcodes_h_l3309_c41_50ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_left,
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_right,
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0
opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond,
opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output);

-- neq2_uxn_opcodes_h_l3310_c41_7829
neq2_uxn_opcodes_h_l3310_c41_7829 : entity work.neq2_0CLK_3a9c1537 port map (
clk,
neq2_uxn_opcodes_h_l3310_c41_7829_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3310_c41_7829_phase,
neq2_uxn_opcodes_h_l3310_c41_7829_ins,
neq2_uxn_opcodes_h_l3310_c41_7829_previous_stack_read,
neq2_uxn_opcodes_h_l3310_c41_7829_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_left,
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_right,
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3
opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond,
opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output);

-- gth_uxn_opcodes_h_l3311_c41_3fe2
gth_uxn_opcodes_h_l3311_c41_3fe2 : entity work.gth_0CLK_7c2e709f port map (
clk,
gth_uxn_opcodes_h_l3311_c41_3fe2_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3311_c41_3fe2_phase,
gth_uxn_opcodes_h_l3311_c41_3fe2_ins,
gth_uxn_opcodes_h_l3311_c41_3fe2_previous_stack_read,
gth_uxn_opcodes_h_l3311_c41_3fe2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_left,
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_right,
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23
opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_cond,
opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue,
opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse,
opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output);

-- gth2_uxn_opcodes_h_l3312_c41_6cb7
gth2_uxn_opcodes_h_l3312_c41_6cb7 : entity work.gth2_0CLK_3a9c1537 port map (
clk,
gth2_uxn_opcodes_h_l3312_c41_6cb7_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3312_c41_6cb7_phase,
gth2_uxn_opcodes_h_l3312_c41_6cb7_ins,
gth2_uxn_opcodes_h_l3312_c41_6cb7_previous_stack_read,
gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_left,
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_right,
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3313_c7_327c
opc_result_MUX_uxn_opcodes_h_l3313_c7_327c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_cond,
opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output);

-- lth_uxn_opcodes_h_l3313_c41_639f
lth_uxn_opcodes_h_l3313_c41_639f : entity work.lth_0CLK_7c2e709f port map (
clk,
lth_uxn_opcodes_h_l3313_c41_639f_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3313_c41_639f_phase,
lth_uxn_opcodes_h_l3313_c41_639f_ins,
lth_uxn_opcodes_h_l3313_c41_639f_previous_stack_read,
lth_uxn_opcodes_h_l3313_c41_639f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_left,
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_right,
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4
opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_cond,
opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output);

-- lth2_uxn_opcodes_h_l3314_c41_da07
lth2_uxn_opcodes_h_l3314_c41_da07 : entity work.lth2_0CLK_3a9c1537 port map (
clk,
lth2_uxn_opcodes_h_l3314_c41_da07_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3314_c41_da07_phase,
lth2_uxn_opcodes_h_l3314_c41_da07_ins,
lth2_uxn_opcodes_h_l3314_c41_da07_previous_stack_read,
lth2_uxn_opcodes_h_l3314_c41_da07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_left,
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_right,
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb
opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_cond,
opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output);

-- jmp_uxn_opcodes_h_l3315_c41_f353
jmp_uxn_opcodes_h_l3315_c41_f353 : entity work.jmp_0CLK_46011230 port map (
clk,
jmp_uxn_opcodes_h_l3315_c41_f353_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3315_c41_f353_phase,
jmp_uxn_opcodes_h_l3315_c41_f353_ins,
jmp_uxn_opcodes_h_l3315_c41_f353_pc,
jmp_uxn_opcodes_h_l3315_c41_f353_previous_stack_read,
jmp_uxn_opcodes_h_l3315_c41_f353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_left,
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_right,
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d
opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond,
opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output);

-- jmp2_uxn_opcodes_h_l3316_c41_996f
jmp2_uxn_opcodes_h_l3316_c41_996f : entity work.jmp2_0CLK_3d5a5eea port map (
clk,
jmp2_uxn_opcodes_h_l3316_c41_996f_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3316_c41_996f_phase,
jmp2_uxn_opcodes_h_l3316_c41_996f_ins,
jmp2_uxn_opcodes_h_l3316_c41_996f_previous_stack_read,
jmp2_uxn_opcodes_h_l3316_c41_996f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_left,
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_right,
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e
opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond,
opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output);

-- jcn_uxn_opcodes_h_l3317_c41_7882
jcn_uxn_opcodes_h_l3317_c41_7882 : entity work.jcn_0CLK_f7466064 port map (
clk,
jcn_uxn_opcodes_h_l3317_c41_7882_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3317_c41_7882_phase,
jcn_uxn_opcodes_h_l3317_c41_7882_ins,
jcn_uxn_opcodes_h_l3317_c41_7882_pc,
jcn_uxn_opcodes_h_l3317_c41_7882_previous_stack_read,
jcn_uxn_opcodes_h_l3317_c41_7882_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_left,
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_right,
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3318_c7_696b
opc_result_MUX_uxn_opcodes_h_l3318_c7_696b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_cond,
opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output);

-- jcn2_uxn_opcodes_h_l3318_c41_43e5
jcn2_uxn_opcodes_h_l3318_c41_43e5 : entity work.jcn2_0CLK_77d0ca3d port map (
clk,
jcn2_uxn_opcodes_h_l3318_c41_43e5_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3318_c41_43e5_phase,
jcn2_uxn_opcodes_h_l3318_c41_43e5_ins,
jcn2_uxn_opcodes_h_l3318_c41_43e5_previous_stack_read,
jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_left,
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_right,
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3319_c7_4475
opc_result_MUX_uxn_opcodes_h_l3319_c7_4475 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_cond,
opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue,
opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse,
opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output);

-- jsr_uxn_opcodes_h_l3319_c41_0645
jsr_uxn_opcodes_h_l3319_c41_0645 : entity work.jsr_0CLK_f1c92b33 port map (
clk,
jsr_uxn_opcodes_h_l3319_c41_0645_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3319_c41_0645_phase,
jsr_uxn_opcodes_h_l3319_c41_0645_ins,
jsr_uxn_opcodes_h_l3319_c41_0645_pc,
jsr_uxn_opcodes_h_l3319_c41_0645_previous_stack_read,
jsr_uxn_opcodes_h_l3319_c41_0645_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_left,
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_right,
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3320_c7_4909
opc_result_MUX_uxn_opcodes_h_l3320_c7_4909 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_cond,
opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue,
opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse,
opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output);

-- jsr2_uxn_opcodes_h_l3320_c41_2dfc
jsr2_uxn_opcodes_h_l3320_c41_2dfc : entity work.jsr2_0CLK_3a9c1537 port map (
clk,
jsr2_uxn_opcodes_h_l3320_c41_2dfc_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3320_c41_2dfc_phase,
jsr2_uxn_opcodes_h_l3320_c41_2dfc_ins,
jsr2_uxn_opcodes_h_l3320_c41_2dfc_pc,
jsr2_uxn_opcodes_h_l3320_c41_2dfc_previous_stack_read,
jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_left,
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_right,
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89
opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_cond,
opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue,
opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse,
opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output);

-- sth_uxn_opcodes_h_l3321_c41_f246
sth_uxn_opcodes_h_l3321_c41_f246 : entity work.sth_0CLK_edc09f97 port map (
clk,
sth_uxn_opcodes_h_l3321_c41_f246_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3321_c41_f246_phase,
sth_uxn_opcodes_h_l3321_c41_f246_ins,
sth_uxn_opcodes_h_l3321_c41_f246_previous_stack_read,
sth_uxn_opcodes_h_l3321_c41_f246_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_left,
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_right,
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c
opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_cond,
opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output);

-- sth2_uxn_opcodes_h_l3322_c41_f138
sth2_uxn_opcodes_h_l3322_c41_f138 : entity work.sth2_0CLK_bbbe252c port map (
clk,
sth2_uxn_opcodes_h_l3322_c41_f138_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3322_c41_f138_phase,
sth2_uxn_opcodes_h_l3322_c41_f138_ins,
sth2_uxn_opcodes_h_l3322_c41_f138_previous_stack_read,
sth2_uxn_opcodes_h_l3322_c41_f138_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_left,
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_right,
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3323_c7_984b
opc_result_MUX_uxn_opcodes_h_l3323_c7_984b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_cond,
opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output);

-- ldz_uxn_opcodes_h_l3323_c41_31ce
ldz_uxn_opcodes_h_l3323_c41_31ce : entity work.ldz_0CLK_7c2e709f port map (
clk,
ldz_uxn_opcodes_h_l3323_c41_31ce_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3323_c41_31ce_phase,
ldz_uxn_opcodes_h_l3323_c41_31ce_ins,
ldz_uxn_opcodes_h_l3323_c41_31ce_previous_stack_read,
ldz_uxn_opcodes_h_l3323_c41_31ce_previous_ram_read,
ldz_uxn_opcodes_h_l3323_c41_31ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_left,
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_right,
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3324_c7_8785
opc_result_MUX_uxn_opcodes_h_l3324_c7_8785 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_cond,
opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue,
opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse,
opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output);

-- ldz2_uxn_opcodes_h_l3324_c41_8625
ldz2_uxn_opcodes_h_l3324_c41_8625 : entity work.ldz2_0CLK_9c3c4e32 port map (
clk,
ldz2_uxn_opcodes_h_l3324_c41_8625_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3324_c41_8625_phase,
ldz2_uxn_opcodes_h_l3324_c41_8625_ins,
ldz2_uxn_opcodes_h_l3324_c41_8625_previous_stack_read,
ldz2_uxn_opcodes_h_l3324_c41_8625_previous_ram_read,
ldz2_uxn_opcodes_h_l3324_c41_8625_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_left,
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_right,
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32
opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_cond,
opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue,
opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse,
opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output);

-- stz_uxn_opcodes_h_l3325_c41_dfce
stz_uxn_opcodes_h_l3325_c41_dfce : entity work.stz_0CLK_fd2391e7 port map (
clk,
stz_uxn_opcodes_h_l3325_c41_dfce_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3325_c41_dfce_phase,
stz_uxn_opcodes_h_l3325_c41_dfce_ins,
stz_uxn_opcodes_h_l3325_c41_dfce_previous_stack_read,
stz_uxn_opcodes_h_l3325_c41_dfce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_left,
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_right,
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c
opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_cond,
opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output);

-- stz2_uxn_opcodes_h_l3326_c41_02bf
stz2_uxn_opcodes_h_l3326_c41_02bf : entity work.stz2_0CLK_5ccafc54 port map (
clk,
stz2_uxn_opcodes_h_l3326_c41_02bf_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3326_c41_02bf_phase,
stz2_uxn_opcodes_h_l3326_c41_02bf_ins,
stz2_uxn_opcodes_h_l3326_c41_02bf_previous_stack_read,
stz2_uxn_opcodes_h_l3326_c41_02bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_left,
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_right,
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3327_c7_0981
opc_result_MUX_uxn_opcodes_h_l3327_c7_0981 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_cond,
opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue,
opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse,
opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output);

-- ldr_uxn_opcodes_h_l3327_c41_8d35
ldr_uxn_opcodes_h_l3327_c41_8d35 : entity work.ldr_0CLK_67fe881f port map (
clk,
ldr_uxn_opcodes_h_l3327_c41_8d35_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3327_c41_8d35_phase,
ldr_uxn_opcodes_h_l3327_c41_8d35_ins,
ldr_uxn_opcodes_h_l3327_c41_8d35_pc,
ldr_uxn_opcodes_h_l3327_c41_8d35_previous_stack_read,
ldr_uxn_opcodes_h_l3327_c41_8d35_previous_ram_read,
ldr_uxn_opcodes_h_l3327_c41_8d35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_left,
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_right,
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3328_c7_119b
opc_result_MUX_uxn_opcodes_h_l3328_c7_119b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_cond,
opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output);

-- ldr2_uxn_opcodes_h_l3328_c41_0192
ldr2_uxn_opcodes_h_l3328_c41_0192 : entity work.ldr2_0CLK_9c3c4e32 port map (
clk,
ldr2_uxn_opcodes_h_l3328_c41_0192_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3328_c41_0192_phase,
ldr2_uxn_opcodes_h_l3328_c41_0192_ins,
ldr2_uxn_opcodes_h_l3328_c41_0192_pc,
ldr2_uxn_opcodes_h_l3328_c41_0192_previous_stack_read,
ldr2_uxn_opcodes_h_l3328_c41_0192_previous_ram_read,
ldr2_uxn_opcodes_h_l3328_c41_0192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_left,
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_right,
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa
opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond,
opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output);

-- str1_uxn_opcodes_h_l3329_c41_2e5b
str1_uxn_opcodes_h_l3329_c41_2e5b : entity work.str1_0CLK_7c2e709f port map (
clk,
str1_uxn_opcodes_h_l3329_c41_2e5b_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3329_c41_2e5b_phase,
str1_uxn_opcodes_h_l3329_c41_2e5b_ins,
str1_uxn_opcodes_h_l3329_c41_2e5b_pc,
str1_uxn_opcodes_h_l3329_c41_2e5b_previous_stack_read,
str1_uxn_opcodes_h_l3329_c41_2e5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_left,
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_right,
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3330_c7_da23
opc_result_MUX_uxn_opcodes_h_l3330_c7_da23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_cond,
opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue,
opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse,
opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output);

-- str2_uxn_opcodes_h_l3330_c41_0be1
str2_uxn_opcodes_h_l3330_c41_0be1 : entity work.str2_0CLK_5ccafc54 port map (
clk,
str2_uxn_opcodes_h_l3330_c41_0be1_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3330_c41_0be1_phase,
str2_uxn_opcodes_h_l3330_c41_0be1_ins,
str2_uxn_opcodes_h_l3330_c41_0be1_pc,
str2_uxn_opcodes_h_l3330_c41_0be1_previous_stack_read,
str2_uxn_opcodes_h_l3330_c41_0be1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7
BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_left,
BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_right,
BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3331_c7_9862
opc_result_MUX_uxn_opcodes_h_l3331_c7_9862 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_cond,
opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue,
opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse,
opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output);

-- lda_uxn_opcodes_h_l3331_c41_821c
lda_uxn_opcodes_h_l3331_c41_821c : entity work.lda_0CLK_530245ca port map (
clk,
lda_uxn_opcodes_h_l3331_c41_821c_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3331_c41_821c_phase,
lda_uxn_opcodes_h_l3331_c41_821c_ins,
lda_uxn_opcodes_h_l3331_c41_821c_previous_stack_read,
lda_uxn_opcodes_h_l3331_c41_821c_previous_ram_read,
lda_uxn_opcodes_h_l3331_c41_821c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069
BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_left,
BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_right,
BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0
opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_cond,
opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output);

-- lda2_uxn_opcodes_h_l3332_c41_1b5f
lda2_uxn_opcodes_h_l3332_c41_1b5f : entity work.lda2_0CLK_c305f5e7 port map (
clk,
lda2_uxn_opcodes_h_l3332_c41_1b5f_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3332_c41_1b5f_phase,
lda2_uxn_opcodes_h_l3332_c41_1b5f_ins,
lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_stack_read,
lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_ram_read,
lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5
BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_left,
BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_right,
BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3333_c7_f417
opc_result_MUX_uxn_opcodes_h_l3333_c7_f417 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_cond,
opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue,
opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse,
opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output);

-- sta_uxn_opcodes_h_l3333_c41_4efc
sta_uxn_opcodes_h_l3333_c41_4efc : entity work.sta_0CLK_bbbe252c port map (
clk,
sta_uxn_opcodes_h_l3333_c41_4efc_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3333_c41_4efc_phase,
sta_uxn_opcodes_h_l3333_c41_4efc_ins,
sta_uxn_opcodes_h_l3333_c41_4efc_previous_stack_read,
sta_uxn_opcodes_h_l3333_c41_4efc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_left,
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_right,
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d
opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_cond,
opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output);

-- sta2_uxn_opcodes_h_l3334_c41_c62f
sta2_uxn_opcodes_h_l3334_c41_c62f : entity work.sta2_0CLK_37dbf2f3 port map (
clk,
sta2_uxn_opcodes_h_l3334_c41_c62f_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3334_c41_c62f_phase,
sta2_uxn_opcodes_h_l3334_c41_c62f_ins,
sta2_uxn_opcodes_h_l3334_c41_c62f_previous_stack_read,
sta2_uxn_opcodes_h_l3334_c41_c62f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_left,
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_right,
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3335_c7_097b
opc_result_MUX_uxn_opcodes_h_l3335_c7_097b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_cond,
opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output);

-- dei_uxn_opcodes_h_l3335_c41_28ab
dei_uxn_opcodes_h_l3335_c41_28ab : entity work.dei_0CLK_622ac75f port map (
clk,
dei_uxn_opcodes_h_l3335_c41_28ab_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3335_c41_28ab_phase,
dei_uxn_opcodes_h_l3335_c41_28ab_ins,
dei_uxn_opcodes_h_l3335_c41_28ab_previous_stack_read,
dei_uxn_opcodes_h_l3335_c41_28ab_previous_device_ram_read,
dei_uxn_opcodes_h_l3335_c41_28ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_left,
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_right,
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3336_c7_4174
opc_result_MUX_uxn_opcodes_h_l3336_c7_4174 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_cond,
opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue,
opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse,
opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output);

-- dei2_uxn_opcodes_h_l3336_c41_2974
dei2_uxn_opcodes_h_l3336_c41_2974 : entity work.dei2_0CLK_14a12093 port map (
clk,
dei2_uxn_opcodes_h_l3336_c41_2974_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3336_c41_2974_phase,
dei2_uxn_opcodes_h_l3336_c41_2974_ins,
dei2_uxn_opcodes_h_l3336_c41_2974_previous_stack_read,
dei2_uxn_opcodes_h_l3336_c41_2974_previous_device_ram_read,
dei2_uxn_opcodes_h_l3336_c41_2974_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_left,
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_right,
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84
opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_cond,
opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue,
opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse,
opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output);

-- deo_uxn_opcodes_h_l3337_c41_930a
deo_uxn_opcodes_h_l3337_c41_930a : entity work.deo_0CLK_52d54777 port map (
clk,
deo_uxn_opcodes_h_l3337_c41_930a_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3337_c41_930a_phase,
deo_uxn_opcodes_h_l3337_c41_930a_ins,
deo_uxn_opcodes_h_l3337_c41_930a_previous_stack_read,
deo_uxn_opcodes_h_l3337_c41_930a_previous_device_ram_read,
deo_uxn_opcodes_h_l3337_c41_930a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_left,
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_right,
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3338_c7_6609
opc_result_MUX_uxn_opcodes_h_l3338_c7_6609 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_cond,
opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue,
opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse,
opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output);

-- deo2_uxn_opcodes_h_l3338_c41_685e
deo2_uxn_opcodes_h_l3338_c41_685e : entity work.deo2_0CLK_3ae8bf4a port map (
clk,
deo2_uxn_opcodes_h_l3338_c41_685e_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3338_c41_685e_phase,
deo2_uxn_opcodes_h_l3338_c41_685e_ins,
deo2_uxn_opcodes_h_l3338_c41_685e_previous_stack_read,
deo2_uxn_opcodes_h_l3338_c41_685e_previous_device_ram_read,
deo2_uxn_opcodes_h_l3338_c41_685e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_left,
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_right,
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71
opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_cond,
opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue,
opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse,
opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output);

-- add_uxn_opcodes_h_l3339_c41_8d00
add_uxn_opcodes_h_l3339_c41_8d00 : entity work.add_0CLK_fd2391e7 port map (
clk,
add_uxn_opcodes_h_l3339_c41_8d00_CLOCK_ENABLE,
add_uxn_opcodes_h_l3339_c41_8d00_phase,
add_uxn_opcodes_h_l3339_c41_8d00_ins,
add_uxn_opcodes_h_l3339_c41_8d00_previous_stack_read,
add_uxn_opcodes_h_l3339_c41_8d00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_left,
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_right,
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3340_c7_f030
opc_result_MUX_uxn_opcodes_h_l3340_c7_f030 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_cond,
opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue,
opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse,
opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output);

-- add2_uxn_opcodes_h_l3340_c41_0117
add2_uxn_opcodes_h_l3340_c41_0117 : entity work.add2_0CLK_201aeef3 port map (
clk,
add2_uxn_opcodes_h_l3340_c41_0117_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3340_c41_0117_phase,
add2_uxn_opcodes_h_l3340_c41_0117_ins,
add2_uxn_opcodes_h_l3340_c41_0117_previous_stack_read,
add2_uxn_opcodes_h_l3340_c41_0117_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_left,
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_right,
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3341_c7_b221
opc_result_MUX_uxn_opcodes_h_l3341_c7_b221 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_cond,
opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue,
opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse,
opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output);

-- sub_uxn_opcodes_h_l3341_c41_a55d
sub_uxn_opcodes_h_l3341_c41_a55d : entity work.sub_0CLK_fd2391e7 port map (
clk,
sub_uxn_opcodes_h_l3341_c41_a55d_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3341_c41_a55d_phase,
sub_uxn_opcodes_h_l3341_c41_a55d_ins,
sub_uxn_opcodes_h_l3341_c41_a55d_previous_stack_read,
sub_uxn_opcodes_h_l3341_c41_a55d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_left,
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_right,
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3342_c7_6877
opc_result_MUX_uxn_opcodes_h_l3342_c7_6877 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_cond,
opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue,
opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse,
opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output);

-- sub2_uxn_opcodes_h_l3342_c41_3930
sub2_uxn_opcodes_h_l3342_c41_3930 : entity work.sub2_0CLK_201aeef3 port map (
clk,
sub2_uxn_opcodes_h_l3342_c41_3930_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3342_c41_3930_phase,
sub2_uxn_opcodes_h_l3342_c41_3930_ins,
sub2_uxn_opcodes_h_l3342_c41_3930_previous_stack_read,
sub2_uxn_opcodes_h_l3342_c41_3930_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_left,
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_right,
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9
opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_cond,
opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output);

-- mul_uxn_opcodes_h_l3343_c41_038e
mul_uxn_opcodes_h_l3343_c41_038e : entity work.mul_0CLK_fd2391e7 port map (
clk,
mul_uxn_opcodes_h_l3343_c41_038e_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3343_c41_038e_phase,
mul_uxn_opcodes_h_l3343_c41_038e_ins,
mul_uxn_opcodes_h_l3343_c41_038e_previous_stack_read,
mul_uxn_opcodes_h_l3343_c41_038e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_left,
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_right,
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56
opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_cond,
opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue,
opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse,
opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output);

-- mul2_uxn_opcodes_h_l3344_c41_128f
mul2_uxn_opcodes_h_l3344_c41_128f : entity work.mul2_0CLK_201aeef3 port map (
clk,
mul2_uxn_opcodes_h_l3344_c41_128f_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3344_c41_128f_phase,
mul2_uxn_opcodes_h_l3344_c41_128f_ins,
mul2_uxn_opcodes_h_l3344_c41_128f_previous_stack_read,
mul2_uxn_opcodes_h_l3344_c41_128f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_left,
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_right,
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3345_c7_d759
opc_result_MUX_uxn_opcodes_h_l3345_c7_d759 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_cond,
opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue,
opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse,
opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output);

-- div_uxn_opcodes_h_l3345_c41_2d1a
div_uxn_opcodes_h_l3345_c41_2d1a : entity work.div_0CLK_f6fa2c7d port map (
clk,
div_uxn_opcodes_h_l3345_c41_2d1a_CLOCK_ENABLE,
div_uxn_opcodes_h_l3345_c41_2d1a_phase,
div_uxn_opcodes_h_l3345_c41_2d1a_ins,
div_uxn_opcodes_h_l3345_c41_2d1a_previous_stack_read,
div_uxn_opcodes_h_l3345_c41_2d1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_left,
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_right,
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9
opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond,
opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output);

-- div2_uxn_opcodes_h_l3346_c41_bd4f
div2_uxn_opcodes_h_l3346_c41_bd4f : entity work.div2_0CLK_444c40b9 port map (
clk,
div2_uxn_opcodes_h_l3346_c41_bd4f_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3346_c41_bd4f_phase,
div2_uxn_opcodes_h_l3346_c41_bd4f_ins,
div2_uxn_opcodes_h_l3346_c41_bd4f_previous_stack_read,
div2_uxn_opcodes_h_l3346_c41_bd4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_left,
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_right,
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c
opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_cond,
opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output);

-- and_uxn_opcodes_h_l3347_c41_9811
and_uxn_opcodes_h_l3347_c41_9811 : entity work.and_0CLK_fd2391e7 port map (
clk,
and_uxn_opcodes_h_l3347_c41_9811_CLOCK_ENABLE,
and_uxn_opcodes_h_l3347_c41_9811_phase,
and_uxn_opcodes_h_l3347_c41_9811_ins,
and_uxn_opcodes_h_l3347_c41_9811_previous_stack_read,
and_uxn_opcodes_h_l3347_c41_9811_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_left,
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_right,
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3348_c7_9583
opc_result_MUX_uxn_opcodes_h_l3348_c7_9583 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_cond,
opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue,
opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse,
opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output);

-- and2_uxn_opcodes_h_l3348_c41_66f2
and2_uxn_opcodes_h_l3348_c41_66f2 : entity work.and2_0CLK_201aeef3 port map (
clk,
and2_uxn_opcodes_h_l3348_c41_66f2_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3348_c41_66f2_phase,
and2_uxn_opcodes_h_l3348_c41_66f2_ins,
and2_uxn_opcodes_h_l3348_c41_66f2_previous_stack_read,
and2_uxn_opcodes_h_l3348_c41_66f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_left,
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_right,
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7
opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_cond,
opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output);

-- ora_uxn_opcodes_h_l3349_c41_6ac0
ora_uxn_opcodes_h_l3349_c41_6ac0 : entity work.ora_0CLK_fd2391e7 port map (
clk,
ora_uxn_opcodes_h_l3349_c41_6ac0_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3349_c41_6ac0_phase,
ora_uxn_opcodes_h_l3349_c41_6ac0_ins,
ora_uxn_opcodes_h_l3349_c41_6ac0_previous_stack_read,
ora_uxn_opcodes_h_l3349_c41_6ac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_left,
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_right,
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b
opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_cond,
opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output);

-- ora2_uxn_opcodes_h_l3350_c41_a6b8
ora2_uxn_opcodes_h_l3350_c41_a6b8 : entity work.ora2_0CLK_201aeef3 port map (
clk,
ora2_uxn_opcodes_h_l3350_c41_a6b8_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3350_c41_a6b8_phase,
ora2_uxn_opcodes_h_l3350_c41_a6b8_ins,
ora2_uxn_opcodes_h_l3350_c41_a6b8_previous_stack_read,
ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_left,
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_right,
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00
opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_cond,
opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue,
opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse,
opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output);

-- eor_uxn_opcodes_h_l3351_c41_9d63
eor_uxn_opcodes_h_l3351_c41_9d63 : entity work.eor_0CLK_fd2391e7 port map (
clk,
eor_uxn_opcodes_h_l3351_c41_9d63_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3351_c41_9d63_phase,
eor_uxn_opcodes_h_l3351_c41_9d63_ins,
eor_uxn_opcodes_h_l3351_c41_9d63_previous_stack_read,
eor_uxn_opcodes_h_l3351_c41_9d63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_left,
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_right,
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3352_c7_a342
opc_result_MUX_uxn_opcodes_h_l3352_c7_a342 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_cond,
opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue,
opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse,
opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output);

-- eor2_uxn_opcodes_h_l3352_c41_274e
eor2_uxn_opcodes_h_l3352_c41_274e : entity work.eor2_0CLK_201aeef3 port map (
clk,
eor2_uxn_opcodes_h_l3352_c41_274e_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3352_c41_274e_phase,
eor2_uxn_opcodes_h_l3352_c41_274e_ins,
eor2_uxn_opcodes_h_l3352_c41_274e_previous_stack_read,
eor2_uxn_opcodes_h_l3352_c41_274e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_left,
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_right,
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3353_c7_4603
opc_result_MUX_uxn_opcodes_h_l3353_c7_4603 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_cond,
opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue,
opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse,
opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output);

-- sft_uxn_opcodes_h_l3353_c41_2433
sft_uxn_opcodes_h_l3353_c41_2433 : entity work.sft_0CLK_f7a3ea45 port map (
clk,
sft_uxn_opcodes_h_l3353_c41_2433_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3353_c41_2433_phase,
sft_uxn_opcodes_h_l3353_c41_2433_ins,
sft_uxn_opcodes_h_l3353_c41_2433_previous_stack_read,
sft_uxn_opcodes_h_l3353_c41_2433_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_left,
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_right,
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8
opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_cond,
opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output);

-- sft2_uxn_opcodes_h_l3354_c41_df30
sft2_uxn_opcodes_h_l3354_c41_df30 : entity work.sft2_0CLK_d29b8e2d port map (
clk,
sft2_uxn_opcodes_h_l3354_c41_df30_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3354_c41_df30_phase,
sft2_uxn_opcodes_h_l3354_c41_df30_ins,
sft2_uxn_opcodes_h_l3354_c41_df30_previous_stack_read,
sft2_uxn_opcodes_h_l3354_c41_df30_return_output);

-- printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed
printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed : entity work.printf_uxn_opcodes_h_l3355_c9_d3ed_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_arg0);

-- sp0_MUX_uxn_opcodes_h_l3357_c2_20b3
sp0_MUX_uxn_opcodes_h_l3357_c2_20b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_cond,
sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue,
sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse,
sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output);

-- sp1_MUX_uxn_opcodes_h_l3357_c2_20b3
sp1_MUX_uxn_opcodes_h_l3357_c2_20b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_cond,
sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue,
sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse,
sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output);

-- sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8
sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond,
sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue,
sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse,
sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output);

-- sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8
sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond,
sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue,
sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse,
sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169
BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_left,
BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_right,
BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc
BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_left,
BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_right,
BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output);

-- MUX_uxn_opcodes_h_l3367_c19_3bbe
MUX_uxn_opcodes_h_l3367_c19_3bbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3367_c19_3bbe_cond,
MUX_uxn_opcodes_h_l3367_c19_3bbe_iftrue,
MUX_uxn_opcodes_h_l3367_c19_3bbe_iffalse,
MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f
BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_left,
BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_right,
BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1
UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_expr,
UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output);

-- stack_ram_update_uxn_opcodes_h_l3370_c21_db75
stack_ram_update_uxn_opcodes_h_l3370_c21_db75 : entity work.stack_ram_update_0CLK_bdb363bb port map (
clk,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_stack_index,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address0,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_value,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_enable,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read0_enable,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address1,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read1_enable,
stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output);

-- device_ram_update_uxn_opcodes_h_l3380_c26_efde
device_ram_update_uxn_opcodes_h_l3380_c26_efde : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_address0,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_value,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_enable,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_read0_enable,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_address1,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_read1_enable,
device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output,
 CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output,
 MUX_uxn_opcodes_h_l3280_c10_955c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output,
 MUX_uxn_opcodes_h_l3281_c18_fe36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output,
 opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output,
 jci_uxn_opcodes_h_l3286_c41_d0ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output,
 jmi_uxn_opcodes_h_l3287_c41_5f67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output,
 jsi_uxn_opcodes_h_l3288_c41_4780_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output,
 lit_uxn_opcodes_h_l3289_c41_a121_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output,
 opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output,
 lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output,
 lit_uxn_opcodes_h_l3291_c41_d8f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output,
 lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output,
 opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output,
 inc_uxn_opcodes_h_l3293_c41_07b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output,
 inc2_uxn_opcodes_h_l3294_c41_ee16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output,
 pop_uxn_opcodes_h_l3295_c41_a827_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output,
 pop2_uxn_opcodes_h_l3296_c41_3741_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output,
 opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output,
 nip_uxn_opcodes_h_l3297_c41_a999_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output,
 nip2_uxn_opcodes_h_l3298_c41_e087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output,
 opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output,
 swp_uxn_opcodes_h_l3299_c41_4081_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output,
 opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output,
 swp2_uxn_opcodes_h_l3300_c41_5f05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output,
 opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output,
 rot_uxn_opcodes_h_l3301_c41_6a1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output,
 opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output,
 rot2_uxn_opcodes_h_l3302_c41_573d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output,
 opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output,
 dup_uxn_opcodes_h_l3303_c41_0369_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output,
 dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output,
 ovr_uxn_opcodes_h_l3305_c41_ece5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output,
 opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output,
 ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output,
 equ_uxn_opcodes_h_l3307_c41_bddb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output,
 opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output,
 equ2_uxn_opcodes_h_l3308_c41_9649_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output,
 neq_uxn_opcodes_h_l3309_c41_50ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output,
 neq2_uxn_opcodes_h_l3310_c41_7829_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output,
 opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output,
 gth_uxn_opcodes_h_l3311_c41_3fe2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output,
 gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output,
 lth_uxn_opcodes_h_l3313_c41_639f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output,
 lth2_uxn_opcodes_h_l3314_c41_da07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output,
 jmp_uxn_opcodes_h_l3315_c41_f353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output,
 jmp2_uxn_opcodes_h_l3316_c41_996f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output,
 jcn_uxn_opcodes_h_l3317_c41_7882_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output,
 opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output,
 jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output,
 opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output,
 jsr_uxn_opcodes_h_l3319_c41_0645_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output,
 opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output,
 jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output,
 sth_uxn_opcodes_h_l3321_c41_f246_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output,
 sth2_uxn_opcodes_h_l3322_c41_f138_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output,
 opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output,
 ldz_uxn_opcodes_h_l3323_c41_31ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output,
 opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output,
 ldz2_uxn_opcodes_h_l3324_c41_8625_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output,
 stz_uxn_opcodes_h_l3325_c41_dfce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output,
 opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output,
 stz2_uxn_opcodes_h_l3326_c41_02bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output,
 ldr_uxn_opcodes_h_l3327_c41_8d35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output,
 ldr2_uxn_opcodes_h_l3328_c41_0192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output,
 opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output,
 str1_uxn_opcodes_h_l3329_c41_2e5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output,
 opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output,
 str2_uxn_opcodes_h_l3330_c41_0be1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output,
 lda_uxn_opcodes_h_l3331_c41_821c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output,
 opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output,
 lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output,
 sta_uxn_opcodes_h_l3333_c41_4efc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output,
 sta2_uxn_opcodes_h_l3334_c41_c62f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output,
 opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output,
 dei_uxn_opcodes_h_l3335_c41_28ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output,
 opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output,
 dei2_uxn_opcodes_h_l3336_c41_2974_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output,
 opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output,
 deo_uxn_opcodes_h_l3337_c41_930a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output,
 opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output,
 deo2_uxn_opcodes_h_l3338_c41_685e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output,
 opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output,
 add_uxn_opcodes_h_l3339_c41_8d00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output,
 opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output,
 add2_uxn_opcodes_h_l3340_c41_0117_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output,
 opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output,
 sub_uxn_opcodes_h_l3341_c41_a55d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output,
 sub2_uxn_opcodes_h_l3342_c41_3930_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output,
 opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output,
 mul_uxn_opcodes_h_l3343_c41_038e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output,
 opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output,
 mul2_uxn_opcodes_h_l3344_c41_128f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output,
 div_uxn_opcodes_h_l3345_c41_2d1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output,
 div2_uxn_opcodes_h_l3346_c41_bd4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output,
 opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output,
 and_uxn_opcodes_h_l3347_c41_9811_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output,
 and2_uxn_opcodes_h_l3348_c41_66f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output,
 ora_uxn_opcodes_h_l3349_c41_6ac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output,
 opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output,
 ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output,
 opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output,
 eor_uxn_opcodes_h_l3351_c41_9d63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output,
 opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output,
 eor2_uxn_opcodes_h_l3352_c41_274e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output,
 sft_uxn_opcodes_h_l3353_c41_2433_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output,
 sft2_uxn_opcodes_h_l3354_c41_df30_return_output,
 sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output,
 sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output,
 sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output,
 sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output,
 MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output,
 stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output,
 device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3280_c2_009b : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3280_c10_955c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3280_c10_955c_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3280_c10_955c_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3280_c30_159f_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3280_c57_3cab_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3280_c10_955c_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3285_c2_a9cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3288_c41_4780_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3288_c41_4780_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3288_c41_4780_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3288_c41_4780_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3288_c41_4780_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3289_c41_a121_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3289_c41_a121_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3289_c41_a121_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3289_c41_a121_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3289_c41_a121_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3293_c41_07b0_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3293_c41_07b0_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3293_c41_07b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3293_c41_07b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3293_c41_07b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3295_c41_a827_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3295_c41_a827_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3295_c41_a827_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3295_c41_a827_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3296_c41_3741_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3296_c41_3741_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3296_c41_3741_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3296_c41_3741_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3297_c41_a999_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3297_c41_a999_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3297_c41_a999_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3297_c41_a999_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3297_c41_a999_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3298_c41_e087_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3298_c41_e087_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3298_c41_e087_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3298_c41_e087_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3298_c41_e087_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3299_c41_4081_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3299_c41_4081_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3299_c41_4081_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3299_c41_4081_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3299_c41_4081_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3302_c41_573d_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3302_c41_573d_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3302_c41_573d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3302_c41_573d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3302_c41_573d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3303_c41_0369_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3303_c41_0369_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3303_c41_0369_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3303_c41_0369_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3303_c41_0369_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3307_c41_bddb_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3307_c41_bddb_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3307_c41_bddb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3307_c41_bddb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3307_c41_bddb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3308_c41_9649_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3308_c41_9649_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3308_c41_9649_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3308_c41_9649_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3308_c41_9649_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3309_c41_50ff_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3309_c41_50ff_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3309_c41_50ff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3309_c41_50ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3309_c41_50ff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3310_c41_7829_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3310_c41_7829_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3310_c41_7829_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3310_c41_7829_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3310_c41_7829_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3313_c41_639f_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3313_c41_639f_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3313_c41_639f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3313_c41_639f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3313_c41_639f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3314_c41_da07_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3314_c41_da07_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3314_c41_da07_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3314_c41_da07_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3314_c41_da07_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3315_c41_f353_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3315_c41_f353_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3315_c41_f353_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3315_c41_f353_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3315_c41_f353_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3315_c41_f353_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3317_c41_7882_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3317_c41_7882_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3317_c41_7882_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3317_c41_7882_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3317_c41_7882_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3317_c41_7882_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3319_c41_0645_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3319_c41_0645_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3319_c41_0645_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3319_c41_0645_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3319_c41_0645_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3319_c41_0645_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3321_c41_f246_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3321_c41_f246_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3321_c41_f246_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3321_c41_f246_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3321_c41_f246_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3322_c41_f138_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3322_c41_f138_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3322_c41_f138_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3322_c41_f138_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3322_c41_f138_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3325_c41_dfce_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3325_c41_dfce_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3325_c41_dfce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3325_c41_dfce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3325_c41_dfce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3330_c41_0be1_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3330_c41_0be1_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3330_c41_0be1_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3330_c41_0be1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3330_c41_0be1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3330_c41_0be1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3331_c41_821c_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3331_c41_821c_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3331_c41_821c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3331_c41_821c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3331_c41_821c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3331_c41_821c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3333_c41_4efc_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3333_c41_4efc_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3333_c41_4efc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3333_c41_4efc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3333_c41_4efc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3335_c41_28ab_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3335_c41_28ab_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3335_c41_28ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3335_c41_28ab_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3335_c41_28ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3335_c41_28ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3336_c41_2974_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3336_c41_2974_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3336_c41_2974_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3336_c41_2974_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3336_c41_2974_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3336_c41_2974_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3337_c41_930a_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3337_c41_930a_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3337_c41_930a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3337_c41_930a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3337_c41_930a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3337_c41_930a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3338_c41_685e_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3338_c41_685e_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3338_c41_685e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3338_c41_685e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3338_c41_685e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3338_c41_685e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3339_c41_8d00_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3339_c41_8d00_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3339_c41_8d00_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3339_c41_8d00_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3339_c41_8d00_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3340_c41_0117_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3340_c41_0117_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3340_c41_0117_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3340_c41_0117_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3340_c41_0117_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3341_c41_a55d_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3341_c41_a55d_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3341_c41_a55d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3341_c41_a55d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3341_c41_a55d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3342_c41_3930_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3342_c41_3930_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3342_c41_3930_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3342_c41_3930_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3342_c41_3930_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3343_c41_038e_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3343_c41_038e_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3343_c41_038e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3343_c41_038e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3343_c41_038e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3344_c41_128f_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3344_c41_128f_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3344_c41_128f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3344_c41_128f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3344_c41_128f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3345_c41_2d1a_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3345_c41_2d1a_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3345_c41_2d1a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3345_c41_2d1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3345_c41_2d1a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3347_c41_9811_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3347_c41_9811_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3347_c41_9811_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3347_c41_9811_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3347_c41_9811_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3348_c41_66f2_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3348_c41_66f2_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3348_c41_66f2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3348_c41_66f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3348_c41_66f2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3351_c41_9d63_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3351_c41_9d63_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3351_c41_9d63_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3351_c41_9d63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3351_c41_9d63_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3352_c41_274e_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3352_c41_274e_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3352_c41_274e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3352_c41_274e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3352_c41_274e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3353_c41_2433_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3353_c41_2433_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3353_c41_2433_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3353_c41_2433_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3353_c41_2433_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3354_c41_df30_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3354_c41_df30_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3354_c41_df30_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3354_c41_df30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3354_c41_df30_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3357_c6_2339_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3361_c4_dae8 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3359_c4_8b98 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3365_c18_430f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3366_c19_67a5_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3367_c2_fc77 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3367_c82_400c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3368_c22_e42a_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l3370_c2_8a2c : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_stack_index : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address0 : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address1 : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read1_enable : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l3380_c2_a7bb : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3382_c3_43de_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3383_c3_f85c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3386_c3_64a7_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3389_c34_5f46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3390_c23_a3b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l3391_c32_1fed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3392_c33_96dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3393_c29_2741_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3394_c30_d5ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3395_c34_af2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3396_c33_0e71_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3397_c31_5eaa_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3398_c32_8875_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3371_l3358_l3367_DUPLICATE_f366_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3361_l3359_DUPLICATE_98e6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3385_l3381_DUPLICATE_e1c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3400_l3263_DUPLICATE_3605_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_right := to_unsigned(20, 5);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_right := to_unsigned(51, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_right := to_unsigned(27, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_right := to_unsigned(31, 5);
     VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_right := to_unsigned(3072, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_right := to_unsigned(54, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_right := to_unsigned(64, 7);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_right := to_unsigned(1024, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_right := to_unsigned(47, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue := to_unsigned(0, 1);
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_right := to_unsigned(43, 6);
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_right := to_unsigned(55, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_right := to_unsigned(29, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_right := to_unsigned(23, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3336_c41_2974_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3335_c41_28ab_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3338_c41_685e_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3337_c41_930a_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3340_c41_0117_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3339_c41_8d00_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3348_c41_66f2_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3347_c41_9811_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3336_c41_2974_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3335_c41_28ab_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3338_c41_685e_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3337_c41_930a_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3345_c41_2d1a_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3303_c41_0369_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3352_c41_274e_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3351_c41_9d63_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3308_c41_9649_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3307_c41_bddb_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3293_c41_07b0_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3317_c41_7882_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3315_c41_f353_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3319_c41_0645_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3331_c41_821c_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3314_c41_da07_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3313_c41_639f_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3344_c41_128f_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3343_c41_038e_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3310_c41_7829_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3309_c41_50ff_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3298_c41_e087_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3297_c41_a999_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3296_c41_3741_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3295_c41_a827_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3302_c41_573d_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3354_c41_df30_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3353_c41_2433_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3333_c41_4efc_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3322_c41_f138_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3321_c41_f246_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3330_c41_0be1_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3325_c41_dfce_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3342_c41_3930_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3341_c41_a55d_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3299_c41_4081_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3317_c41_7882_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3315_c41_f353_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3288_c41_4780_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3319_c41_0645_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3289_c41_a121_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3330_c41_0be1_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3340_c41_0117_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3339_c41_8d00_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3348_c41_66f2_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3347_c41_9811_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3336_c41_2974_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3335_c41_28ab_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3338_c41_685e_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3337_c41_930a_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3345_c41_2d1a_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3303_c41_0369_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3352_c41_274e_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3351_c41_9d63_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3308_c41_9649_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3307_c41_bddb_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3293_c41_07b0_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3317_c41_7882_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3315_c41_f353_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3288_c41_4780_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3319_c41_0645_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3331_c41_821c_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3289_c41_a121_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3314_c41_da07_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3313_c41_639f_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3344_c41_128f_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3343_c41_038e_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3310_c41_7829_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3309_c41_50ff_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3298_c41_e087_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3297_c41_a999_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3296_c41_3741_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3295_c41_a827_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3302_c41_573d_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3354_c41_df30_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3353_c41_2433_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3333_c41_4efc_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3322_c41_f138_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3321_c41_f246_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3330_c41_0be1_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3325_c41_dfce_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3342_c41_3930_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3341_c41_a55d_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3299_c41_4081_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3288_c41_4780_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3331_c41_821c_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3289_c41_a121_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3340_c41_0117_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3339_c41_8d00_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3348_c41_66f2_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3347_c41_9811_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3336_c41_2974_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3335_c41_28ab_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3338_c41_685e_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3337_c41_930a_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3345_c41_2d1a_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3303_c41_0369_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3352_c41_274e_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3351_c41_9d63_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3308_c41_9649_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3307_c41_bddb_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3293_c41_07b0_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3317_c41_7882_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3315_c41_f353_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3319_c41_0645_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3331_c41_821c_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3314_c41_da07_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3313_c41_639f_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3344_c41_128f_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3343_c41_038e_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3310_c41_7829_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3309_c41_50ff_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3298_c41_e087_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3297_c41_a999_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3302_c41_573d_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3354_c41_df30_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3353_c41_2433_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3333_c41_4efc_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3322_c41_f138_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3321_c41_f246_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3330_c41_0be1_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3325_c41_dfce_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3342_c41_3930_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3341_c41_a55d_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3299_c41_4081_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l3280_c41_f72d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_left;
     BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output := BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3280_c57_3cab] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3280_c57_3cab_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3281_c18_c754] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_left;
     BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output := BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3280_c10_5f72] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_left;
     BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output := BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3285_c2_a9cd] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3285_c2_a9cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c10_5f72_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3281_c18_c754_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3280_c57_3cab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3285_c2_a9cd_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l3280_c10_8b1f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_left;
     BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output := BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l3280_c57_3eb9] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output := CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3280_c30_159f] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3280_c30_159f_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3280_c41_f72d_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3281_c18_8449] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_left;
     BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output := BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3280_c10_955c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3280_c10_8b1f_return_output;
     VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3281_c18_8449_return_output;
     VAR_MUX_uxn_opcodes_h_l3280_c10_955c_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3280_c30_159f_return_output;
     VAR_MUX_uxn_opcodes_h_l3280_c10_955c_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3280_c57_3eb9_return_output;
     -- MUX[uxn_opcodes_h_l3281_c18_fe36] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3281_c18_fe36_cond <= VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_cond;
     MUX_uxn_opcodes_h_l3281_c18_fe36_iftrue <= VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_iftrue;
     MUX_uxn_opcodes_h_l3281_c18_fe36_iffalse <= VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_return_output := MUX_uxn_opcodes_h_l3281_c18_fe36_return_output;

     -- MUX[uxn_opcodes_h_l3280_c10_955c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3280_c10_955c_cond <= VAR_MUX_uxn_opcodes_h_l3280_c10_955c_cond;
     MUX_uxn_opcodes_h_l3280_c10_955c_iftrue <= VAR_MUX_uxn_opcodes_h_l3280_c10_955c_iftrue;
     MUX_uxn_opcodes_h_l3280_c10_955c_iffalse <= VAR_MUX_uxn_opcodes_h_l3280_c10_955c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3280_c10_955c_return_output := MUX_uxn_opcodes_h_l3280_c10_955c_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3280_c2_009b := VAR_MUX_uxn_opcodes_h_l3280_c10_955c_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_left := VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l3281_c18_fe36_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_left := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3280_c2_009b;
     VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg1 := resize(VAR_opc_uxn_opcodes_h_l3280_c2_009b, 32);
     VAR_printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_arg0 := resize(VAR_opc_uxn_opcodes_h_l3280_c2_009b, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3305_c11_8d04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_left;
     BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output := BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3303_c11_4ff8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3311_c11_10e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3294_c11_ff67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_left;
     BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output := BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3334_c11_2e7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3350_c11_03ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3290_c11_7971] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_left;
     BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output := BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3335_c11_1f80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_left;
     BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output := BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3339_c11_fe77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_left;
     BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output := BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3307_c11_e357] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_left;
     BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output := BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3288_c11_8bb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3332_c11_c069] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_left;
     BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output := BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3300_c11_d589] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_left;
     BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output := BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3325_c11_adcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3353_c11_bfe3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3347_c11_81c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3296_c11_2ecb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3345_c11_5fc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3352_c11_d430] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_left;
     BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output := BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3327_c11_d351] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_left;
     BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output := BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3292_c11_7f35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_left;
     BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output := BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output;

     -- printf_uxn_opcodes_h_l3283_c2_4188[uxn_opcodes_h_l3283_c2_4188] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg0 <= VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg0;
     printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg1 <= VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg1;
     printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg2 <= VAR_printf_uxn_opcodes_h_l3283_c2_4188_uxn_opcodes_h_l3283_c2_4188_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3344_c11_d1cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3293_c11_2ecf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3341_c11_b8bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3323_c11_4a56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_left;
     BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output := BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3285_c6_9247] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_left;
     BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output := BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3330_c11_e999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_left;
     BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output := BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3315_c11_11ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3340_c11_f9c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3318_c11_0986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_left;
     BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output := BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3348_c11_6e69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_left;
     BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output := BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3354_c11_9ea2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3316_c11_a4fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3343_c11_588d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3298_c11_33f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3297_c11_607f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3299_c11_886c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3312_c11_2057] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_left;
     BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output := BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3329_c11_57b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3338_c11_3001] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_left;
     BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output := BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3301_c11_b912] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_left;
     BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output := BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3314_c11_ef6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3351_c11_346c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3337_c11_c1ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3306_c11_eb74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_left;
     BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output := BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3302_c11_7131] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_left;
     BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output := BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3331_c11_e0a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3310_c11_5f79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_left;
     BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output := BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3319_c11_c145] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_left;
     BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output := BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3286_c11_0b78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_left;
     BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output := BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3309_c11_69cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3322_c11_6233] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_left;
     BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output := BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3349_c11_f83a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3342_c11_f03c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3313_c11_60c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3304_c11_2a52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_left;
     BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output := BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3287_c11_1e79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_left;
     BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output := BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3291_c11_aeb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3336_c11_9224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_left;
     BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output := BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3289_c11_8374] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_left;
     BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output := BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3328_c11_b155] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_left;
     BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output := BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3333_c11_5df5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3324_c11_9011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_left;
     BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output := BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3321_c11_45b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3326_c11_0efa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3346_c11_4d28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_left;
     BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output := BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3320_c11_5e75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_left;
     BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output := BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3308_c11_b762] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_left;
     BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output := BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3317_c11_29a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3295_c11_8ca5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c6_9247_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_0b78_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_1e79_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_8bb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_8374_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_7971_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_aeb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_7f35_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_2ecf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ff67_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_8ca5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_2ecb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_607f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_33f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_886c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_d589_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_b912_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_7131_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_4ff8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_2a52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_8d04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_eb74_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_e357_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_b762_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_69cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_5f79_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_10e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_2057_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_60c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_ef6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_11ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_a4fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_29a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_0986_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_c145_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_5e75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_45b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_6233_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_4a56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_9011_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_adcf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_0efa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_d351_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_b155_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_57b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_e999_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3331_c11_e0a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3332_c11_c069_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c11_5df5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_2e7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_1f80_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_9224_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_c1ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_3001_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_fe77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_f9c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_b8bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_f03c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_588d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_d1cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_5fc3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_4d28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_81c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6e69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_f83a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_03ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_346c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_d430_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_bfe3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_9ea2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c7_2e01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c7_f7eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c1_482e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output;
     VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_482e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c1_d950] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output;

     -- jci[uxn_opcodes_h_l3286_c41_d0ad] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3286_c41_d0ad_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3286_c41_d0ad_phase <= VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_phase;
     jci_uxn_opcodes_h_l3286_c41_d0ad_pc <= VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_pc;
     jci_uxn_opcodes_h_l3286_c41_d0ad_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_previous_stack_read;
     jci_uxn_opcodes_h_l3286_c41_d0ad_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_return_output := jci_uxn_opcodes_h_l3286_c41_d0ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c7_ebf7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output;
     VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_d950_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue := VAR_jci_uxn_opcodes_h_l3286_c41_d0ad_return_output;
     -- jmi[uxn_opcodes_h_l3287_c41_5f67] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3287_c41_5f67_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3287_c41_5f67_phase <= VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_phase;
     jmi_uxn_opcodes_h_l3287_c41_5f67_pc <= VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_pc;
     jmi_uxn_opcodes_h_l3287_c41_5f67_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_return_output := jmi_uxn_opcodes_h_l3287_c41_5f67_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c1_e874] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c7_b3a3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output;
     VAR_jsi_uxn_opcodes_h_l3288_c41_4780_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_e874_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue := VAR_jmi_uxn_opcodes_h_l3287_c41_5f67_return_output;
     -- jsi[uxn_opcodes_h_l3288_c41_4780] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3288_c41_4780_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3288_c41_4780_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3288_c41_4780_phase <= VAR_jsi_uxn_opcodes_h_l3288_c41_4780_phase;
     jsi_uxn_opcodes_h_l3288_c41_4780_pc <= VAR_jsi_uxn_opcodes_h_l3288_c41_4780_pc;
     jsi_uxn_opcodes_h_l3288_c41_4780_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3288_c41_4780_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3288_c41_4780_return_output := jsi_uxn_opcodes_h_l3288_c41_4780_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c1_4b7c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c7_dd9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output;
     VAR_lit_uxn_opcodes_h_l3289_c41_a121_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_4b7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue := VAR_jsi_uxn_opcodes_h_l3288_c41_4780_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c7_0181] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output;

     -- lit[uxn_opcodes_h_l3289_c41_a121] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3289_c41_a121_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3289_c41_a121_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3289_c41_a121_phase <= VAR_lit_uxn_opcodes_h_l3289_c41_a121_phase;
     lit_uxn_opcodes_h_l3289_c41_a121_pc <= VAR_lit_uxn_opcodes_h_l3289_c41_a121_pc;
     lit_uxn_opcodes_h_l3289_c41_a121_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3289_c41_a121_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3289_c41_a121_return_output := lit_uxn_opcodes_h_l3289_c41_a121_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c1_787e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_0181_return_output;
     VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_787e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue := VAR_lit_uxn_opcodes_h_l3289_c41_a121_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c1_f6bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c7_0be9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output;

     -- lit2[uxn_opcodes_h_l3290_c41_4ff6] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3290_c41_4ff6_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3290_c41_4ff6_phase <= VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_phase;
     lit2_uxn_opcodes_h_l3290_c41_4ff6_pc <= VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_pc;
     lit2_uxn_opcodes_h_l3290_c41_4ff6_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output := lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output;
     VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_f6bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue := VAR_lit2_uxn_opcodes_h_l3290_c41_4ff6_return_output;
     -- lit[uxn_opcodes_h_l3291_c41_d8f4] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3291_c41_d8f4_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3291_c41_d8f4_phase <= VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_phase;
     lit_uxn_opcodes_h_l3291_c41_d8f4_pc <= VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_pc;
     lit_uxn_opcodes_h_l3291_c41_d8f4_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_return_output := lit_uxn_opcodes_h_l3291_c41_d8f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c7_a1c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c1_1bca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output;
     VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_1bca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue := VAR_lit_uxn_opcodes_h_l3291_c41_d8f4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c7_2464] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c1_c08b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output;

     -- lit2[uxn_opcodes_h_l3292_c41_e1f4] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3292_c41_e1f4_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3292_c41_e1f4_phase <= VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_phase;
     lit2_uxn_opcodes_h_l3292_c41_e1f4_pc <= VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_pc;
     lit2_uxn_opcodes_h_l3292_c41_e1f4_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output := lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_2464_return_output;
     VAR_inc_uxn_opcodes_h_l3293_c41_07b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_c08b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue := VAR_lit2_uxn_opcodes_h_l3292_c41_e1f4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c7_72cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output;

     -- inc[uxn_opcodes_h_l3293_c41_07b0] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3293_c41_07b0_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3293_c41_07b0_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3293_c41_07b0_phase <= VAR_inc_uxn_opcodes_h_l3293_c41_07b0_phase;
     inc_uxn_opcodes_h_l3293_c41_07b0_ins <= VAR_inc_uxn_opcodes_h_l3293_c41_07b0_ins;
     inc_uxn_opcodes_h_l3293_c41_07b0_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3293_c41_07b0_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3293_c41_07b0_return_output := inc_uxn_opcodes_h_l3293_c41_07b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c1_66d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output;
     VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_66d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue := VAR_inc_uxn_opcodes_h_l3293_c41_07b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c1_7883] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c7_daa7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output;

     -- inc2[uxn_opcodes_h_l3294_c41_ee16] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3294_c41_ee16_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3294_c41_ee16_phase <= VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_phase;
     inc2_uxn_opcodes_h_l3294_c41_ee16_ins <= VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_ins;
     inc2_uxn_opcodes_h_l3294_c41_ee16_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_return_output := inc2_uxn_opcodes_h_l3294_c41_ee16_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output;
     VAR_pop_uxn_opcodes_h_l3295_c41_a827_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_7883_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue := VAR_inc2_uxn_opcodes_h_l3294_c41_ee16_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c7_53f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output;

     -- pop[uxn_opcodes_h_l3295_c41_a827] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3295_c41_a827_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3295_c41_a827_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3295_c41_a827_phase <= VAR_pop_uxn_opcodes_h_l3295_c41_a827_phase;
     pop_uxn_opcodes_h_l3295_c41_a827_ins <= VAR_pop_uxn_opcodes_h_l3295_c41_a827_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3295_c41_a827_return_output := pop_uxn_opcodes_h_l3295_c41_a827_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c1_0437] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output;
     VAR_pop2_uxn_opcodes_h_l3296_c41_3741_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_0437_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue := VAR_pop_uxn_opcodes_h_l3295_c41_a827_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c7_c379] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output;

     -- pop2[uxn_opcodes_h_l3296_c41_3741] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3296_c41_3741_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3296_c41_3741_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3296_c41_3741_phase <= VAR_pop2_uxn_opcodes_h_l3296_c41_3741_phase;
     pop2_uxn_opcodes_h_l3296_c41_3741_ins <= VAR_pop2_uxn_opcodes_h_l3296_c41_3741_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3296_c41_3741_return_output := pop2_uxn_opcodes_h_l3296_c41_3741_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c1_7dd7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_c379_return_output;
     VAR_nip_uxn_opcodes_h_l3297_c41_a999_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_7dd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue := VAR_pop2_uxn_opcodes_h_l3296_c41_3741_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c7_d7ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c1_ac6e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output;

     -- nip[uxn_opcodes_h_l3297_c41_a999] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3297_c41_a999_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3297_c41_a999_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3297_c41_a999_phase <= VAR_nip_uxn_opcodes_h_l3297_c41_a999_phase;
     nip_uxn_opcodes_h_l3297_c41_a999_ins <= VAR_nip_uxn_opcodes_h_l3297_c41_a999_ins;
     nip_uxn_opcodes_h_l3297_c41_a999_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3297_c41_a999_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3297_c41_a999_return_output := nip_uxn_opcodes_h_l3297_c41_a999_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output;
     VAR_nip2_uxn_opcodes_h_l3298_c41_e087_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_ac6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue := VAR_nip_uxn_opcodes_h_l3297_c41_a999_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c7_9511] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c1_ff1b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output;

     -- nip2[uxn_opcodes_h_l3298_c41_e087] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3298_c41_e087_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3298_c41_e087_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3298_c41_e087_phase <= VAR_nip2_uxn_opcodes_h_l3298_c41_e087_phase;
     nip2_uxn_opcodes_h_l3298_c41_e087_ins <= VAR_nip2_uxn_opcodes_h_l3298_c41_e087_ins;
     nip2_uxn_opcodes_h_l3298_c41_e087_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3298_c41_e087_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3298_c41_e087_return_output := nip2_uxn_opcodes_h_l3298_c41_e087_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_9511_return_output;
     VAR_swp_uxn_opcodes_h_l3299_c41_4081_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_ff1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue := VAR_nip2_uxn_opcodes_h_l3298_c41_e087_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c7_3412] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c1_eba0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output;

     -- swp[uxn_opcodes_h_l3299_c41_4081] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3299_c41_4081_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3299_c41_4081_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3299_c41_4081_phase <= VAR_swp_uxn_opcodes_h_l3299_c41_4081_phase;
     swp_uxn_opcodes_h_l3299_c41_4081_ins <= VAR_swp_uxn_opcodes_h_l3299_c41_4081_ins;
     swp_uxn_opcodes_h_l3299_c41_4081_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3299_c41_4081_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3299_c41_4081_return_output := swp_uxn_opcodes_h_l3299_c41_4081_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_3412_return_output;
     VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_eba0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue := VAR_swp_uxn_opcodes_h_l3299_c41_4081_return_output;
     -- swp2[uxn_opcodes_h_l3300_c41_5f05] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3300_c41_5f05_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3300_c41_5f05_phase <= VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_phase;
     swp2_uxn_opcodes_h_l3300_c41_5f05_ins <= VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_ins;
     swp2_uxn_opcodes_h_l3300_c41_5f05_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_return_output := swp2_uxn_opcodes_h_l3300_c41_5f05_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c7_9a33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c1_79f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output;
     VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_79f5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue := VAR_swp2_uxn_opcodes_h_l3300_c41_5f05_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c1_1963] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c7_7a03] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output;

     -- rot[uxn_opcodes_h_l3301_c41_6a1f] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3301_c41_6a1f_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3301_c41_6a1f_phase <= VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_phase;
     rot_uxn_opcodes_h_l3301_c41_6a1f_ins <= VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_ins;
     rot_uxn_opcodes_h_l3301_c41_6a1f_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_return_output := rot_uxn_opcodes_h_l3301_c41_6a1f_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output;
     VAR_rot2_uxn_opcodes_h_l3302_c41_573d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_1963_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue := VAR_rot_uxn_opcodes_h_l3301_c41_6a1f_return_output;
     -- rot2[uxn_opcodes_h_l3302_c41_573d] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3302_c41_573d_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3302_c41_573d_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3302_c41_573d_phase <= VAR_rot2_uxn_opcodes_h_l3302_c41_573d_phase;
     rot2_uxn_opcodes_h_l3302_c41_573d_ins <= VAR_rot2_uxn_opcodes_h_l3302_c41_573d_ins;
     rot2_uxn_opcodes_h_l3302_c41_573d_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3302_c41_573d_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3302_c41_573d_return_output := rot2_uxn_opcodes_h_l3302_c41_573d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c7_5005] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c1_e534] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_5005_return_output;
     VAR_dup_uxn_opcodes_h_l3303_c41_0369_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_e534_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue := VAR_rot2_uxn_opcodes_h_l3302_c41_573d_return_output;
     -- dup[uxn_opcodes_h_l3303_c41_0369] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3303_c41_0369_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3303_c41_0369_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3303_c41_0369_phase <= VAR_dup_uxn_opcodes_h_l3303_c41_0369_phase;
     dup_uxn_opcodes_h_l3303_c41_0369_ins <= VAR_dup_uxn_opcodes_h_l3303_c41_0369_ins;
     dup_uxn_opcodes_h_l3303_c41_0369_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3303_c41_0369_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3303_c41_0369_return_output := dup_uxn_opcodes_h_l3303_c41_0369_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c1_880d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c7_81d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output;
     VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_880d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue := VAR_dup_uxn_opcodes_h_l3303_c41_0369_return_output;
     -- dup2[uxn_opcodes_h_l3304_c41_3d9e] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3304_c41_3d9e_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3304_c41_3d9e_phase <= VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_phase;
     dup2_uxn_opcodes_h_l3304_c41_3d9e_ins <= VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_ins;
     dup2_uxn_opcodes_h_l3304_c41_3d9e_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output := dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c7_b73c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c1_89eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output;
     VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_89eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue := VAR_dup2_uxn_opcodes_h_l3304_c41_3d9e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c1_5122] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output;

     -- ovr[uxn_opcodes_h_l3305_c41_ece5] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3305_c41_ece5_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3305_c41_ece5_phase <= VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_phase;
     ovr_uxn_opcodes_h_l3305_c41_ece5_ins <= VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_ins;
     ovr_uxn_opcodes_h_l3305_c41_ece5_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_return_output := ovr_uxn_opcodes_h_l3305_c41_ece5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c7_1e89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output;
     VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_5122_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue := VAR_ovr_uxn_opcodes_h_l3305_c41_ece5_return_output;
     -- ovr2[uxn_opcodes_h_l3306_c41_c2c7] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3306_c41_c2c7_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3306_c41_c2c7_phase <= VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_phase;
     ovr2_uxn_opcodes_h_l3306_c41_c2c7_ins <= VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_ins;
     ovr2_uxn_opcodes_h_l3306_c41_c2c7_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output := ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c7_76b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c1_6dcc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output;
     VAR_equ_uxn_opcodes_h_l3307_c41_bddb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_6dcc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue := VAR_ovr2_uxn_opcodes_h_l3306_c41_c2c7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c7_6952] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c1_645b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output;

     -- equ[uxn_opcodes_h_l3307_c41_bddb] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3307_c41_bddb_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3307_c41_bddb_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3307_c41_bddb_phase <= VAR_equ_uxn_opcodes_h_l3307_c41_bddb_phase;
     equ_uxn_opcodes_h_l3307_c41_bddb_ins <= VAR_equ_uxn_opcodes_h_l3307_c41_bddb_ins;
     equ_uxn_opcodes_h_l3307_c41_bddb_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3307_c41_bddb_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3307_c41_bddb_return_output := equ_uxn_opcodes_h_l3307_c41_bddb_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_6952_return_output;
     VAR_equ2_uxn_opcodes_h_l3308_c41_9649_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_645b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue := VAR_equ_uxn_opcodes_h_l3307_c41_bddb_return_output;
     -- equ2[uxn_opcodes_h_l3308_c41_9649] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3308_c41_9649_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3308_c41_9649_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3308_c41_9649_phase <= VAR_equ2_uxn_opcodes_h_l3308_c41_9649_phase;
     equ2_uxn_opcodes_h_l3308_c41_9649_ins <= VAR_equ2_uxn_opcodes_h_l3308_c41_9649_ins;
     equ2_uxn_opcodes_h_l3308_c41_9649_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3308_c41_9649_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3308_c41_9649_return_output := equ2_uxn_opcodes_h_l3308_c41_9649_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c1_64e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c7_b4f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output;
     VAR_neq_uxn_opcodes_h_l3309_c41_50ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_64e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue := VAR_equ2_uxn_opcodes_h_l3308_c41_9649_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c7_b3d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output;

     -- neq[uxn_opcodes_h_l3309_c41_50ff] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3309_c41_50ff_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3309_c41_50ff_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3309_c41_50ff_phase <= VAR_neq_uxn_opcodes_h_l3309_c41_50ff_phase;
     neq_uxn_opcodes_h_l3309_c41_50ff_ins <= VAR_neq_uxn_opcodes_h_l3309_c41_50ff_ins;
     neq_uxn_opcodes_h_l3309_c41_50ff_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3309_c41_50ff_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3309_c41_50ff_return_output := neq_uxn_opcodes_h_l3309_c41_50ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c1_64f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output;
     VAR_neq2_uxn_opcodes_h_l3310_c41_7829_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_64f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue := VAR_neq_uxn_opcodes_h_l3309_c41_50ff_return_output;
     -- neq2[uxn_opcodes_h_l3310_c41_7829] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3310_c41_7829_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3310_c41_7829_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3310_c41_7829_phase <= VAR_neq2_uxn_opcodes_h_l3310_c41_7829_phase;
     neq2_uxn_opcodes_h_l3310_c41_7829_ins <= VAR_neq2_uxn_opcodes_h_l3310_c41_7829_ins;
     neq2_uxn_opcodes_h_l3310_c41_7829_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3310_c41_7829_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3310_c41_7829_return_output := neq2_uxn_opcodes_h_l3310_c41_7829_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c7_7b23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c1_de6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output;
     VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_de6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue := VAR_neq2_uxn_opcodes_h_l3310_c41_7829_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c1_ba45] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c7_327c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output;

     -- gth[uxn_opcodes_h_l3311_c41_3fe2] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3311_c41_3fe2_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3311_c41_3fe2_phase <= VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_phase;
     gth_uxn_opcodes_h_l3311_c41_3fe2_ins <= VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_ins;
     gth_uxn_opcodes_h_l3311_c41_3fe2_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_return_output := gth_uxn_opcodes_h_l3311_c41_3fe2_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_327c_return_output;
     VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_ba45_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue := VAR_gth_uxn_opcodes_h_l3311_c41_3fe2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c1_f764] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c7_92f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output;

     -- gth2[uxn_opcodes_h_l3312_c41_6cb7] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3312_c41_6cb7_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3312_c41_6cb7_phase <= VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_phase;
     gth2_uxn_opcodes_h_l3312_c41_6cb7_ins <= VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_ins;
     gth2_uxn_opcodes_h_l3312_c41_6cb7_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output := gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output;
     VAR_lth_uxn_opcodes_h_l3313_c41_639f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_f764_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue := VAR_gth2_uxn_opcodes_h_l3312_c41_6cb7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c1_c317] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output;

     -- lth[uxn_opcodes_h_l3313_c41_639f] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3313_c41_639f_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3313_c41_639f_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3313_c41_639f_phase <= VAR_lth_uxn_opcodes_h_l3313_c41_639f_phase;
     lth_uxn_opcodes_h_l3313_c41_639f_ins <= VAR_lth_uxn_opcodes_h_l3313_c41_639f_ins;
     lth_uxn_opcodes_h_l3313_c41_639f_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3313_c41_639f_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3313_c41_639f_return_output := lth_uxn_opcodes_h_l3313_c41_639f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c7_4afb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output;
     VAR_lth2_uxn_opcodes_h_l3314_c41_da07_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_c317_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue := VAR_lth_uxn_opcodes_h_l3313_c41_639f_return_output;
     -- lth2[uxn_opcodes_h_l3314_c41_da07] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3314_c41_da07_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3314_c41_da07_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3314_c41_da07_phase <= VAR_lth2_uxn_opcodes_h_l3314_c41_da07_phase;
     lth2_uxn_opcodes_h_l3314_c41_da07_ins <= VAR_lth2_uxn_opcodes_h_l3314_c41_da07_ins;
     lth2_uxn_opcodes_h_l3314_c41_da07_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3314_c41_da07_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3314_c41_da07_return_output := lth2_uxn_opcodes_h_l3314_c41_da07_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c7_ac2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c1_103c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output;
     VAR_jmp_uxn_opcodes_h_l3315_c41_f353_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_103c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue := VAR_lth2_uxn_opcodes_h_l3314_c41_da07_return_output;
     -- jmp[uxn_opcodes_h_l3315_c41_f353] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3315_c41_f353_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3315_c41_f353_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3315_c41_f353_phase <= VAR_jmp_uxn_opcodes_h_l3315_c41_f353_phase;
     jmp_uxn_opcodes_h_l3315_c41_f353_ins <= VAR_jmp_uxn_opcodes_h_l3315_c41_f353_ins;
     jmp_uxn_opcodes_h_l3315_c41_f353_pc <= VAR_jmp_uxn_opcodes_h_l3315_c41_f353_pc;
     jmp_uxn_opcodes_h_l3315_c41_f353_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3315_c41_f353_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3315_c41_f353_return_output := jmp_uxn_opcodes_h_l3315_c41_f353_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c1_1001] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c7_ef4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output;
     VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_1001_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue := VAR_jmp_uxn_opcodes_h_l3315_c41_f353_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c1_5544] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output;

     -- jmp2[uxn_opcodes_h_l3316_c41_996f] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3316_c41_996f_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3316_c41_996f_phase <= VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_phase;
     jmp2_uxn_opcodes_h_l3316_c41_996f_ins <= VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_ins;
     jmp2_uxn_opcodes_h_l3316_c41_996f_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_return_output := jmp2_uxn_opcodes_h_l3316_c41_996f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c7_696b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_696b_return_output;
     VAR_jcn_uxn_opcodes_h_l3317_c41_7882_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_5544_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue := VAR_jmp2_uxn_opcodes_h_l3316_c41_996f_return_output;
     -- jcn[uxn_opcodes_h_l3317_c41_7882] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3317_c41_7882_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3317_c41_7882_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3317_c41_7882_phase <= VAR_jcn_uxn_opcodes_h_l3317_c41_7882_phase;
     jcn_uxn_opcodes_h_l3317_c41_7882_ins <= VAR_jcn_uxn_opcodes_h_l3317_c41_7882_ins;
     jcn_uxn_opcodes_h_l3317_c41_7882_pc <= VAR_jcn_uxn_opcodes_h_l3317_c41_7882_pc;
     jcn_uxn_opcodes_h_l3317_c41_7882_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3317_c41_7882_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3317_c41_7882_return_output := jcn_uxn_opcodes_h_l3317_c41_7882_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c7_4475] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c1_faa3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_4475_return_output;
     VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_faa3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue := VAR_jcn_uxn_opcodes_h_l3317_c41_7882_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c7_4909] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c1_0e60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output;

     -- jcn2[uxn_opcodes_h_l3318_c41_43e5] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3318_c41_43e5_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3318_c41_43e5_phase <= VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_phase;
     jcn2_uxn_opcodes_h_l3318_c41_43e5_ins <= VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_ins;
     jcn2_uxn_opcodes_h_l3318_c41_43e5_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output := jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_4909_return_output;
     VAR_jsr_uxn_opcodes_h_l3319_c41_0645_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_0e60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue := VAR_jcn2_uxn_opcodes_h_l3318_c41_43e5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c7_3f89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output;

     -- jsr[uxn_opcodes_h_l3319_c41_0645] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3319_c41_0645_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3319_c41_0645_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3319_c41_0645_phase <= VAR_jsr_uxn_opcodes_h_l3319_c41_0645_phase;
     jsr_uxn_opcodes_h_l3319_c41_0645_ins <= VAR_jsr_uxn_opcodes_h_l3319_c41_0645_ins;
     jsr_uxn_opcodes_h_l3319_c41_0645_pc <= VAR_jsr_uxn_opcodes_h_l3319_c41_0645_pc;
     jsr_uxn_opcodes_h_l3319_c41_0645_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3319_c41_0645_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3319_c41_0645_return_output := jsr_uxn_opcodes_h_l3319_c41_0645_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c1_9735] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output;
     VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_9735_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue := VAR_jsr_uxn_opcodes_h_l3319_c41_0645_return_output;
     -- jsr2[uxn_opcodes_h_l3320_c41_2dfc] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3320_c41_2dfc_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3320_c41_2dfc_phase <= VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_phase;
     jsr2_uxn_opcodes_h_l3320_c41_2dfc_ins <= VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_ins;
     jsr2_uxn_opcodes_h_l3320_c41_2dfc_pc <= VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_pc;
     jsr2_uxn_opcodes_h_l3320_c41_2dfc_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output := jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c1_67ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c7_a08c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output;
     VAR_sth_uxn_opcodes_h_l3321_c41_f246_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_67ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue := VAR_jsr2_uxn_opcodes_h_l3320_c41_2dfc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c7_984b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c1_0ba2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output;

     -- sth[uxn_opcodes_h_l3321_c41_f246] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3321_c41_f246_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3321_c41_f246_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3321_c41_f246_phase <= VAR_sth_uxn_opcodes_h_l3321_c41_f246_phase;
     sth_uxn_opcodes_h_l3321_c41_f246_ins <= VAR_sth_uxn_opcodes_h_l3321_c41_f246_ins;
     sth_uxn_opcodes_h_l3321_c41_f246_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3321_c41_f246_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3321_c41_f246_return_output := sth_uxn_opcodes_h_l3321_c41_f246_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_984b_return_output;
     VAR_sth2_uxn_opcodes_h_l3322_c41_f138_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_0ba2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue := VAR_sth_uxn_opcodes_h_l3321_c41_f246_return_output;
     -- sth2[uxn_opcodes_h_l3322_c41_f138] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3322_c41_f138_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3322_c41_f138_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3322_c41_f138_phase <= VAR_sth2_uxn_opcodes_h_l3322_c41_f138_phase;
     sth2_uxn_opcodes_h_l3322_c41_f138_ins <= VAR_sth2_uxn_opcodes_h_l3322_c41_f138_ins;
     sth2_uxn_opcodes_h_l3322_c41_f138_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3322_c41_f138_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3322_c41_f138_return_output := sth2_uxn_opcodes_h_l3322_c41_f138_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c1_8ee7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c7_8785] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_8785_return_output;
     VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_8ee7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue := VAR_sth2_uxn_opcodes_h_l3322_c41_f138_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c1_9eca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c7_9e32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output;

     -- ldz[uxn_opcodes_h_l3323_c41_31ce] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3323_c41_31ce_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3323_c41_31ce_phase <= VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_phase;
     ldz_uxn_opcodes_h_l3323_c41_31ce_ins <= VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_ins;
     ldz_uxn_opcodes_h_l3323_c41_31ce_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_previous_stack_read;
     ldz_uxn_opcodes_h_l3323_c41_31ce_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_return_output := ldz_uxn_opcodes_h_l3323_c41_31ce_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output;
     VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_9eca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue := VAR_ldz_uxn_opcodes_h_l3323_c41_31ce_return_output;
     -- ldz2[uxn_opcodes_h_l3324_c41_8625] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3324_c41_8625_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3324_c41_8625_phase <= VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_phase;
     ldz2_uxn_opcodes_h_l3324_c41_8625_ins <= VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_ins;
     ldz2_uxn_opcodes_h_l3324_c41_8625_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_previous_stack_read;
     ldz2_uxn_opcodes_h_l3324_c41_8625_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_return_output := ldz2_uxn_opcodes_h_l3324_c41_8625_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c1_64a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c7_f05c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output;
     VAR_stz_uxn_opcodes_h_l3325_c41_dfce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_64a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue := VAR_ldz2_uxn_opcodes_h_l3324_c41_8625_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c1_2932] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c7_0981] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output;

     -- stz[uxn_opcodes_h_l3325_c41_dfce] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3325_c41_dfce_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3325_c41_dfce_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3325_c41_dfce_phase <= VAR_stz_uxn_opcodes_h_l3325_c41_dfce_phase;
     stz_uxn_opcodes_h_l3325_c41_dfce_ins <= VAR_stz_uxn_opcodes_h_l3325_c41_dfce_ins;
     stz_uxn_opcodes_h_l3325_c41_dfce_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3325_c41_dfce_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3325_c41_dfce_return_output := stz_uxn_opcodes_h_l3325_c41_dfce_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_0981_return_output;
     VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_2932_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue := VAR_stz_uxn_opcodes_h_l3325_c41_dfce_return_output;
     -- stz2[uxn_opcodes_h_l3326_c41_02bf] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3326_c41_02bf_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3326_c41_02bf_phase <= VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_phase;
     stz2_uxn_opcodes_h_l3326_c41_02bf_ins <= VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_ins;
     stz2_uxn_opcodes_h_l3326_c41_02bf_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_return_output := stz2_uxn_opcodes_h_l3326_c41_02bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c7_119b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c1_f9ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_119b_return_output;
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f9ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue := VAR_stz2_uxn_opcodes_h_l3326_c41_02bf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c1_ebb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c7_f3aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output;

     -- ldr[uxn_opcodes_h_l3327_c41_8d35] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3327_c41_8d35_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3327_c41_8d35_phase <= VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_phase;
     ldr_uxn_opcodes_h_l3327_c41_8d35_ins <= VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_ins;
     ldr_uxn_opcodes_h_l3327_c41_8d35_pc <= VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_pc;
     ldr_uxn_opcodes_h_l3327_c41_8d35_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_previous_stack_read;
     ldr_uxn_opcodes_h_l3327_c41_8d35_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_return_output := ldr_uxn_opcodes_h_l3327_c41_8d35_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output;
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_ebb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue := VAR_ldr_uxn_opcodes_h_l3327_c41_8d35_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c1_76d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c7_da23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output;

     -- ldr2[uxn_opcodes_h_l3328_c41_0192] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3328_c41_0192_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3328_c41_0192_phase <= VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_phase;
     ldr2_uxn_opcodes_h_l3328_c41_0192_ins <= VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_ins;
     ldr2_uxn_opcodes_h_l3328_c41_0192_pc <= VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_pc;
     ldr2_uxn_opcodes_h_l3328_c41_0192_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_previous_stack_read;
     ldr2_uxn_opcodes_h_l3328_c41_0192_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_return_output := ldr2_uxn_opcodes_h_l3328_c41_0192_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_da23_return_output;
     VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_76d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue := VAR_ldr2_uxn_opcodes_h_l3328_c41_0192_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c1_cccd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3331_c7_9862] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output;

     -- str1[uxn_opcodes_h_l3329_c41_2e5b] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3329_c41_2e5b_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3329_c41_2e5b_phase <= VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_phase;
     str1_uxn_opcodes_h_l3329_c41_2e5b_ins <= VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_ins;
     str1_uxn_opcodes_h_l3329_c41_2e5b_pc <= VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_pc;
     str1_uxn_opcodes_h_l3329_c41_2e5b_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_return_output := str1_uxn_opcodes_h_l3329_c41_2e5b_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c7_9862_return_output;
     VAR_str2_uxn_opcodes_h_l3330_c41_0be1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_cccd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue := VAR_str1_uxn_opcodes_h_l3329_c41_2e5b_return_output;
     -- str2[uxn_opcodes_h_l3330_c41_0be1] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3330_c41_0be1_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3330_c41_0be1_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3330_c41_0be1_phase <= VAR_str2_uxn_opcodes_h_l3330_c41_0be1_phase;
     str2_uxn_opcodes_h_l3330_c41_0be1_ins <= VAR_str2_uxn_opcodes_h_l3330_c41_0be1_ins;
     str2_uxn_opcodes_h_l3330_c41_0be1_pc <= VAR_str2_uxn_opcodes_h_l3330_c41_0be1_pc;
     str2_uxn_opcodes_h_l3330_c41_0be1_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3330_c41_0be1_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3330_c41_0be1_return_output := str2_uxn_opcodes_h_l3330_c41_0be1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3332_c7_ede0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3331_c1_63c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output;
     VAR_lda_uxn_opcodes_h_l3331_c41_821c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_63c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue := VAR_str2_uxn_opcodes_h_l3330_c41_0be1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3333_c7_f417] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3332_c1_e6bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output;

     -- lda[uxn_opcodes_h_l3331_c41_821c] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3331_c41_821c_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3331_c41_821c_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3331_c41_821c_phase <= VAR_lda_uxn_opcodes_h_l3331_c41_821c_phase;
     lda_uxn_opcodes_h_l3331_c41_821c_ins <= VAR_lda_uxn_opcodes_h_l3331_c41_821c_ins;
     lda_uxn_opcodes_h_l3331_c41_821c_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3331_c41_821c_previous_stack_read;
     lda_uxn_opcodes_h_l3331_c41_821c_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3331_c41_821c_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3331_c41_821c_return_output := lda_uxn_opcodes_h_l3331_c41_821c_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c7_f417_return_output;
     VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3332_c1_e6bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue := VAR_lda_uxn_opcodes_h_l3331_c41_821c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c7_c71d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3333_c1_d877] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output;

     -- lda2[uxn_opcodes_h_l3332_c41_1b5f] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3332_c41_1b5f_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3332_c41_1b5f_phase <= VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_phase;
     lda2_uxn_opcodes_h_l3332_c41_1b5f_ins <= VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_ins;
     lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_stack_read;
     lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output := lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output;
     VAR_sta_uxn_opcodes_h_l3333_c41_4efc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3333_c1_d877_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue := VAR_lda2_uxn_opcodes_h_l3332_c41_1b5f_return_output;
     -- sta[uxn_opcodes_h_l3333_c41_4efc] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3333_c41_4efc_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3333_c41_4efc_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3333_c41_4efc_phase <= VAR_sta_uxn_opcodes_h_l3333_c41_4efc_phase;
     sta_uxn_opcodes_h_l3333_c41_4efc_ins <= VAR_sta_uxn_opcodes_h_l3333_c41_4efc_ins;
     sta_uxn_opcodes_h_l3333_c41_4efc_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3333_c41_4efc_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3333_c41_4efc_return_output := sta_uxn_opcodes_h_l3333_c41_4efc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c7_097b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c1_2ed9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_097b_return_output;
     VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_2ed9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue := VAR_sta_uxn_opcodes_h_l3333_c41_4efc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c7_4174] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output;

     -- sta2[uxn_opcodes_h_l3334_c41_c62f] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3334_c41_c62f_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3334_c41_c62f_phase <= VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_phase;
     sta2_uxn_opcodes_h_l3334_c41_c62f_ins <= VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_ins;
     sta2_uxn_opcodes_h_l3334_c41_c62f_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_return_output := sta2_uxn_opcodes_h_l3334_c41_c62f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c1_4457] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_4174_return_output;
     VAR_dei_uxn_opcodes_h_l3335_c41_28ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_4457_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue := VAR_sta2_uxn_opcodes_h_l3334_c41_c62f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c1_cda7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output;

     -- dei[uxn_opcodes_h_l3335_c41_28ab] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3335_c41_28ab_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3335_c41_28ab_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3335_c41_28ab_phase <= VAR_dei_uxn_opcodes_h_l3335_c41_28ab_phase;
     dei_uxn_opcodes_h_l3335_c41_28ab_ins <= VAR_dei_uxn_opcodes_h_l3335_c41_28ab_ins;
     dei_uxn_opcodes_h_l3335_c41_28ab_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3335_c41_28ab_previous_stack_read;
     dei_uxn_opcodes_h_l3335_c41_28ab_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3335_c41_28ab_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3335_c41_28ab_return_output := dei_uxn_opcodes_h_l3335_c41_28ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c7_fc84] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output;
     VAR_dei2_uxn_opcodes_h_l3336_c41_2974_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_cda7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue := VAR_dei_uxn_opcodes_h_l3335_c41_28ab_return_output;
     -- dei2[uxn_opcodes_h_l3336_c41_2974] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3336_c41_2974_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3336_c41_2974_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3336_c41_2974_phase <= VAR_dei2_uxn_opcodes_h_l3336_c41_2974_phase;
     dei2_uxn_opcodes_h_l3336_c41_2974_ins <= VAR_dei2_uxn_opcodes_h_l3336_c41_2974_ins;
     dei2_uxn_opcodes_h_l3336_c41_2974_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3336_c41_2974_previous_stack_read;
     dei2_uxn_opcodes_h_l3336_c41_2974_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3336_c41_2974_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3336_c41_2974_return_output := dei2_uxn_opcodes_h_l3336_c41_2974_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c7_6609] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c1_e0f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_6609_return_output;
     VAR_deo_uxn_opcodes_h_l3337_c41_930a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_e0f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue := VAR_dei2_uxn_opcodes_h_l3336_c41_2974_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c1_6916] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output;

     -- deo[uxn_opcodes_h_l3337_c41_930a] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3337_c41_930a_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3337_c41_930a_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3337_c41_930a_phase <= VAR_deo_uxn_opcodes_h_l3337_c41_930a_phase;
     deo_uxn_opcodes_h_l3337_c41_930a_ins <= VAR_deo_uxn_opcodes_h_l3337_c41_930a_ins;
     deo_uxn_opcodes_h_l3337_c41_930a_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3337_c41_930a_previous_stack_read;
     deo_uxn_opcodes_h_l3337_c41_930a_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3337_c41_930a_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3337_c41_930a_return_output := deo_uxn_opcodes_h_l3337_c41_930a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c7_7a71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output;
     VAR_deo2_uxn_opcodes_h_l3338_c41_685e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_6916_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue := VAR_deo_uxn_opcodes_h_l3337_c41_930a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c7_f030] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output;

     -- deo2[uxn_opcodes_h_l3338_c41_685e] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3338_c41_685e_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3338_c41_685e_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3338_c41_685e_phase <= VAR_deo2_uxn_opcodes_h_l3338_c41_685e_phase;
     deo2_uxn_opcodes_h_l3338_c41_685e_ins <= VAR_deo2_uxn_opcodes_h_l3338_c41_685e_ins;
     deo2_uxn_opcodes_h_l3338_c41_685e_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3338_c41_685e_previous_stack_read;
     deo2_uxn_opcodes_h_l3338_c41_685e_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3338_c41_685e_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3338_c41_685e_return_output := deo2_uxn_opcodes_h_l3338_c41_685e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c1_5979] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_f030_return_output;
     VAR_add_uxn_opcodes_h_l3339_c41_8d00_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_5979_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue := VAR_deo2_uxn_opcodes_h_l3338_c41_685e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c7_b221] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output;

     -- add[uxn_opcodes_h_l3339_c41_8d00] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3339_c41_8d00_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3339_c41_8d00_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3339_c41_8d00_phase <= VAR_add_uxn_opcodes_h_l3339_c41_8d00_phase;
     add_uxn_opcodes_h_l3339_c41_8d00_ins <= VAR_add_uxn_opcodes_h_l3339_c41_8d00_ins;
     add_uxn_opcodes_h_l3339_c41_8d00_previous_stack_read <= VAR_add_uxn_opcodes_h_l3339_c41_8d00_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3339_c41_8d00_return_output := add_uxn_opcodes_h_l3339_c41_8d00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c1_ee18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_b221_return_output;
     VAR_add2_uxn_opcodes_h_l3340_c41_0117_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_ee18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue := VAR_add_uxn_opcodes_h_l3339_c41_8d00_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c7_6877] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c1_e990] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output;

     -- add2[uxn_opcodes_h_l3340_c41_0117] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3340_c41_0117_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3340_c41_0117_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3340_c41_0117_phase <= VAR_add2_uxn_opcodes_h_l3340_c41_0117_phase;
     add2_uxn_opcodes_h_l3340_c41_0117_ins <= VAR_add2_uxn_opcodes_h_l3340_c41_0117_ins;
     add2_uxn_opcodes_h_l3340_c41_0117_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3340_c41_0117_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3340_c41_0117_return_output := add2_uxn_opcodes_h_l3340_c41_0117_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_6877_return_output;
     VAR_sub_uxn_opcodes_h_l3341_c41_a55d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_e990_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue := VAR_add2_uxn_opcodes_h_l3340_c41_0117_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c7_92a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c1_a3c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output;

     -- sub[uxn_opcodes_h_l3341_c41_a55d] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3341_c41_a55d_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3341_c41_a55d_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3341_c41_a55d_phase <= VAR_sub_uxn_opcodes_h_l3341_c41_a55d_phase;
     sub_uxn_opcodes_h_l3341_c41_a55d_ins <= VAR_sub_uxn_opcodes_h_l3341_c41_a55d_ins;
     sub_uxn_opcodes_h_l3341_c41_a55d_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3341_c41_a55d_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3341_c41_a55d_return_output := sub_uxn_opcodes_h_l3341_c41_a55d_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output;
     VAR_sub2_uxn_opcodes_h_l3342_c41_3930_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_a3c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue := VAR_sub_uxn_opcodes_h_l3341_c41_a55d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c1_225c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c7_2b56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output;

     -- sub2[uxn_opcodes_h_l3342_c41_3930] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3342_c41_3930_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3342_c41_3930_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3342_c41_3930_phase <= VAR_sub2_uxn_opcodes_h_l3342_c41_3930_phase;
     sub2_uxn_opcodes_h_l3342_c41_3930_ins <= VAR_sub2_uxn_opcodes_h_l3342_c41_3930_ins;
     sub2_uxn_opcodes_h_l3342_c41_3930_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3342_c41_3930_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3342_c41_3930_return_output := sub2_uxn_opcodes_h_l3342_c41_3930_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output;
     VAR_mul_uxn_opcodes_h_l3343_c41_038e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_225c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue := VAR_sub2_uxn_opcodes_h_l3342_c41_3930_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c7_d759] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c1_3eb4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output;

     -- mul[uxn_opcodes_h_l3343_c41_038e] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3343_c41_038e_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3343_c41_038e_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3343_c41_038e_phase <= VAR_mul_uxn_opcodes_h_l3343_c41_038e_phase;
     mul_uxn_opcodes_h_l3343_c41_038e_ins <= VAR_mul_uxn_opcodes_h_l3343_c41_038e_ins;
     mul_uxn_opcodes_h_l3343_c41_038e_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3343_c41_038e_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3343_c41_038e_return_output := mul_uxn_opcodes_h_l3343_c41_038e_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_d759_return_output;
     VAR_mul2_uxn_opcodes_h_l3344_c41_128f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_3eb4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue := VAR_mul_uxn_opcodes_h_l3343_c41_038e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c1_da71] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output;

     -- mul2[uxn_opcodes_h_l3344_c41_128f] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3344_c41_128f_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3344_c41_128f_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3344_c41_128f_phase <= VAR_mul2_uxn_opcodes_h_l3344_c41_128f_phase;
     mul2_uxn_opcodes_h_l3344_c41_128f_ins <= VAR_mul2_uxn_opcodes_h_l3344_c41_128f_ins;
     mul2_uxn_opcodes_h_l3344_c41_128f_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3344_c41_128f_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3344_c41_128f_return_output := mul2_uxn_opcodes_h_l3344_c41_128f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c7_8bf9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output;
     VAR_div_uxn_opcodes_h_l3345_c41_2d1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_da71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue := VAR_mul2_uxn_opcodes_h_l3344_c41_128f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c1_45ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output;

     -- div[uxn_opcodes_h_l3345_c41_2d1a] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3345_c41_2d1a_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3345_c41_2d1a_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3345_c41_2d1a_phase <= VAR_div_uxn_opcodes_h_l3345_c41_2d1a_phase;
     div_uxn_opcodes_h_l3345_c41_2d1a_ins <= VAR_div_uxn_opcodes_h_l3345_c41_2d1a_ins;
     div_uxn_opcodes_h_l3345_c41_2d1a_previous_stack_read <= VAR_div_uxn_opcodes_h_l3345_c41_2d1a_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3345_c41_2d1a_return_output := div_uxn_opcodes_h_l3345_c41_2d1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c7_f72c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output;
     VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_45ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue := VAR_div_uxn_opcodes_h_l3345_c41_2d1a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c1_b814] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output;

     -- div2[uxn_opcodes_h_l3346_c41_bd4f] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3346_c41_bd4f_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3346_c41_bd4f_phase <= VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_phase;
     div2_uxn_opcodes_h_l3346_c41_bd4f_ins <= VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_ins;
     div2_uxn_opcodes_h_l3346_c41_bd4f_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_return_output := div2_uxn_opcodes_h_l3346_c41_bd4f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c7_9583] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_9583_return_output;
     VAR_and_uxn_opcodes_h_l3347_c41_9811_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_b814_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue := VAR_div2_uxn_opcodes_h_l3346_c41_bd4f_return_output;
     -- and[uxn_opcodes_h_l3347_c41_9811] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3347_c41_9811_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3347_c41_9811_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3347_c41_9811_phase <= VAR_and_uxn_opcodes_h_l3347_c41_9811_phase;
     and_uxn_opcodes_h_l3347_c41_9811_ins <= VAR_and_uxn_opcodes_h_l3347_c41_9811_ins;
     and_uxn_opcodes_h_l3347_c41_9811_previous_stack_read <= VAR_and_uxn_opcodes_h_l3347_c41_9811_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3347_c41_9811_return_output := and_uxn_opcodes_h_l3347_c41_9811_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c7_bde7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c1_c338] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output;
     VAR_and2_uxn_opcodes_h_l3348_c41_66f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_c338_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue := VAR_and_uxn_opcodes_h_l3347_c41_9811_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c7_f34b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c1_f650] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output;

     -- and2[uxn_opcodes_h_l3348_c41_66f2] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3348_c41_66f2_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3348_c41_66f2_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3348_c41_66f2_phase <= VAR_and2_uxn_opcodes_h_l3348_c41_66f2_phase;
     and2_uxn_opcodes_h_l3348_c41_66f2_ins <= VAR_and2_uxn_opcodes_h_l3348_c41_66f2_ins;
     and2_uxn_opcodes_h_l3348_c41_66f2_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3348_c41_66f2_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3348_c41_66f2_return_output := and2_uxn_opcodes_h_l3348_c41_66f2_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output;
     VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_f650_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue := VAR_and2_uxn_opcodes_h_l3348_c41_66f2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c7_fc00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c1_a001] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output;

     -- ora[uxn_opcodes_h_l3349_c41_6ac0] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3349_c41_6ac0_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3349_c41_6ac0_phase <= VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_phase;
     ora_uxn_opcodes_h_l3349_c41_6ac0_ins <= VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_ins;
     ora_uxn_opcodes_h_l3349_c41_6ac0_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_return_output := ora_uxn_opcodes_h_l3349_c41_6ac0_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output;
     VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_a001_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue := VAR_ora_uxn_opcodes_h_l3349_c41_6ac0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c1_3d3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c7_a342] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output;

     -- ora2[uxn_opcodes_h_l3350_c41_a6b8] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3350_c41_a6b8_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3350_c41_a6b8_phase <= VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_phase;
     ora2_uxn_opcodes_h_l3350_c41_a6b8_ins <= VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_ins;
     ora2_uxn_opcodes_h_l3350_c41_a6b8_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output := ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_a342_return_output;
     VAR_eor_uxn_opcodes_h_l3351_c41_9d63_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_3d3d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue := VAR_ora2_uxn_opcodes_h_l3350_c41_a6b8_return_output;
     -- eor[uxn_opcodes_h_l3351_c41_9d63] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3351_c41_9d63_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3351_c41_9d63_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3351_c41_9d63_phase <= VAR_eor_uxn_opcodes_h_l3351_c41_9d63_phase;
     eor_uxn_opcodes_h_l3351_c41_9d63_ins <= VAR_eor_uxn_opcodes_h_l3351_c41_9d63_ins;
     eor_uxn_opcodes_h_l3351_c41_9d63_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3351_c41_9d63_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3351_c41_9d63_return_output := eor_uxn_opcodes_h_l3351_c41_9d63_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c1_d77c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c7_4603] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_4603_return_output;
     VAR_eor2_uxn_opcodes_h_l3352_c41_274e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_d77c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue := VAR_eor_uxn_opcodes_h_l3351_c41_9d63_return_output;
     -- eor2[uxn_opcodes_h_l3352_c41_274e] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3352_c41_274e_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3352_c41_274e_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3352_c41_274e_phase <= VAR_eor2_uxn_opcodes_h_l3352_c41_274e_phase;
     eor2_uxn_opcodes_h_l3352_c41_274e_ins <= VAR_eor2_uxn_opcodes_h_l3352_c41_274e_ins;
     eor2_uxn_opcodes_h_l3352_c41_274e_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3352_c41_274e_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3352_c41_274e_return_output := eor2_uxn_opcodes_h_l3352_c41_274e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c1_b48d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c7_42b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output;
     VAR_sft_uxn_opcodes_h_l3353_c41_2433_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_b48d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue := VAR_eor2_uxn_opcodes_h_l3352_c41_274e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c1_0071] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output;

     -- sft[uxn_opcodes_h_l3353_c41_2433] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3353_c41_2433_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3353_c41_2433_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3353_c41_2433_phase <= VAR_sft_uxn_opcodes_h_l3353_c41_2433_phase;
     sft_uxn_opcodes_h_l3353_c41_2433_ins <= VAR_sft_uxn_opcodes_h_l3353_c41_2433_ins;
     sft_uxn_opcodes_h_l3353_c41_2433_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3353_c41_2433_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3353_c41_2433_return_output := sft_uxn_opcodes_h_l3353_c41_2433_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3355_c1_053b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_053b_return_output;
     VAR_sft2_uxn_opcodes_h_l3354_c41_df30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_0071_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue := VAR_sft_uxn_opcodes_h_l3353_c41_2433_return_output;
     -- printf_uxn_opcodes_h_l3355_c9_d3ed[uxn_opcodes_h_l3355_c9_d3ed] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_arg0 <= VAR_printf_uxn_opcodes_h_l3355_c9_d3ed_uxn_opcodes_h_l3355_c9_d3ed_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l3354_c41_df30] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3354_c41_df30_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3354_c41_df30_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3354_c41_df30_phase <= VAR_sft2_uxn_opcodes_h_l3354_c41_df30_phase;
     sft2_uxn_opcodes_h_l3354_c41_df30_ins <= VAR_sft2_uxn_opcodes_h_l3354_c41_df30_ins;
     sft2_uxn_opcodes_h_l3354_c41_df30_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3354_c41_df30_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3354_c41_df30_return_output := sft2_uxn_opcodes_h_l3354_c41_df30_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue := VAR_sft2_uxn_opcodes_h_l3354_c41_df30_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3354_c7_42b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_cond;
     opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output := opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_42b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3353_c7_4603] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_cond;
     opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output := opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_4603_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3352_c7_a342] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_cond;
     opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output := opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_a342_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3351_c7_fc00] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_cond;
     opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output := opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_fc00_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3350_c7_f34b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_cond;
     opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output := opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_f34b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3349_c7_bde7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_cond;
     opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output := opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_bde7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3348_c7_9583] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_cond;
     opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output := opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_9583_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3347_c7_f72c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_cond;
     opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output := opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_f72c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3346_c7_8bf9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_cond;
     opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output := opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_8bf9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3345_c7_d759] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_cond;
     opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output := opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_d759_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3344_c7_2b56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_cond;
     opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output := opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_2b56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3343_c7_92a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_cond;
     opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output := opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_92a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3342_c7_6877] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_cond;
     opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output := opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_6877_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3341_c7_b221] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_cond;
     opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output := opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_b221_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3340_c7_f030] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_cond;
     opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output := opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_f030_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3339_c7_7a71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_cond;
     opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output := opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_7a71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3338_c7_6609] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_cond;
     opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output := opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_6609_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3337_c7_fc84] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_cond;
     opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output := opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_fc84_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3336_c7_4174] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_cond;
     opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output := opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_4174_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3335_c7_097b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_cond;
     opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output := opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_097b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3334_c7_c71d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_cond;
     opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output := opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_c71d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3333_c7_f417] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_cond;
     opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output := opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c7_f417_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3332_c7_ede0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_cond;
     opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output := opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3332_c7_ede0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3331_c7_9862] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_cond;
     opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output := opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3331_c7_9862_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3330_c7_da23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_cond;
     opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output := opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_da23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3329_c7_f3aa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_cond;
     opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output := opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_f3aa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3328_c7_119b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_cond;
     opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output := opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_119b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3327_c7_0981] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_cond;
     opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output := opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_0981_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3326_c7_f05c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_cond;
     opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output := opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_f05c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3325_c7_9e32] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_cond;
     opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output := opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_9e32_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3324_c7_8785] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_cond;
     opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output := opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_8785_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3323_c7_984b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_cond;
     opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output := opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_984b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3322_c7_a08c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_cond;
     opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output := opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_a08c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3321_c7_3f89] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_cond;
     opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output := opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_3f89_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3320_c7_4909] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_cond;
     opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output := opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_4909_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3319_c7_4475] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_cond;
     opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output := opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_4475_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3318_c7_696b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_cond;
     opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output := opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_696b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3317_c7_ef4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_cond;
     opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output := opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_ef4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3316_c7_ac2d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_cond;
     opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output := opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_ac2d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3315_c7_4afb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_cond;
     opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output := opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_4afb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3314_c7_92f4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_cond;
     opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output := opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_92f4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3313_c7_327c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_cond;
     opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output := opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_327c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3312_c7_7b23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_cond;
     opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output := opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_7b23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3311_c7_b3d3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_cond;
     opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output := opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_b3d3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3310_c7_b4f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_cond;
     opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output := opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_b4f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3309_c7_6952] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_cond;
     opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output := opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_6952_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3308_c7_76b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_cond;
     opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output := opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_76b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3307_c7_1e89] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_cond;
     opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output := opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_1e89_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3306_c7_b73c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_cond;
     opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output := opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_b73c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3305_c7_81d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_cond;
     opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output := opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_81d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3304_c7_5005] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_cond;
     opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output := opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_5005_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3303_c7_7a03] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_cond;
     opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output := opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_7a03_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3302_c7_9a33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_cond;
     opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output := opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_9a33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3301_c7_3412] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_cond;
     opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output := opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_3412_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3300_c7_9511] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_cond;
     opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output := opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_9511_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3299_c7_d7ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_cond;
     opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output := opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_d7ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3298_c7_c379] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_cond;
     opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output := opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_c379_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3297_c7_53f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_cond;
     opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output := opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_53f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3296_c7_daa7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_cond;
     opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output := opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_daa7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3295_c7_72cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_cond;
     opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output := opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_72cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3294_c7_2464] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_cond;
     opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output := opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_2464_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3293_c7_a1c8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_cond;
     opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output := opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_a1c8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3292_c7_0be9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_cond;
     opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output := opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0be9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3291_c7_0181] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_cond;
     opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output := opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_0181_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3290_c7_dd9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_cond;
     opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output := opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_dd9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3289_c7_b3a3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_cond;
     opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output := opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_b3a3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3288_c7_ebf7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_cond;
     opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output := opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_ebf7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3287_c7_f7eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_cond;
     opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output := opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_f7eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3286_c7_2e01] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_cond;
     opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output := opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_2e01_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3285_c2_a9cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_cond;
     opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output := opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3395_c34_af2b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3395_c34_af2b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3383_c3_f85c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3383_c3_f85c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l3390_c23_a3b8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3390_c23_a3b8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3366_c19_67a5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3366_c19_67a5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3385_l3381_DUPLICATE_e1c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3385_l3381_DUPLICATE_e1c0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3389_c34_5f46] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3389_c34_5f46_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_pc_updated;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l3397_c31_5eaa] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3397_c31_5eaa_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l3382_c3_43de] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3382_c3_43de_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l3391_c32_1fed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l3391_c32_1fed_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3367_c82_400c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3367_c82_400c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3371_l3358_l3367_DUPLICATE_f366 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3371_l3358_l3367_DUPLICATE_f366_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l3386_c3_64a7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3386_c3_64a7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l3368_c22_e42a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3368_c22_e42a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l3393_c29_2741] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3393_c29_2741_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3398_c32_8875] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3398_c32_8875_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3392_c33_96dc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3392_c33_96dc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l3365_c18_430f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3365_c18_430f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_stack_read;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3396_c33_0e71] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3396_c33_0e71_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.vram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3361_l3359_DUPLICATE_98e6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3361_l3359_DUPLICATE_98e6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l3394_c30_d5ed] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3394_c30_d5ed_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3357_c6_2339] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3357_c6_2339_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c2_a9cd_return_output.is_sp_shift;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3361_l3359_DUPLICATE_98e6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3361_l3359_DUPLICATE_98e6_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3386_c3_64a7_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3383_c3_f85c_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3357_c6_2339_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3357_c6_2339_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3371_l3358_l3367_DUPLICATE_f366_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3365_c18_430f_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3365_c18_430f_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3366_c19_67a5_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3366_c19_67a5_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3385_l3381_DUPLICATE_e1c0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3385_l3381_DUPLICATE_e1c0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3382_c3_43de_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3367_c82_400c_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3368_c22_e42a_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3368_c22_e42a_return_output;
     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3359_c4_1169] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output;

     -- device_ram_update[uxn_opcodes_h_l3380_c26_efde] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_address0 <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_address0;
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_value;
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_write0_enable;
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_read0_enable;
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_address1 <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_address1;
     device_ram_update_uxn_opcodes_h_l3380_c26_efde_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output := device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3361_c4_becc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3400_l3263_DUPLICATE_3605 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3400_l3263_DUPLICATE_3605_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3389_c34_5f46_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3390_c23_a3b8_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l3391_c32_1fed_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3392_c33_96dc_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3393_c29_2741_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3394_c30_d5ed_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3395_c34_af2b_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3396_c33_0e71_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3397_c31_5eaa_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3398_c32_8875_return_output);

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l3359_c4_8b98 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3359_c4_1169_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3361_c4_dae8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3361_c4_becc_return_output)),8);
     VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_expr := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3358_l3367_l3371_DUPLICATE_3e1c_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3400_l3263_DUPLICATE_3605_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3400_l3263_DUPLICATE_3605_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l3380_c2_a7bb := resize(VAR_device_ram_update_uxn_opcodes_h_l3380_c26_efde_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l3380_c2_a7bb;
     VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse := VAR_sp0_uxn_opcodes_h_l3361_c4_dae8;
     VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue := VAR_sp1_uxn_opcodes_h_l3359_c4_8b98;
     -- sp1_MUX[uxn_opcodes_h_l3358_c3_5ec8] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond;
     sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue;
     sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output := sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3358_c3_5ec8] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_cond;
     sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iftrue;
     sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output := sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l3371_c5_30a1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output := UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output;

     -- Submodule level 148
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_stack_index := VAR_UNARY_OP_NOT_uxn_opcodes_h_l3371_c5_30a1_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3358_c3_5ec8_return_output;
     -- sp1_MUX[uxn_opcodes_h_l3357_c2_20b3] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_cond;
     sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue;
     sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output := sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3357_c2_20b3] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_cond;
     sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iftrue;
     sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output := sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output;
     VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3357_c2_20b3_return_output;
     -- MUX[uxn_opcodes_h_l3367_c19_3bbe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3367_c19_3bbe_cond <= VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_cond;
     MUX_uxn_opcodes_h_l3367_c19_3bbe_iftrue <= VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_iftrue;
     MUX_uxn_opcodes_h_l3367_c19_3bbe_iffalse <= VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output := MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_left := VAR_MUX_uxn_opcodes_h_l3367_c19_3bbe_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3367_c19_7b0f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l3367_c2_fc77 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l3367_c19_7b0f_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3367_c2_fc77;
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address0 := resize(VAR_stack_address_uxn_opcodes_h_l3367_c2_fc77, 8);
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address1 := resize(VAR_stack_address_uxn_opcodes_h_l3367_c2_fc77, 8);
     -- stack_ram_update[uxn_opcodes_h_l3370_c21_db75] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_stack_index <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_stack_index;
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address0 <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address0;
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_value <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_value;
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_write0_enable;
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read0_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read0_enable;
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address1 <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_address1;
     stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read1_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_read1_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output := stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l3370_c2_8a2c := resize(VAR_stack_ram_update_uxn_opcodes_h_l3370_c21_db75_return_output, 8);
     REG_VAR_stack_read_value := VAR_stack_read_value_uxn_opcodes_h_l3370_c2_8a2c;
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
