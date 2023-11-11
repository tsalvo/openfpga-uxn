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
entity eval_opcode_phased_0CLK_98495c5b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_98495c5b;
architecture arch of eval_opcode_phased_0CLK_98495c5b is
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
-- BIN_OP_AND[uxn_opcodes_h_l2708_c10_6e63]
signal BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2708_c10_5301]
signal BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2708_c41_a272]
signal BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2708_c57_ff7e]
signal CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2708_c10_89db]
signal MUX_uxn_opcodes_h_l2708_c10_89db_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2708_c10_89db_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2708_c10_89db_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2708_c10_89db_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l2710_c2_ea42[uxn_opcodes_h_l2710_c2_ea42]
signal printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2712_c6_835b]
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_89e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_ad3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2712_c2_df49]
signal opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2712_c2_df49]
signal is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2712_c23_0fe2[uxn_opcodes_h_l2712_c23_0fe2]
signal printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_441b]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_1c72]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_3e3e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2713_c7_ad3a]
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2713_c41_62ed]
signal jci_uxn_opcodes_h_l2713_c41_62ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2713_c41_62ed_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2713_c41_62ed_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2713_c41_62ed_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2713_c41_62ed_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2713_c41_62ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_00a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_3772]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_0342]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2714_c7_3e3e]
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2714_c41_aa82]
signal jmi_uxn_opcodes_h_l2714_c41_aa82_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2714_c41_aa82_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2714_c41_aa82_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2714_c41_aa82_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2714_c41_aa82_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_e66b]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_f5cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_3e54]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2715_c7_0342]
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2715_c41_7bab]
signal jsi_uxn_opcodes_h_l2715_c41_7bab_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2715_c41_7bab_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2715_c41_7bab_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2715_c41_7bab_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2715_c41_7bab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_f6cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_e12a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_308e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2716_c7_3e54]
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2716_c41_8022]
signal lit_uxn_opcodes_h_l2716_c41_8022_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2716_c41_8022_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2716_c41_8022_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2716_c41_8022_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2716_c41_8022_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_01be]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_53cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_418a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2717_c7_308e]
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2717_c41_534d]
signal lit2_uxn_opcodes_h_l2717_c41_534d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2717_c41_534d_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2717_c41_534d_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2717_c41_534d_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2717_c41_534d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_eefb]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_884f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_7ca0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2718_c7_418a]
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2718_c41_2935]
signal lit_uxn_opcodes_h_l2718_c41_2935_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2718_c41_2935_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2718_c41_2935_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2718_c41_2935_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2718_c41_2935_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_f338]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_0eaa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_0883]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2719_c7_7ca0]
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2719_c41_a705]
signal lit2_uxn_opcodes_h_l2719_c41_a705_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2719_c41_a705_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2719_c41_a705_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2719_c41_a705_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2719_c41_a705_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_0549]
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_aac9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_0007]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2720_c7_0883]
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2720_c41_f325]
signal inc_uxn_opcodes_h_l2720_c41_f325_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2720_c41_f325_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2720_c41_f325_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2720_c41_f325_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2720_c41_f325_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_fb4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_6ae9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_290e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2721_c7_0007]
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2721_c41_d2b2]
signal inc2_uxn_opcodes_h_l2721_c41_d2b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2721_c41_d2b2_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2721_c41_d2b2_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2721_c41_d2b2_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_e770]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_024b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_d3f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2722_c7_290e]
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2722_c41_a1cf]
signal pop_uxn_opcodes_h_l2722_c41_a1cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2722_c41_a1cf_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2722_c41_a1cf_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2722_c41_a1cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_87f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_d414]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_efaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2723_c7_d3f5]
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2723_c41_c7bb]
signal pop2_uxn_opcodes_h_l2723_c41_c7bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2723_c41_c7bb_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2723_c41_c7bb_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_2be3]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_411d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_799c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2724_c7_efaa]
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2724_c41_2f9f]
signal nip_uxn_opcodes_h_l2724_c41_2f9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2724_c41_2f9f_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2724_c41_2f9f_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2724_c41_2f9f_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2724_c41_2f9f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_ed4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_bf44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_2cab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2725_c7_799c]
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2725_c41_9c61]
signal nip2_uxn_opcodes_h_l2725_c41_9c61_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2725_c41_9c61_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2725_c41_9c61_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2725_c41_9c61_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2725_c41_9c61_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_f114]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_d9e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_5595]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2726_c7_2cab]
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2726_c41_e603]
signal swp_uxn_opcodes_h_l2726_c41_e603_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2726_c41_e603_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2726_c41_e603_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2726_c41_e603_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2726_c41_e603_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_c858]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_1882]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_0c15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2727_c7_5595]
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2727_c41_5b20]
signal swp2_uxn_opcodes_h_l2727_c41_5b20_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2727_c41_5b20_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2727_c41_5b20_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2727_c41_5b20_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2727_c41_5b20_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_a413]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_8896]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_e650]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2728_c7_0c15]
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2728_c41_89d4]
signal rot_uxn_opcodes_h_l2728_c41_89d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2728_c41_89d4_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2728_c41_89d4_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2728_c41_89d4_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2728_c41_89d4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_0140]
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_680f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_5ea2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2729_c7_e650]
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2729_c41_524c]
signal rot2_uxn_opcodes_h_l2729_c41_524c_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2729_c41_524c_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2729_c41_524c_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2729_c41_524c_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2729_c41_524c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_c69c]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_e9d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_a628]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2730_c7_5ea2]
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2730_c41_5294]
signal dup_uxn_opcodes_h_l2730_c41_5294_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2730_c41_5294_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2730_c41_5294_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2730_c41_5294_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2730_c41_5294_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_0684]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_914f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_5fc0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2731_c7_a628]
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2731_c41_5997]
signal dup2_uxn_opcodes_h_l2731_c41_5997_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2731_c41_5997_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2731_c41_5997_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2731_c41_5997_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2731_c41_5997_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_1981]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_072c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_4469]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2732_c7_5fc0]
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2732_c41_ab3a]
signal ovr_uxn_opcodes_h_l2732_c41_ab3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2732_c41_ab3a_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2732_c41_ab3a_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2732_c41_ab3a_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_cb68]
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_fbc9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_dfba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2733_c7_4469]
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2733_c41_4330]
signal ovr2_uxn_opcodes_h_l2733_c41_4330_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2733_c41_4330_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2733_c41_4330_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2733_c41_4330_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2733_c41_4330_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_8654]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_d4b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_e9fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2734_c7_dfba]
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2734_c41_d5de]
signal equ_uxn_opcodes_h_l2734_c41_d5de_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2734_c41_d5de_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2734_c41_d5de_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2734_c41_d5de_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2734_c41_d5de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_c2fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_dd84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_27d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2735_c7_e9fa]
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2735_c41_18f7]
signal equ2_uxn_opcodes_h_l2735_c41_18f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2735_c41_18f7_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2735_c41_18f7_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2735_c41_18f7_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2735_c41_18f7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_a0d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_28f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_de5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2736_c7_27d6]
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2736_c41_bbc0]
signal neq_uxn_opcodes_h_l2736_c41_bbc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2736_c41_bbc0_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2736_c41_bbc0_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2736_c41_bbc0_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2736_c41_bbc0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_c568]
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_0f99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_dadd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2737_c7_de5f]
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2737_c41_1abf]
signal neq2_uxn_opcodes_h_l2737_c41_1abf_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2737_c41_1abf_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2737_c41_1abf_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2737_c41_1abf_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2737_c41_1abf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_7d99]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_f5de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_3352]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2738_c7_dadd]
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2738_c41_41bf]
signal gth_uxn_opcodes_h_l2738_c41_41bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2738_c41_41bf_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2738_c41_41bf_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2738_c41_41bf_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2738_c41_41bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_4e7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_61ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_b05d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2739_c7_3352]
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2739_c41_0fc7]
signal gth2_uxn_opcodes_h_l2739_c41_0fc7_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2739_c41_0fc7_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2739_c41_0fc7_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2739_c41_0fc7_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_e874]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_02b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_fb11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2740_c7_b05d]
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2740_c41_0fb5]
signal lth_uxn_opcodes_h_l2740_c41_0fb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2740_c41_0fb5_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2740_c41_0fb5_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2740_c41_0fb5_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2740_c41_0fb5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_8ad6]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_45ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_45ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2741_c7_fb11]
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2741_c41_e9b4]
signal lth2_uxn_opcodes_h_l2741_c41_e9b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2741_c41_e9b4_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2741_c41_e9b4_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2741_c41_e9b4_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_37c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_9e2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_b538]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2742_c7_45ce]
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2742_c41_d4ea]
signal jmp_uxn_opcodes_h_l2742_c41_d4ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2742_c41_d4ea_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2742_c41_d4ea_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2742_c41_d4ea_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2742_c41_d4ea_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_d4b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_64b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_8556]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2743_c7_b538]
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2743_c41_b42d]
signal jmp2_uxn_opcodes_h_l2743_c41_b42d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2743_c41_b42d_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2743_c41_b42d_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2743_c41_b42d_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_b5fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_ffe5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_7cf7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2744_c7_8556]
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2744_c41_860d]
signal jcn_uxn_opcodes_h_l2744_c41_860d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2744_c41_860d_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2744_c41_860d_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2744_c41_860d_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2744_c41_860d_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2744_c41_860d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_bfbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_3788]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_e078]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2745_c7_7cf7]
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2745_c41_0a01]
signal jcn2_uxn_opcodes_h_l2745_c41_0a01_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2745_c41_0a01_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2745_c41_0a01_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2745_c41_0a01_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_75bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_45b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_0cde]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2746_c7_e078]
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2746_c41_9435]
signal jsr_uxn_opcodes_h_l2746_c41_9435_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2746_c41_9435_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2746_c41_9435_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2746_c41_9435_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2746_c41_9435_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2746_c41_9435_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_6010]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_baa0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_6595]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2747_c7_0cde]
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2747_c41_96e8]
signal jsr2_uxn_opcodes_h_l2747_c41_96e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2747_c41_96e8_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2747_c41_96e8_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2747_c41_96e8_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2747_c41_96e8_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_2a44]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_b24a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_e9d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2748_c7_6595]
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2748_c41_6c84]
signal sth_uxn_opcodes_h_l2748_c41_6c84_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2748_c41_6c84_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2748_c41_6c84_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2748_c41_6c84_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2748_c41_6c84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_1c50]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_43ef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_7da4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2749_c7_e9d5]
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2749_c41_2f57]
signal sth2_uxn_opcodes_h_l2749_c41_2f57_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2749_c41_2f57_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2749_c41_2f57_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2749_c41_2f57_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2749_c41_2f57_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_f925]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_9b97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_2c14]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2750_c7_7da4]
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2750_c41_0c60]
signal ldz_uxn_opcodes_h_l2750_c41_0c60_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2750_c41_0c60_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2750_c41_0c60_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2750_c41_0c60_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2750_c41_0c60_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2750_c41_0c60_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_1ab3]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_5364]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_566e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2751_c7_2c14]
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2751_c41_cb3a]
signal ldz2_uxn_opcodes_h_l2751_c41_cb3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2751_c41_cb3a_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2751_c41_cb3a_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_8c1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_d44b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_f663]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2752_c7_566e]
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2752_c41_a1b3]
signal stz_uxn_opcodes_h_l2752_c41_a1b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2752_c41_a1b3_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2752_c41_a1b3_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2752_c41_a1b3_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2752_c41_a1b3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_dea2]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_8776]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_609c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2753_c7_f663]
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2753_c41_69da]
signal stz2_uxn_opcodes_h_l2753_c41_69da_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2753_c41_69da_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2753_c41_69da_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2753_c41_69da_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2753_c41_69da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_0f5d]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_1213]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_72b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2754_c7_609c]
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2754_c41_4e51]
signal ldr_uxn_opcodes_h_l2754_c41_4e51_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2754_c41_4e51_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2754_c41_4e51_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2754_c41_4e51_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2754_c41_4e51_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2754_c41_4e51_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2754_c41_4e51_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_0558]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_9ff3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_6a4f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2755_c7_72b5]
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2755_c41_48ca]
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_705d]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_2b0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_a85b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2756_c7_6a4f]
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2756_c41_269a]
signal str1_uxn_opcodes_h_l2756_c41_269a_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2756_c41_269a_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2756_c41_269a_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2756_c41_269a_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2756_c41_269a_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2756_c41_269a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_fbb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_3046]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_ed4a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2757_c7_a85b]
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2757_c41_85ab]
signal str2_uxn_opcodes_h_l2757_c41_85ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2757_c41_85ab_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2757_c41_85ab_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2757_c41_85ab_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2757_c41_85ab_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2757_c41_85ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_bc99]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_212e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_447b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2758_c7_ed4a]
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2758_c41_cd8e]
signal lda_uxn_opcodes_h_l2758_c41_cd8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2758_c41_cd8e_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2758_c41_cd8e_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2758_c41_cd8e_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2758_c41_cd8e_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2758_c41_cd8e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_3771]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_b49c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_17e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2759_c7_447b]
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2759_c41_c75a]
signal lda2_uxn_opcodes_h_l2759_c41_c75a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2759_c41_c75a_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2759_c41_c75a_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2759_c41_c75a_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2759_c41_c75a_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2759_c41_c75a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_bdf0]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_4a34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_38ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2760_c7_17e7]
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2760_c41_a61d]
signal sta_uxn_opcodes_h_l2760_c41_a61d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2760_c41_a61d_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2760_c41_a61d_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2760_c41_a61d_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2760_c41_a61d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_dc0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_5cbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_76e9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2761_c7_38ea]
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2761_c41_17e8]
signal sta2_uxn_opcodes_h_l2761_c41_17e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2761_c41_17e8_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2761_c41_17e8_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2761_c41_17e8_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2761_c41_17e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_4699]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_a97c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_0d50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2762_c7_76e9]
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2762_c41_14d9]
signal dei_uxn_opcodes_h_l2762_c41_14d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2762_c41_14d9_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2762_c41_14d9_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2762_c41_14d9_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2762_c41_14d9_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2762_c41_14d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_49a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_50b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_0505]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2763_c7_0d50]
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2763_c41_d5bc]
signal dei2_uxn_opcodes_h_l2763_c41_d5bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2763_c41_d5bc_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2763_c41_d5bc_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_1921]
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_ce18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_4ba4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2764_c7_0505]
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2764_c41_da68]
signal deo_uxn_opcodes_h_l2764_c41_da68_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2764_c41_da68_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2764_c41_da68_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2764_c41_da68_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2764_c41_da68_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2764_c41_da68_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2764_c41_da68_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_c23d]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_e4bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_fbe4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2765_c7_4ba4]
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2765_c41_515c]
signal deo2_uxn_opcodes_h_l2765_c41_515c_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2765_c41_515c_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2765_c41_515c_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2765_c41_515c_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2765_c41_515c_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2765_c41_515c_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2765_c41_515c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_2354]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_31fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_f921]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2766_c7_fbe4]
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2766_c41_0c05]
signal add_uxn_opcodes_h_l2766_c41_0c05_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2766_c41_0c05_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2766_c41_0c05_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2766_c41_0c05_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2766_c41_0c05_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_a72b]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_2f26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_3297]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2767_c7_f921]
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2767_c41_b2b5]
signal add2_uxn_opcodes_h_l2767_c41_b2b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2767_c41_b2b5_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2767_c41_b2b5_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2767_c41_b2b5_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2767_c41_b2b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_1f13]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_ba9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_1a23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2768_c7_3297]
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2768_c41_75da]
signal sub_uxn_opcodes_h_l2768_c41_75da_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2768_c41_75da_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2768_c41_75da_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2768_c41_75da_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2768_c41_75da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_69b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_6f9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_10e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2769_c7_1a23]
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2769_c41_30b5]
signal sub2_uxn_opcodes_h_l2769_c41_30b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2769_c41_30b5_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2769_c41_30b5_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2769_c41_30b5_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2769_c41_30b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_a4aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_76c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_ada7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2770_c7_10e2]
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2770_c41_9793]
signal mul_uxn_opcodes_h_l2770_c41_9793_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2770_c41_9793_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2770_c41_9793_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2770_c41_9793_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2770_c41_9793_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_0739]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_c668]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_4632]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2771_c7_ada7]
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2771_c41_46d5]
signal mul2_uxn_opcodes_h_l2771_c41_46d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2771_c41_46d5_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2771_c41_46d5_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2771_c41_46d5_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2771_c41_46d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_2c65]
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_a448]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_d8a3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2772_c7_4632]
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2772_c41_8e54]
signal div_uxn_opcodes_h_l2772_c41_8e54_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2772_c41_8e54_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2772_c41_8e54_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2772_c41_8e54_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2772_c41_8e54_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_4373]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_4492]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_881d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2773_c7_d8a3]
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2773_c41_aa63]
signal div2_uxn_opcodes_h_l2773_c41_aa63_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2773_c41_aa63_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2773_c41_aa63_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2773_c41_aa63_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2773_c41_aa63_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_206a]
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_e76a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_6734]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2774_c7_881d]
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2774_c41_3dfd]
signal and_uxn_opcodes_h_l2774_c41_3dfd_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2774_c41_3dfd_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2774_c41_3dfd_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2774_c41_3dfd_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2774_c41_3dfd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_17ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_2328]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_d53c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2775_c7_6734]
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2775_c41_a635]
signal and2_uxn_opcodes_h_l2775_c41_a635_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2775_c41_a635_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2775_c41_a635_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2775_c41_a635_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2775_c41_a635_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_9229]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_fd17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_055b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2776_c7_d53c]
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2776_c41_39f2]
signal ora_uxn_opcodes_h_l2776_c41_39f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2776_c41_39f2_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2776_c41_39f2_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2776_c41_39f2_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2776_c41_39f2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_d0df]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_f860]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c7_919b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2777_c7_055b]
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2777_c41_7f9a]
signal ora2_uxn_opcodes_h_l2777_c41_7f9a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2777_c41_7f9a_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2777_c41_7f9a_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2777_c41_7f9a_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_3011]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_4bb8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c7_c1e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2778_c7_919b]
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2778_c41_7308]
signal eor_uxn_opcodes_h_l2778_c41_7308_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2778_c41_7308_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2778_c41_7308_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2778_c41_7308_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2778_c41_7308_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2779_c11_458c]
signal BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c1_d07d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c7_f571]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2779_c7_c1e7]
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2779_c41_2bd3]
signal eor2_uxn_opcodes_h_l2779_c41_2bd3_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2779_c41_2bd3_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2779_c41_2bd3_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2779_c41_2bd3_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2780_c11_cf04]
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c1_9c26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c7_6e1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2780_c7_f571]
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2780_c41_a107]
signal sft_uxn_opcodes_h_l2780_c41_a107_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2780_c41_a107_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2780_c41_a107_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2780_c41_a107_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2780_c41_a107_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_7f83]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c1_8085]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c1_3c10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2781_c7_6e1c]
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2781_c41_9367]
signal sft2_uxn_opcodes_h_l2781_c41_9367_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2781_c41_9367_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2781_c41_9367_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2781_c41_9367_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2781_c41_9367_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2782_c9_640b[uxn_opcodes_h_l2782_c9_640b]
signal printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2784_c18_8898]
signal BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2784_c18_1781]
signal BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2784_c18_a29c]
signal MUX_uxn_opcodes_h_l2784_c18_a29c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2784_c18_a29c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2784_c18_a29c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2784_c18_a29c_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2785_c2_7763]
signal BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2787_c2_b2ef]
signal sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2787_c2_b2ef]
signal sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2788_c3_ba80]
signal sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2788_c3_ba80]
signal sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2789_c4_3515]
signal BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2791_c4_9577]
signal BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2795_c30_37c1]
signal MUX_uxn_opcodes_h_l2795_c30_37c1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2795_c30_37c1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2795_c30_37c1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2795_c30_37c1_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2795_c19_3771]
signal BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2796_c20_4d7f]
signal MUX_uxn_opcodes_h_l2796_c20_4d7f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2796_c20_4d7f_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2796_c20_4d7f_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2796_c2_a05a]
signal BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2798_c21_abfa]
signal stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63
BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_left,
BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_right,
BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301
BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_left,
BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_right,
BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272
BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_left,
BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_right,
BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e
CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_x,
CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output);

-- MUX_uxn_opcodes_h_l2708_c10_89db
MUX_uxn_opcodes_h_l2708_c10_89db : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2708_c10_89db_cond,
MUX_uxn_opcodes_h_l2708_c10_89db_iftrue,
MUX_uxn_opcodes_h_l2708_c10_89db_iffalse,
MUX_uxn_opcodes_h_l2708_c10_89db_return_output);

-- printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42
printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42 : entity work.printf_uxn_opcodes_h_l2710_c2_ea42_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg0,
printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg1,
printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b
BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_left,
BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_right,
BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2712_c2_df49
opc_result_MUX_uxn_opcodes_h_l2712_c2_df49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_cond,
opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue,
opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse,
opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2712_c2_df49
is_wait_MUX_uxn_opcodes_h_l2712_c2_df49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_cond,
is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue,
is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse,
is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output);

-- printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2
printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2 : entity work.printf_uxn_opcodes_h_l2712_c23_0fe2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a
opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond,
opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output);

-- jci_uxn_opcodes_h_l2713_c41_62ed
jci_uxn_opcodes_h_l2713_c41_62ed : entity work.jci_0CLK_edc09f97 port map (
clk,
jci_uxn_opcodes_h_l2713_c41_62ed_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2713_c41_62ed_phase,
jci_uxn_opcodes_h_l2713_c41_62ed_pc,
jci_uxn_opcodes_h_l2713_c41_62ed_previous_stack_read,
jci_uxn_opcodes_h_l2713_c41_62ed_previous_ram_read,
jci_uxn_opcodes_h_l2713_c41_62ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e
opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond,
opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output);

-- jmi_uxn_opcodes_h_l2714_c41_aa82
jmi_uxn_opcodes_h_l2714_c41_aa82 : entity work.jmi_0CLK_8f4d4fc5 port map (
clk,
jmi_uxn_opcodes_h_l2714_c41_aa82_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2714_c41_aa82_phase,
jmi_uxn_opcodes_h_l2714_c41_aa82_pc,
jmi_uxn_opcodes_h_l2714_c41_aa82_previous_ram_read,
jmi_uxn_opcodes_h_l2714_c41_aa82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2715_c7_0342
opc_result_MUX_uxn_opcodes_h_l2715_c7_0342 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_cond,
opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue,
opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse,
opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output);

-- jsi_uxn_opcodes_h_l2715_c41_7bab
jsi_uxn_opcodes_h_l2715_c41_7bab : entity work.jsi_0CLK_af8c339b port map (
clk,
jsi_uxn_opcodes_h_l2715_c41_7bab_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2715_c41_7bab_phase,
jsi_uxn_opcodes_h_l2715_c41_7bab_pc,
jsi_uxn_opcodes_h_l2715_c41_7bab_previous_ram_read,
jsi_uxn_opcodes_h_l2715_c41_7bab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54
opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_cond,
opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue,
opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse,
opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output);

-- lit_uxn_opcodes_h_l2716_c41_8022
lit_uxn_opcodes_h_l2716_c41_8022 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2716_c41_8022_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2716_c41_8022_phase,
lit_uxn_opcodes_h_l2716_c41_8022_pc,
lit_uxn_opcodes_h_l2716_c41_8022_previous_ram_read,
lit_uxn_opcodes_h_l2716_c41_8022_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2717_c7_308e
opc_result_MUX_uxn_opcodes_h_l2717_c7_308e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_cond,
opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output);

-- lit2_uxn_opcodes_h_l2717_c41_534d
lit2_uxn_opcodes_h_l2717_c41_534d : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2717_c41_534d_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2717_c41_534d_phase,
lit2_uxn_opcodes_h_l2717_c41_534d_pc,
lit2_uxn_opcodes_h_l2717_c41_534d_previous_ram_read,
lit2_uxn_opcodes_h_l2717_c41_534d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2718_c7_418a
opc_result_MUX_uxn_opcodes_h_l2718_c7_418a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_cond,
opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output);

-- lit_uxn_opcodes_h_l2718_c41_2935
lit_uxn_opcodes_h_l2718_c41_2935 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2718_c41_2935_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2718_c41_2935_phase,
lit_uxn_opcodes_h_l2718_c41_2935_pc,
lit_uxn_opcodes_h_l2718_c41_2935_previous_ram_read,
lit_uxn_opcodes_h_l2718_c41_2935_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0
opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond,
opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output);

-- lit2_uxn_opcodes_h_l2719_c41_a705
lit2_uxn_opcodes_h_l2719_c41_a705 : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2719_c41_a705_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2719_c41_a705_phase,
lit2_uxn_opcodes_h_l2719_c41_a705_pc,
lit2_uxn_opcodes_h_l2719_c41_a705_previous_ram_read,
lit2_uxn_opcodes_h_l2719_c41_a705_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_left,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_right,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2720_c7_0883
opc_result_MUX_uxn_opcodes_h_l2720_c7_0883 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_cond,
opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue,
opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse,
opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output);

-- inc_uxn_opcodes_h_l2720_c41_f325
inc_uxn_opcodes_h_l2720_c41_f325 : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l2720_c41_f325_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2720_c41_f325_phase,
inc_uxn_opcodes_h_l2720_c41_f325_ins,
inc_uxn_opcodes_h_l2720_c41_f325_previous_stack_read,
inc_uxn_opcodes_h_l2720_c41_f325_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2721_c7_0007
opc_result_MUX_uxn_opcodes_h_l2721_c7_0007 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_cond,
opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue,
opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse,
opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output);

-- inc2_uxn_opcodes_h_l2721_c41_d2b2
inc2_uxn_opcodes_h_l2721_c41_d2b2 : entity work.inc2_0CLK_a6885b22 port map (
clk,
inc2_uxn_opcodes_h_l2721_c41_d2b2_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2721_c41_d2b2_phase,
inc2_uxn_opcodes_h_l2721_c41_d2b2_ins,
inc2_uxn_opcodes_h_l2721_c41_d2b2_previous_stack_read,
inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2722_c7_290e
opc_result_MUX_uxn_opcodes_h_l2722_c7_290e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_cond,
opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output);

-- pop_uxn_opcodes_h_l2722_c41_a1cf
pop_uxn_opcodes_h_l2722_c41_a1cf : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l2722_c41_a1cf_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2722_c41_a1cf_phase,
pop_uxn_opcodes_h_l2722_c41_a1cf_ins,
pop_uxn_opcodes_h_l2722_c41_a1cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5
opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond,
opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output);

-- pop2_uxn_opcodes_h_l2723_c41_c7bb
pop2_uxn_opcodes_h_l2723_c41_c7bb : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l2723_c41_c7bb_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2723_c41_c7bb_phase,
pop2_uxn_opcodes_h_l2723_c41_c7bb_ins,
pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa
opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_cond,
opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output);

-- nip_uxn_opcodes_h_l2724_c41_2f9f
nip_uxn_opcodes_h_l2724_c41_2f9f : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l2724_c41_2f9f_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2724_c41_2f9f_phase,
nip_uxn_opcodes_h_l2724_c41_2f9f_ins,
nip_uxn_opcodes_h_l2724_c41_2f9f_previous_stack_read,
nip_uxn_opcodes_h_l2724_c41_2f9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2725_c7_799c
opc_result_MUX_uxn_opcodes_h_l2725_c7_799c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_cond,
opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output);

-- nip2_uxn_opcodes_h_l2725_c41_9c61
nip2_uxn_opcodes_h_l2725_c41_9c61 : entity work.nip2_0CLK_9a874500 port map (
clk,
nip2_uxn_opcodes_h_l2725_c41_9c61_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2725_c41_9c61_phase,
nip2_uxn_opcodes_h_l2725_c41_9c61_ins,
nip2_uxn_opcodes_h_l2725_c41_9c61_previous_stack_read,
nip2_uxn_opcodes_h_l2725_c41_9c61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab
opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_cond,
opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output);

-- swp_uxn_opcodes_h_l2726_c41_e603
swp_uxn_opcodes_h_l2726_c41_e603 : entity work.swp_0CLK_faaf4b1a port map (
clk,
swp_uxn_opcodes_h_l2726_c41_e603_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2726_c41_e603_phase,
swp_uxn_opcodes_h_l2726_c41_e603_ins,
swp_uxn_opcodes_h_l2726_c41_e603_previous_stack_read,
swp_uxn_opcodes_h_l2726_c41_e603_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2727_c7_5595
opc_result_MUX_uxn_opcodes_h_l2727_c7_5595 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_cond,
opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue,
opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse,
opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output);

-- swp2_uxn_opcodes_h_l2727_c41_5b20
swp2_uxn_opcodes_h_l2727_c41_5b20 : entity work.swp2_0CLK_e768ce5a port map (
clk,
swp2_uxn_opcodes_h_l2727_c41_5b20_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2727_c41_5b20_phase,
swp2_uxn_opcodes_h_l2727_c41_5b20_ins,
swp2_uxn_opcodes_h_l2727_c41_5b20_previous_stack_read,
swp2_uxn_opcodes_h_l2727_c41_5b20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15
opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_cond,
opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue,
opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse,
opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output);

-- rot_uxn_opcodes_h_l2728_c41_89d4
rot_uxn_opcodes_h_l2728_c41_89d4 : entity work.rot_0CLK_97e5913d port map (
clk,
rot_uxn_opcodes_h_l2728_c41_89d4_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2728_c41_89d4_phase,
rot_uxn_opcodes_h_l2728_c41_89d4_ins,
rot_uxn_opcodes_h_l2728_c41_89d4_previous_stack_read,
rot_uxn_opcodes_h_l2728_c41_89d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_left,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_right,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2729_c7_e650
opc_result_MUX_uxn_opcodes_h_l2729_c7_e650 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_cond,
opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue,
opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse,
opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output);

-- rot2_uxn_opcodes_h_l2729_c41_524c
rot2_uxn_opcodes_h_l2729_c41_524c : entity work.rot2_0CLK_93d1bbe8 port map (
clk,
rot2_uxn_opcodes_h_l2729_c41_524c_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2729_c41_524c_phase,
rot2_uxn_opcodes_h_l2729_c41_524c_ins,
rot2_uxn_opcodes_h_l2729_c41_524c_previous_stack_read,
rot2_uxn_opcodes_h_l2729_c41_524c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2
opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond,
opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output);

-- dup_uxn_opcodes_h_l2730_c41_5294
dup_uxn_opcodes_h_l2730_c41_5294 : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l2730_c41_5294_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2730_c41_5294_phase,
dup_uxn_opcodes_h_l2730_c41_5294_ins,
dup_uxn_opcodes_h_l2730_c41_5294_previous_stack_read,
dup_uxn_opcodes_h_l2730_c41_5294_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2731_c7_a628
opc_result_MUX_uxn_opcodes_h_l2731_c7_a628 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_cond,
opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue,
opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse,
opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output);

-- dup2_uxn_opcodes_h_l2731_c41_5997
dup2_uxn_opcodes_h_l2731_c41_5997 : entity work.dup2_0CLK_49f2c137 port map (
clk,
dup2_uxn_opcodes_h_l2731_c41_5997_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2731_c41_5997_phase,
dup2_uxn_opcodes_h_l2731_c41_5997_ins,
dup2_uxn_opcodes_h_l2731_c41_5997_previous_stack_read,
dup2_uxn_opcodes_h_l2731_c41_5997_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0
opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond,
opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output);

-- ovr_uxn_opcodes_h_l2732_c41_ab3a
ovr_uxn_opcodes_h_l2732_c41_ab3a : entity work.ovr_0CLK_6d7675a8 port map (
clk,
ovr_uxn_opcodes_h_l2732_c41_ab3a_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2732_c41_ab3a_phase,
ovr_uxn_opcodes_h_l2732_c41_ab3a_ins,
ovr_uxn_opcodes_h_l2732_c41_ab3a_previous_stack_read,
ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_left,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_right,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2733_c7_4469
opc_result_MUX_uxn_opcodes_h_l2733_c7_4469 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_cond,
opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue,
opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse,
opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output);

-- ovr2_uxn_opcodes_h_l2733_c41_4330
ovr2_uxn_opcodes_h_l2733_c41_4330 : entity work.ovr2_0CLK_946b5f6a port map (
clk,
ovr2_uxn_opcodes_h_l2733_c41_4330_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2733_c41_4330_phase,
ovr2_uxn_opcodes_h_l2733_c41_4330_ins,
ovr2_uxn_opcodes_h_l2733_c41_4330_previous_stack_read,
ovr2_uxn_opcodes_h_l2733_c41_4330_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba
opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_cond,
opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output);

-- equ_uxn_opcodes_h_l2734_c41_d5de
equ_uxn_opcodes_h_l2734_c41_d5de : entity work.equ_0CLK_85d5529e port map (
clk,
equ_uxn_opcodes_h_l2734_c41_d5de_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2734_c41_d5de_phase,
equ_uxn_opcodes_h_l2734_c41_d5de_ins,
equ_uxn_opcodes_h_l2734_c41_d5de_previous_stack_read,
equ_uxn_opcodes_h_l2734_c41_d5de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa
opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond,
opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output);

-- equ2_uxn_opcodes_h_l2735_c41_18f7
equ2_uxn_opcodes_h_l2735_c41_18f7 : entity work.equ2_0CLK_302e9520 port map (
clk,
equ2_uxn_opcodes_h_l2735_c41_18f7_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2735_c41_18f7_phase,
equ2_uxn_opcodes_h_l2735_c41_18f7_ins,
equ2_uxn_opcodes_h_l2735_c41_18f7_previous_stack_read,
equ2_uxn_opcodes_h_l2735_c41_18f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6
opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_cond,
opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output);

-- neq_uxn_opcodes_h_l2736_c41_bbc0
neq_uxn_opcodes_h_l2736_c41_bbc0 : entity work.neq_0CLK_85d5529e port map (
clk,
neq_uxn_opcodes_h_l2736_c41_bbc0_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2736_c41_bbc0_phase,
neq_uxn_opcodes_h_l2736_c41_bbc0_ins,
neq_uxn_opcodes_h_l2736_c41_bbc0_previous_stack_read,
neq_uxn_opcodes_h_l2736_c41_bbc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_left,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_right,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f
opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_cond,
opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output);

-- neq2_uxn_opcodes_h_l2737_c41_1abf
neq2_uxn_opcodes_h_l2737_c41_1abf : entity work.neq2_0CLK_302e9520 port map (
clk,
neq2_uxn_opcodes_h_l2737_c41_1abf_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2737_c41_1abf_phase,
neq2_uxn_opcodes_h_l2737_c41_1abf_ins,
neq2_uxn_opcodes_h_l2737_c41_1abf_previous_stack_read,
neq2_uxn_opcodes_h_l2737_c41_1abf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd
opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_cond,
opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output);

-- gth_uxn_opcodes_h_l2738_c41_41bf
gth_uxn_opcodes_h_l2738_c41_41bf : entity work.gth_0CLK_85d5529e port map (
clk,
gth_uxn_opcodes_h_l2738_c41_41bf_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2738_c41_41bf_phase,
gth_uxn_opcodes_h_l2738_c41_41bf_ins,
gth_uxn_opcodes_h_l2738_c41_41bf_previous_stack_read,
gth_uxn_opcodes_h_l2738_c41_41bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2739_c7_3352
opc_result_MUX_uxn_opcodes_h_l2739_c7_3352 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_cond,
opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue,
opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse,
opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output);

-- gth2_uxn_opcodes_h_l2739_c41_0fc7
gth2_uxn_opcodes_h_l2739_c41_0fc7 : entity work.gth2_0CLK_302e9520 port map (
clk,
gth2_uxn_opcodes_h_l2739_c41_0fc7_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2739_c41_0fc7_phase,
gth2_uxn_opcodes_h_l2739_c41_0fc7_ins,
gth2_uxn_opcodes_h_l2739_c41_0fc7_previous_stack_read,
gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d
opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_cond,
opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output);

-- lth_uxn_opcodes_h_l2740_c41_0fb5
lth_uxn_opcodes_h_l2740_c41_0fb5 : entity work.lth_0CLK_85d5529e port map (
clk,
lth_uxn_opcodes_h_l2740_c41_0fb5_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2740_c41_0fb5_phase,
lth_uxn_opcodes_h_l2740_c41_0fb5_ins,
lth_uxn_opcodes_h_l2740_c41_0fb5_previous_stack_read,
lth_uxn_opcodes_h_l2740_c41_0fb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11
opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_cond,
opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue,
opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse,
opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output);

-- lth2_uxn_opcodes_h_l2741_c41_e9b4
lth2_uxn_opcodes_h_l2741_c41_e9b4 : entity work.lth2_0CLK_302e9520 port map (
clk,
lth2_uxn_opcodes_h_l2741_c41_e9b4_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2741_c41_e9b4_phase,
lth2_uxn_opcodes_h_l2741_c41_e9b4_ins,
lth2_uxn_opcodes_h_l2741_c41_e9b4_previous_stack_read,
lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce
opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_cond,
opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output);

-- jmp_uxn_opcodes_h_l2742_c41_d4ea
jmp_uxn_opcodes_h_l2742_c41_d4ea : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l2742_c41_d4ea_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2742_c41_d4ea_phase,
jmp_uxn_opcodes_h_l2742_c41_d4ea_ins,
jmp_uxn_opcodes_h_l2742_c41_d4ea_pc,
jmp_uxn_opcodes_h_l2742_c41_d4ea_previous_stack_read,
jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2743_c7_b538
opc_result_MUX_uxn_opcodes_h_l2743_c7_b538 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_cond,
opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue,
opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse,
opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output);

-- jmp2_uxn_opcodes_h_l2743_c41_b42d
jmp2_uxn_opcodes_h_l2743_c41_b42d : entity work.jmp2_0CLK_0b1ee796 port map (
clk,
jmp2_uxn_opcodes_h_l2743_c41_b42d_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2743_c41_b42d_phase,
jmp2_uxn_opcodes_h_l2743_c41_b42d_ins,
jmp2_uxn_opcodes_h_l2743_c41_b42d_previous_stack_read,
jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2744_c7_8556
opc_result_MUX_uxn_opcodes_h_l2744_c7_8556 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_cond,
opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue,
opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse,
opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output);

-- jcn_uxn_opcodes_h_l2744_c41_860d
jcn_uxn_opcodes_h_l2744_c41_860d : entity work.jcn_0CLK_85d5529e port map (
clk,
jcn_uxn_opcodes_h_l2744_c41_860d_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2744_c41_860d_phase,
jcn_uxn_opcodes_h_l2744_c41_860d_ins,
jcn_uxn_opcodes_h_l2744_c41_860d_pc,
jcn_uxn_opcodes_h_l2744_c41_860d_previous_stack_read,
jcn_uxn_opcodes_h_l2744_c41_860d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7
opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond,
opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output);

-- jcn2_uxn_opcodes_h_l2745_c41_0a01
jcn2_uxn_opcodes_h_l2745_c41_0a01 : entity work.jcn2_0CLK_0226dad5 port map (
clk,
jcn2_uxn_opcodes_h_l2745_c41_0a01_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2745_c41_0a01_phase,
jcn2_uxn_opcodes_h_l2745_c41_0a01_ins,
jcn2_uxn_opcodes_h_l2745_c41_0a01_previous_stack_read,
jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2746_c7_e078
opc_result_MUX_uxn_opcodes_h_l2746_c7_e078 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_cond,
opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue,
opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse,
opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output);

-- jsr_uxn_opcodes_h_l2746_c41_9435
jsr_uxn_opcodes_h_l2746_c41_9435 : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l2746_c41_9435_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2746_c41_9435_phase,
jsr_uxn_opcodes_h_l2746_c41_9435_ins,
jsr_uxn_opcodes_h_l2746_c41_9435_pc,
jsr_uxn_opcodes_h_l2746_c41_9435_previous_stack_read,
jsr_uxn_opcodes_h_l2746_c41_9435_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde
opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_cond,
opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue,
opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse,
opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output);

-- jsr2_uxn_opcodes_h_l2747_c41_96e8
jsr2_uxn_opcodes_h_l2747_c41_96e8 : entity work.jsr2_0CLK_9728fdff port map (
clk,
jsr2_uxn_opcodes_h_l2747_c41_96e8_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2747_c41_96e8_phase,
jsr2_uxn_opcodes_h_l2747_c41_96e8_ins,
jsr2_uxn_opcodes_h_l2747_c41_96e8_pc,
jsr2_uxn_opcodes_h_l2747_c41_96e8_previous_stack_read,
jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2748_c7_6595
opc_result_MUX_uxn_opcodes_h_l2748_c7_6595 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_cond,
opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue,
opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse,
opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output);

-- sth_uxn_opcodes_h_l2748_c41_6c84
sth_uxn_opcodes_h_l2748_c41_6c84 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l2748_c41_6c84_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2748_c41_6c84_phase,
sth_uxn_opcodes_h_l2748_c41_6c84_ins,
sth_uxn_opcodes_h_l2748_c41_6c84_previous_stack_read,
sth_uxn_opcodes_h_l2748_c41_6c84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5
opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond,
opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output);

-- sth2_uxn_opcodes_h_l2749_c41_2f57
sth2_uxn_opcodes_h_l2749_c41_2f57 : entity work.sth2_0CLK_302e9520 port map (
clk,
sth2_uxn_opcodes_h_l2749_c41_2f57_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2749_c41_2f57_phase,
sth2_uxn_opcodes_h_l2749_c41_2f57_ins,
sth2_uxn_opcodes_h_l2749_c41_2f57_previous_stack_read,
sth2_uxn_opcodes_h_l2749_c41_2f57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4
opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_cond,
opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output);

-- ldz_uxn_opcodes_h_l2750_c41_0c60
ldz_uxn_opcodes_h_l2750_c41_0c60 : entity work.ldz_0CLK_f74745d5 port map (
clk,
ldz_uxn_opcodes_h_l2750_c41_0c60_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2750_c41_0c60_phase,
ldz_uxn_opcodes_h_l2750_c41_0c60_ins,
ldz_uxn_opcodes_h_l2750_c41_0c60_previous_stack_read,
ldz_uxn_opcodes_h_l2750_c41_0c60_previous_ram_read,
ldz_uxn_opcodes_h_l2750_c41_0c60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14
opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_cond,
opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue,
opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse,
opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output);

-- ldz2_uxn_opcodes_h_l2751_c41_cb3a
ldz2_uxn_opcodes_h_l2751_c41_cb3a : entity work.ldz2_0CLK_d662d237 port map (
clk,
ldz2_uxn_opcodes_h_l2751_c41_cb3a_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2751_c41_cb3a_phase,
ldz2_uxn_opcodes_h_l2751_c41_cb3a_ins,
ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_stack_read,
ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_ram_read,
ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2752_c7_566e
opc_result_MUX_uxn_opcodes_h_l2752_c7_566e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_cond,
opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output);

-- stz_uxn_opcodes_h_l2752_c41_a1b3
stz_uxn_opcodes_h_l2752_c41_a1b3 : entity work.stz_0CLK_ffdfe23b port map (
clk,
stz_uxn_opcodes_h_l2752_c41_a1b3_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2752_c41_a1b3_phase,
stz_uxn_opcodes_h_l2752_c41_a1b3_ins,
stz_uxn_opcodes_h_l2752_c41_a1b3_previous_stack_read,
stz_uxn_opcodes_h_l2752_c41_a1b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2753_c7_f663
opc_result_MUX_uxn_opcodes_h_l2753_c7_f663 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_cond,
opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue,
opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse,
opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output);

-- stz2_uxn_opcodes_h_l2753_c41_69da
stz2_uxn_opcodes_h_l2753_c41_69da : entity work.stz2_0CLK_4f993427 port map (
clk,
stz2_uxn_opcodes_h_l2753_c41_69da_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2753_c41_69da_phase,
stz2_uxn_opcodes_h_l2753_c41_69da_ins,
stz2_uxn_opcodes_h_l2753_c41_69da_previous_stack_read,
stz2_uxn_opcodes_h_l2753_c41_69da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2754_c7_609c
opc_result_MUX_uxn_opcodes_h_l2754_c7_609c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_cond,
opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output);

-- ldr_uxn_opcodes_h_l2754_c41_4e51
ldr_uxn_opcodes_h_l2754_c41_4e51 : entity work.ldr_0CLK_c61094da port map (
clk,
ldr_uxn_opcodes_h_l2754_c41_4e51_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2754_c41_4e51_phase,
ldr_uxn_opcodes_h_l2754_c41_4e51_ins,
ldr_uxn_opcodes_h_l2754_c41_4e51_pc,
ldr_uxn_opcodes_h_l2754_c41_4e51_previous_stack_read,
ldr_uxn_opcodes_h_l2754_c41_4e51_previous_ram_read,
ldr_uxn_opcodes_h_l2754_c41_4e51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5
opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_cond,
opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output);

-- ldr2_uxn_opcodes_h_l2755_c41_48ca
ldr2_uxn_opcodes_h_l2755_c41_48ca : entity work.ldr2_0CLK_6193b0ef port map (
clk,
ldr2_uxn_opcodes_h_l2755_c41_48ca_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2755_c41_48ca_phase,
ldr2_uxn_opcodes_h_l2755_c41_48ca_ins,
ldr2_uxn_opcodes_h_l2755_c41_48ca_pc,
ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_stack_read,
ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_ram_read,
ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f
opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond,
opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output);

-- str1_uxn_opcodes_h_l2756_c41_269a
str1_uxn_opcodes_h_l2756_c41_269a : entity work.str1_0CLK_faaf4b1a port map (
clk,
str1_uxn_opcodes_h_l2756_c41_269a_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2756_c41_269a_phase,
str1_uxn_opcodes_h_l2756_c41_269a_ins,
str1_uxn_opcodes_h_l2756_c41_269a_pc,
str1_uxn_opcodes_h_l2756_c41_269a_previous_stack_read,
str1_uxn_opcodes_h_l2756_c41_269a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b
opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_cond,
opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output);

-- str2_uxn_opcodes_h_l2757_c41_85ab
str2_uxn_opcodes_h_l2757_c41_85ab : entity work.str2_0CLK_4f993427 port map (
clk,
str2_uxn_opcodes_h_l2757_c41_85ab_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2757_c41_85ab_phase,
str2_uxn_opcodes_h_l2757_c41_85ab_ins,
str2_uxn_opcodes_h_l2757_c41_85ab_pc,
str2_uxn_opcodes_h_l2757_c41_85ab_previous_stack_read,
str2_uxn_opcodes_h_l2757_c41_85ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a
opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond,
opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output);

-- lda_uxn_opcodes_h_l2758_c41_cd8e
lda_uxn_opcodes_h_l2758_c41_cd8e : entity work.lda_0CLK_dc46ab2b port map (
clk,
lda_uxn_opcodes_h_l2758_c41_cd8e_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2758_c41_cd8e_phase,
lda_uxn_opcodes_h_l2758_c41_cd8e_ins,
lda_uxn_opcodes_h_l2758_c41_cd8e_previous_stack_read,
lda_uxn_opcodes_h_l2758_c41_cd8e_previous_ram_read,
lda_uxn_opcodes_h_l2758_c41_cd8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2759_c7_447b
opc_result_MUX_uxn_opcodes_h_l2759_c7_447b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_cond,
opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output);

-- lda2_uxn_opcodes_h_l2759_c41_c75a
lda2_uxn_opcodes_h_l2759_c41_c75a : entity work.lda2_0CLK_0d6e2712 port map (
clk,
lda2_uxn_opcodes_h_l2759_c41_c75a_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2759_c41_c75a_phase,
lda2_uxn_opcodes_h_l2759_c41_c75a_ins,
lda2_uxn_opcodes_h_l2759_c41_c75a_previous_stack_read,
lda2_uxn_opcodes_h_l2759_c41_c75a_previous_ram_read,
lda2_uxn_opcodes_h_l2759_c41_c75a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7
opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_cond,
opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output);

-- sta_uxn_opcodes_h_l2760_c41_a61d
sta_uxn_opcodes_h_l2760_c41_a61d : entity work.sta_0CLK_d2dce55b port map (
clk,
sta_uxn_opcodes_h_l2760_c41_a61d_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2760_c41_a61d_phase,
sta_uxn_opcodes_h_l2760_c41_a61d_ins,
sta_uxn_opcodes_h_l2760_c41_a61d_previous_stack_read,
sta_uxn_opcodes_h_l2760_c41_a61d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea
opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_cond,
opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output);

-- sta2_uxn_opcodes_h_l2761_c41_17e8
sta2_uxn_opcodes_h_l2761_c41_17e8 : entity work.sta2_0CLK_7d7b1f8b port map (
clk,
sta2_uxn_opcodes_h_l2761_c41_17e8_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2761_c41_17e8_phase,
sta2_uxn_opcodes_h_l2761_c41_17e8_ins,
sta2_uxn_opcodes_h_l2761_c41_17e8_previous_stack_read,
sta2_uxn_opcodes_h_l2761_c41_17e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9
opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_cond,
opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output);

-- dei_uxn_opcodes_h_l2762_c41_14d9
dei_uxn_opcodes_h_l2762_c41_14d9 : entity work.dei_0CLK_1826c28e port map (
clk,
dei_uxn_opcodes_h_l2762_c41_14d9_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2762_c41_14d9_phase,
dei_uxn_opcodes_h_l2762_c41_14d9_ins,
dei_uxn_opcodes_h_l2762_c41_14d9_previous_stack_read,
dei_uxn_opcodes_h_l2762_c41_14d9_previous_device_ram_read,
dei_uxn_opcodes_h_l2762_c41_14d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50
opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_cond,
opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue,
opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse,
opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output);

-- dei2_uxn_opcodes_h_l2763_c41_d5bc
dei2_uxn_opcodes_h_l2763_c41_d5bc : entity work.dei2_0CLK_82b906b0 port map (
clk,
dei2_uxn_opcodes_h_l2763_c41_d5bc_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2763_c41_d5bc_phase,
dei2_uxn_opcodes_h_l2763_c41_d5bc_ins,
dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_stack_read,
dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_device_ram_read,
dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_left,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_right,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2764_c7_0505
opc_result_MUX_uxn_opcodes_h_l2764_c7_0505 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_cond,
opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue,
opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse,
opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output);

-- deo_uxn_opcodes_h_l2764_c41_da68
deo_uxn_opcodes_h_l2764_c41_da68 : entity work.deo_0CLK_0f1297eb port map (
clk,
deo_uxn_opcodes_h_l2764_c41_da68_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2764_c41_da68_phase,
deo_uxn_opcodes_h_l2764_c41_da68_ins,
deo_uxn_opcodes_h_l2764_c41_da68_previous_stack_read,
deo_uxn_opcodes_h_l2764_c41_da68_previous_device_ram_read,
deo_uxn_opcodes_h_l2764_c41_da68_previous_ram_read,
deo_uxn_opcodes_h_l2764_c41_da68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4
opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond,
opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output);

-- deo2_uxn_opcodes_h_l2765_c41_515c
deo2_uxn_opcodes_h_l2765_c41_515c : entity work.deo2_0CLK_0f83c89f port map (
clk,
deo2_uxn_opcodes_h_l2765_c41_515c_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2765_c41_515c_phase,
deo2_uxn_opcodes_h_l2765_c41_515c_ins,
deo2_uxn_opcodes_h_l2765_c41_515c_previous_stack_read,
deo2_uxn_opcodes_h_l2765_c41_515c_previous_device_ram_read,
deo2_uxn_opcodes_h_l2765_c41_515c_previous_ram_read,
deo2_uxn_opcodes_h_l2765_c41_515c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4
opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond,
opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output);

-- add_uxn_opcodes_h_l2766_c41_0c05
add_uxn_opcodes_h_l2766_c41_0c05 : entity work.add_0CLK_bacf6a1d port map (
clk,
add_uxn_opcodes_h_l2766_c41_0c05_CLOCK_ENABLE,
add_uxn_opcodes_h_l2766_c41_0c05_phase,
add_uxn_opcodes_h_l2766_c41_0c05_ins,
add_uxn_opcodes_h_l2766_c41_0c05_previous_stack_read,
add_uxn_opcodes_h_l2766_c41_0c05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2767_c7_f921
opc_result_MUX_uxn_opcodes_h_l2767_c7_f921 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_cond,
opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue,
opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse,
opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output);

-- add2_uxn_opcodes_h_l2767_c41_b2b5
add2_uxn_opcodes_h_l2767_c41_b2b5 : entity work.add2_0CLK_f74041be port map (
clk,
add2_uxn_opcodes_h_l2767_c41_b2b5_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2767_c41_b2b5_phase,
add2_uxn_opcodes_h_l2767_c41_b2b5_ins,
add2_uxn_opcodes_h_l2767_c41_b2b5_previous_stack_read,
add2_uxn_opcodes_h_l2767_c41_b2b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2768_c7_3297
opc_result_MUX_uxn_opcodes_h_l2768_c7_3297 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_cond,
opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue,
opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse,
opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output);

-- sub_uxn_opcodes_h_l2768_c41_75da
sub_uxn_opcodes_h_l2768_c41_75da : entity work.sub_0CLK_bacf6a1d port map (
clk,
sub_uxn_opcodes_h_l2768_c41_75da_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2768_c41_75da_phase,
sub_uxn_opcodes_h_l2768_c41_75da_ins,
sub_uxn_opcodes_h_l2768_c41_75da_previous_stack_read,
sub_uxn_opcodes_h_l2768_c41_75da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23
opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_cond,
opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue,
opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse,
opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output);

-- sub2_uxn_opcodes_h_l2769_c41_30b5
sub2_uxn_opcodes_h_l2769_c41_30b5 : entity work.sub2_0CLK_f74041be port map (
clk,
sub2_uxn_opcodes_h_l2769_c41_30b5_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2769_c41_30b5_phase,
sub2_uxn_opcodes_h_l2769_c41_30b5_ins,
sub2_uxn_opcodes_h_l2769_c41_30b5_previous_stack_read,
sub2_uxn_opcodes_h_l2769_c41_30b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2
opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_cond,
opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output);

-- mul_uxn_opcodes_h_l2770_c41_9793
mul_uxn_opcodes_h_l2770_c41_9793 : entity work.mul_0CLK_bacf6a1d port map (
clk,
mul_uxn_opcodes_h_l2770_c41_9793_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2770_c41_9793_phase,
mul_uxn_opcodes_h_l2770_c41_9793_ins,
mul_uxn_opcodes_h_l2770_c41_9793_previous_stack_read,
mul_uxn_opcodes_h_l2770_c41_9793_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7
opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_cond,
opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output);

-- mul2_uxn_opcodes_h_l2771_c41_46d5
mul2_uxn_opcodes_h_l2771_c41_46d5 : entity work.mul2_0CLK_f74041be port map (
clk,
mul2_uxn_opcodes_h_l2771_c41_46d5_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2771_c41_46d5_phase,
mul2_uxn_opcodes_h_l2771_c41_46d5_ins,
mul2_uxn_opcodes_h_l2771_c41_46d5_previous_stack_read,
mul2_uxn_opcodes_h_l2771_c41_46d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_left,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_right,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2772_c7_4632
opc_result_MUX_uxn_opcodes_h_l2772_c7_4632 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_cond,
opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue,
opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse,
opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output);

-- div_uxn_opcodes_h_l2772_c41_8e54
div_uxn_opcodes_h_l2772_c41_8e54 : entity work.div_0CLK_a35230ee port map (
clk,
div_uxn_opcodes_h_l2772_c41_8e54_CLOCK_ENABLE,
div_uxn_opcodes_h_l2772_c41_8e54_phase,
div_uxn_opcodes_h_l2772_c41_8e54_ins,
div_uxn_opcodes_h_l2772_c41_8e54_previous_stack_read,
div_uxn_opcodes_h_l2772_c41_8e54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3
opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond,
opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output);

-- div2_uxn_opcodes_h_l2773_c41_aa63
div2_uxn_opcodes_h_l2773_c41_aa63 : entity work.div2_0CLK_6d03de33 port map (
clk,
div2_uxn_opcodes_h_l2773_c41_aa63_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2773_c41_aa63_phase,
div2_uxn_opcodes_h_l2773_c41_aa63_ins,
div2_uxn_opcodes_h_l2773_c41_aa63_previous_stack_read,
div2_uxn_opcodes_h_l2773_c41_aa63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_left,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_right,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2774_c7_881d
opc_result_MUX_uxn_opcodes_h_l2774_c7_881d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_cond,
opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output);

-- and_uxn_opcodes_h_l2774_c41_3dfd
and_uxn_opcodes_h_l2774_c41_3dfd : entity work.and_0CLK_bacf6a1d port map (
clk,
and_uxn_opcodes_h_l2774_c41_3dfd_CLOCK_ENABLE,
and_uxn_opcodes_h_l2774_c41_3dfd_phase,
and_uxn_opcodes_h_l2774_c41_3dfd_ins,
and_uxn_opcodes_h_l2774_c41_3dfd_previous_stack_read,
and_uxn_opcodes_h_l2774_c41_3dfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2775_c7_6734
opc_result_MUX_uxn_opcodes_h_l2775_c7_6734 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_cond,
opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue,
opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse,
opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output);

-- and2_uxn_opcodes_h_l2775_c41_a635
and2_uxn_opcodes_h_l2775_c41_a635 : entity work.and2_0CLK_f74041be port map (
clk,
and2_uxn_opcodes_h_l2775_c41_a635_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2775_c41_a635_phase,
and2_uxn_opcodes_h_l2775_c41_a635_ins,
and2_uxn_opcodes_h_l2775_c41_a635_previous_stack_read,
and2_uxn_opcodes_h_l2775_c41_a635_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c
opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_cond,
opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output);

-- ora_uxn_opcodes_h_l2776_c41_39f2
ora_uxn_opcodes_h_l2776_c41_39f2 : entity work.ora_0CLK_bacf6a1d port map (
clk,
ora_uxn_opcodes_h_l2776_c41_39f2_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2776_c41_39f2_phase,
ora_uxn_opcodes_h_l2776_c41_39f2_ins,
ora_uxn_opcodes_h_l2776_c41_39f2_previous_stack_read,
ora_uxn_opcodes_h_l2776_c41_39f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2777_c7_055b
opc_result_MUX_uxn_opcodes_h_l2777_c7_055b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_cond,
opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output);

-- ora2_uxn_opcodes_h_l2777_c41_7f9a
ora2_uxn_opcodes_h_l2777_c41_7f9a : entity work.ora2_0CLK_f74041be port map (
clk,
ora2_uxn_opcodes_h_l2777_c41_7f9a_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2777_c41_7f9a_phase,
ora2_uxn_opcodes_h_l2777_c41_7f9a_ins,
ora2_uxn_opcodes_h_l2777_c41_7f9a_previous_stack_read,
ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2778_c7_919b
opc_result_MUX_uxn_opcodes_h_l2778_c7_919b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_cond,
opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output);

-- eor_uxn_opcodes_h_l2778_c41_7308
eor_uxn_opcodes_h_l2778_c41_7308 : entity work.eor_0CLK_bacf6a1d port map (
clk,
eor_uxn_opcodes_h_l2778_c41_7308_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2778_c41_7308_phase,
eor_uxn_opcodes_h_l2778_c41_7308_ins,
eor_uxn_opcodes_h_l2778_c41_7308_previous_stack_read,
eor_uxn_opcodes_h_l2778_c41_7308_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_left,
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_right,
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7
opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond,
opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output);

-- eor2_uxn_opcodes_h_l2779_c41_2bd3
eor2_uxn_opcodes_h_l2779_c41_2bd3 : entity work.eor2_0CLK_f74041be port map (
clk,
eor2_uxn_opcodes_h_l2779_c41_2bd3_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2779_c41_2bd3_phase,
eor2_uxn_opcodes_h_l2779_c41_2bd3_ins,
eor2_uxn_opcodes_h_l2779_c41_2bd3_previous_stack_read,
eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_left,
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_right,
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2780_c7_f571
opc_result_MUX_uxn_opcodes_h_l2780_c7_f571 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_cond,
opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue,
opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse,
opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output);

-- sft_uxn_opcodes_h_l2780_c41_a107
sft_uxn_opcodes_h_l2780_c41_a107 : entity work.sft_0CLK_10aab3e1 port map (
clk,
sft_uxn_opcodes_h_l2780_c41_a107_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2780_c41_a107_phase,
sft_uxn_opcodes_h_l2780_c41_a107_ins,
sft_uxn_opcodes_h_l2780_c41_a107_previous_stack_read,
sft_uxn_opcodes_h_l2780_c41_a107_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c
opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond,
opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output);

-- sft2_uxn_opcodes_h_l2781_c41_9367
sft2_uxn_opcodes_h_l2781_c41_9367 : entity work.sft2_0CLK_77062510 port map (
clk,
sft2_uxn_opcodes_h_l2781_c41_9367_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2781_c41_9367_phase,
sft2_uxn_opcodes_h_l2781_c41_9367_ins,
sft2_uxn_opcodes_h_l2781_c41_9367_previous_stack_read,
sft2_uxn_opcodes_h_l2781_c41_9367_return_output);

-- printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b
printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b : entity work.printf_uxn_opcodes_h_l2782_c9_640b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898
BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_left,
BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_right,
BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781
BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_left,
BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_right,
BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output);

-- MUX_uxn_opcodes_h_l2784_c18_a29c
MUX_uxn_opcodes_h_l2784_c18_a29c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2784_c18_a29c_cond,
MUX_uxn_opcodes_h_l2784_c18_a29c_iftrue,
MUX_uxn_opcodes_h_l2784_c18_a29c_iffalse,
MUX_uxn_opcodes_h_l2784_c18_a29c_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763
BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_left,
BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_right,
BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output);

-- sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef
sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond,
sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue,
sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse,
sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output);

-- sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef
sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond,
sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue,
sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse,
sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output);

-- sp0_MUX_uxn_opcodes_h_l2788_c3_ba80
sp0_MUX_uxn_opcodes_h_l2788_c3_ba80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_cond,
sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue,
sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse,
sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output);

-- sp1_MUX_uxn_opcodes_h_l2788_c3_ba80
sp1_MUX_uxn_opcodes_h_l2788_c3_ba80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_cond,
sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue,
sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse,
sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515
BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_left,
BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_right,
BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577
BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_left,
BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_right,
BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output);

-- MUX_uxn_opcodes_h_l2795_c30_37c1
MUX_uxn_opcodes_h_l2795_c30_37c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2795_c30_37c1_cond,
MUX_uxn_opcodes_h_l2795_c30_37c1_iftrue,
MUX_uxn_opcodes_h_l2795_c30_37c1_iffalse,
MUX_uxn_opcodes_h_l2795_c30_37c1_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771
BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771 : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_left,
BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_right,
BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output);

-- MUX_uxn_opcodes_h_l2796_c20_4d7f
MUX_uxn_opcodes_h_l2796_c20_4d7f : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2796_c20_4d7f_cond,
MUX_uxn_opcodes_h_l2796_c20_4d7f_iftrue,
MUX_uxn_opcodes_h_l2796_c20_4d7f_iffalse,
MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a
BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_left,
BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_right,
BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output);

-- stack_ram_update_uxn_opcodes_h_l2798_c21_abfa
stack_ram_update_uxn_opcodes_h_l2798_c21_abfa : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_stack_address,
stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_value,
stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_write_enable,
stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output,
 CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output,
 MUX_uxn_opcodes_h_l2708_c10_89db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output,
 is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output,
 jci_uxn_opcodes_h_l2713_c41_62ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output,
 opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output,
 jmi_uxn_opcodes_h_l2714_c41_aa82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output,
 opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output,
 jsi_uxn_opcodes_h_l2715_c41_7bab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output,
 lit_uxn_opcodes_h_l2716_c41_8022_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output,
 lit2_uxn_opcodes_h_l2717_c41_534d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output,
 lit_uxn_opcodes_h_l2718_c41_2935_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output,
 opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output,
 lit2_uxn_opcodes_h_l2719_c41_a705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output,
 opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output,
 inc_uxn_opcodes_h_l2720_c41_f325_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output,
 inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output,
 pop_uxn_opcodes_h_l2722_c41_a1cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output,
 pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output,
 nip_uxn_opcodes_h_l2724_c41_2f9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output,
 nip2_uxn_opcodes_h_l2725_c41_9c61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output,
 opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output,
 swp_uxn_opcodes_h_l2726_c41_e603_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output,
 opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output,
 swp2_uxn_opcodes_h_l2727_c41_5b20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output,
 opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output,
 rot_uxn_opcodes_h_l2728_c41_89d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output,
 rot2_uxn_opcodes_h_l2729_c41_524c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output,
 opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output,
 dup_uxn_opcodes_h_l2730_c41_5294_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output,
 dup2_uxn_opcodes_h_l2731_c41_5997_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output,
 opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output,
 ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output,
 ovr2_uxn_opcodes_h_l2733_c41_4330_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output,
 equ_uxn_opcodes_h_l2734_c41_d5de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output,
 equ2_uxn_opcodes_h_l2735_c41_18f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output,
 neq_uxn_opcodes_h_l2736_c41_bbc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output,
 neq2_uxn_opcodes_h_l2737_c41_1abf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output,
 opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output,
 gth_uxn_opcodes_h_l2738_c41_41bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output,
 gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output,
 opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output,
 lth_uxn_opcodes_h_l2740_c41_0fb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output,
 lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output,
 opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output,
 jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output,
 opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output,
 jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output,
 jcn_uxn_opcodes_h_l2744_c41_860d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output,
 opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output,
 jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output,
 opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output,
 jsr_uxn_opcodes_h_l2746_c41_9435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output,
 opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output,
 jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output,
 sth_uxn_opcodes_h_l2748_c41_6c84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output,
 sth2_uxn_opcodes_h_l2749_c41_2f57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output,
 opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output,
 ldz_uxn_opcodes_h_l2750_c41_0c60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output,
 ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output,
 opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output,
 stz_uxn_opcodes_h_l2752_c41_a1b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output,
 stz2_uxn_opcodes_h_l2753_c41_69da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output,
 ldr_uxn_opcodes_h_l2754_c41_4e51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output,
 ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output,
 str1_uxn_opcodes_h_l2756_c41_269a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output,
 str2_uxn_opcodes_h_l2757_c41_85ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output,
 lda_uxn_opcodes_h_l2758_c41_cd8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output,
 lda2_uxn_opcodes_h_l2759_c41_c75a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output,
 sta_uxn_opcodes_h_l2760_c41_a61d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output,
 sta2_uxn_opcodes_h_l2761_c41_17e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output,
 opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output,
 dei_uxn_opcodes_h_l2762_c41_14d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output,
 opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output,
 dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output,
 deo_uxn_opcodes_h_l2764_c41_da68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output,
 deo2_uxn_opcodes_h_l2765_c41_515c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output,
 opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output,
 add_uxn_opcodes_h_l2766_c41_0c05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output,
 opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output,
 add2_uxn_opcodes_h_l2767_c41_b2b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output,
 opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output,
 sub_uxn_opcodes_h_l2768_c41_75da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output,
 sub2_uxn_opcodes_h_l2769_c41_30b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output,
 mul_uxn_opcodes_h_l2770_c41_9793_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output,
 opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output,
 mul2_uxn_opcodes_h_l2771_c41_46d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output,
 div_uxn_opcodes_h_l2772_c41_8e54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output,
 div2_uxn_opcodes_h_l2773_c41_aa63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output,
 opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output,
 and_uxn_opcodes_h_l2774_c41_3dfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output,
 and2_uxn_opcodes_h_l2775_c41_a635_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output,
 ora_uxn_opcodes_h_l2776_c41_39f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output,
 ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output,
 eor_uxn_opcodes_h_l2778_c41_7308_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output,
 opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output,
 eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output,
 sft_uxn_opcodes_h_l2780_c41_a107_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output,
 opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output,
 sft2_uxn_opcodes_h_l2781_c41_9367_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output,
 MUX_uxn_opcodes_h_l2784_c18_a29c_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output,
 sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output,
 sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output,
 sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output,
 sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output,
 MUX_uxn_opcodes_h_l2795_c30_37c1_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output,
 MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output,
 stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2708_c2_cb4e : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2708_c10_89db_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2708_c10_89db_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2708_c10_89db_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2708_c30_1dbc_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2708_c57_3cc5_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2708_c10_89db_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2712_c2_df49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2713_c41_62ed_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2713_c41_62ed_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2713_c41_62ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2713_c41_62ed_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2713_c41_62ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2713_c41_62ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2716_c41_8022_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2716_c41_8022_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2716_c41_8022_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2716_c41_8022_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2716_c41_8022_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2717_c41_534d_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2717_c41_534d_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2717_c41_534d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2717_c41_534d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2717_c41_534d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2718_c41_2935_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2718_c41_2935_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2718_c41_2935_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2718_c41_2935_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2718_c41_2935_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2719_c41_a705_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2719_c41_a705_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2719_c41_a705_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2719_c41_a705_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2719_c41_a705_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2720_c41_f325_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2720_c41_f325_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2720_c41_f325_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2720_c41_f325_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2720_c41_f325_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2726_c41_e603_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2726_c41_e603_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2726_c41_e603_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2726_c41_e603_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2726_c41_e603_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2728_c41_89d4_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2728_c41_89d4_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2728_c41_89d4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2728_c41_89d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2728_c41_89d4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2729_c41_524c_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2729_c41_524c_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2729_c41_524c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2729_c41_524c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2729_c41_524c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2730_c41_5294_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2730_c41_5294_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2730_c41_5294_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2730_c41_5294_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2730_c41_5294_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2731_c41_5997_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2731_c41_5997_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2731_c41_5997_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2731_c41_5997_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2731_c41_5997_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2734_c41_d5de_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2734_c41_d5de_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2734_c41_d5de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2734_c41_d5de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2734_c41_d5de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2738_c41_41bf_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2738_c41_41bf_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2738_c41_41bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2738_c41_41bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2738_c41_41bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2744_c41_860d_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2744_c41_860d_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2744_c41_860d_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2744_c41_860d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2744_c41_860d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2744_c41_860d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2746_c41_9435_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2746_c41_9435_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2746_c41_9435_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2746_c41_9435_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2746_c41_9435_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2746_c41_9435_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2748_c41_6c84_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2748_c41_6c84_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2748_c41_6c84_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2748_c41_6c84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2748_c41_6c84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2753_c41_69da_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2753_c41_69da_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2753_c41_69da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2753_c41_69da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2753_c41_69da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2756_c41_269a_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2756_c41_269a_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2756_c41_269a_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2756_c41_269a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2756_c41_269a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2756_c41_269a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2757_c41_85ab_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2757_c41_85ab_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2757_c41_85ab_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2757_c41_85ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2757_c41_85ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2757_c41_85ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2760_c41_a61d_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2760_c41_a61d_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2760_c41_a61d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2760_c41_a61d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2760_c41_a61d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2762_c41_14d9_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2762_c41_14d9_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2762_c41_14d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2762_c41_14d9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2762_c41_14d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2762_c41_14d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2764_c41_da68_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2765_c41_515c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2766_c41_0c05_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2766_c41_0c05_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2766_c41_0c05_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2766_c41_0c05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2766_c41_0c05_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2768_c41_75da_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2768_c41_75da_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2768_c41_75da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2768_c41_75da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2768_c41_75da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2770_c41_9793_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2770_c41_9793_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2770_c41_9793_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2770_c41_9793_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2770_c41_9793_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2772_c41_8e54_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2772_c41_8e54_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2772_c41_8e54_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2772_c41_8e54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2772_c41_8e54_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2773_c41_aa63_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2773_c41_aa63_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2773_c41_aa63_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2773_c41_aa63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2773_c41_aa63_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2774_c41_3dfd_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2774_c41_3dfd_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2774_c41_3dfd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2774_c41_3dfd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2774_c41_3dfd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2775_c41_a635_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2775_c41_a635_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2775_c41_a635_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2775_c41_a635_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2775_c41_a635_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2776_c41_39f2_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2776_c41_39f2_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2776_c41_39f2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2776_c41_39f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2776_c41_39f2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2778_c41_7308_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2778_c41_7308_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2778_c41_7308_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2778_c41_7308_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2778_c41_7308_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2780_c41_a107_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2780_c41_a107_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2780_c41_a107_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2780_c41_a107_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2780_c41_a107_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2781_c41_9367_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2781_c41_9367_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2781_c41_9367_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2781_c41_9367_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2781_c41_9367_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2785_c17_a9ae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2787_c6_fd78_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2791_c4_00f8 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2789_c4_56ee : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2795_c19_2414_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2795_c70_60d7_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2795_c59_40aa_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2796_c2_80fa : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2801_c3_eb0a_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2805_c39_0bab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2806_c40_13ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2807_c34_733e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2808_c30_5354_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2809_c33_759c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2810_c34_6e1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2811_c37_6670_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2812_c33_5ea6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2814_c32_da30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2791_l2789_DUPLICATE_8b7b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2789_l2791_DUPLICATE_6b3f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2813_l2800_DUPLICATE_9e41_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2816_l2694_DUPLICATE_9724_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_right := to_unsigned(37, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_right := to_unsigned(39, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_right := to_unsigned(16, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_right := to_unsigned(19, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_right := to_unsigned(22, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_right := to_unsigned(1024, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_right := to_unsigned(25, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_right := to_unsigned(56, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_right := to_unsigned(57, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_right := to_unsigned(2048, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_right := to_unsigned(58, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_right := to_unsigned(24, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_right := to_unsigned(64, 7);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_right := to_unsigned(44, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_right := to_unsigned(4, 3);
     VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_right := to_unsigned(28, 5);
     VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_iftrue := to_unsigned(256, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_iftrue := to_unsigned(1, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_right := to_unsigned(62, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_right := to_unsigned(3072, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_right := to_unsigned(52, 6);
     VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_right := to_unsigned(20, 5);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iftrue := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2766_c41_0c05_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2775_c41_a635_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2774_c41_3dfd_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2762_c41_14d9_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2773_c41_aa63_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2772_c41_8e54_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2731_c41_5997_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2730_c41_5294_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2778_c41_7308_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2734_c41_d5de_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2738_c41_41bf_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2720_c41_f325_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2744_c41_860d_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2746_c41_9435_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2770_c41_9793_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2776_c41_39f2_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2729_c41_524c_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2728_c41_89d4_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2781_c41_9367_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2780_c41_a107_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2760_c41_a61d_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2748_c41_6c84_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2756_c41_269a_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2757_c41_85ab_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2753_c41_69da_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2768_c41_75da_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2726_c41_e603_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2713_c41_62ed_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2744_c41_860d_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2746_c41_9435_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2717_c41_534d_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2719_c41_a705_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2716_c41_8022_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2718_c41_2935_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2756_c41_269a_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2757_c41_85ab_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2766_c41_0c05_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2775_c41_a635_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2774_c41_3dfd_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2762_c41_14d9_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2773_c41_aa63_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2772_c41_8e54_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2731_c41_5997_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2730_c41_5294_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2778_c41_7308_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2734_c41_d5de_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2738_c41_41bf_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2720_c41_f325_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2713_c41_62ed_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2744_c41_860d_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2746_c41_9435_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2717_c41_534d_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2719_c41_a705_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2716_c41_8022_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2718_c41_2935_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2770_c41_9793_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2776_c41_39f2_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2729_c41_524c_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2728_c41_89d4_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2781_c41_9367_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2780_c41_a107_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2760_c41_a61d_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2748_c41_6c84_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2756_c41_269a_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2757_c41_85ab_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2753_c41_69da_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2768_c41_75da_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2726_c41_e603_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2762_c41_14d9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2713_c41_62ed_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2717_c41_534d_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2719_c41_a705_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2716_c41_8022_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2718_c41_2935_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2766_c41_0c05_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2775_c41_a635_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2774_c41_3dfd_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l2762_c41_14d9_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2773_c41_aa63_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2772_c41_8e54_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2731_c41_5997_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2730_c41_5294_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2778_c41_7308_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2734_c41_d5de_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2738_c41_41bf_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2720_c41_f325_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2713_c41_62ed_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l2744_c41_860d_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l2746_c41_9435_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2770_c41_9793_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2776_c41_39f2_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2729_c41_524c_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2728_c41_89d4_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2781_c41_9367_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2780_c41_a107_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2760_c41_a61d_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l2748_c41_6c84_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l2756_c41_269a_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l2757_c41_85ab_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l2753_c41_69da_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2768_c41_75da_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2726_c41_e603_previous_stack_read := stack_read_value;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2708_c57_3cc5] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2708_c57_3cc5_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l2708_c10_6e63] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_left;
     BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output := BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2784_c18_8898] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_left;
     BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output := BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2712_c2_df49] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2712_c2_df49_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2708_c41_a272] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_left;
     BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output := BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c10_6e63_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2784_c18_8898_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2708_c57_3cc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2712_c2_df49_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2708_c10_5301] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_left;
     BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output := BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2784_c18_1781] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_left;
     BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output := BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2708_c30_1dbc] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2708_c30_1dbc_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2708_c41_a272_return_output);

     -- CONST_SL_4[uxn_opcodes_h_l2708_c57_ff7e] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output := CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2708_c10_89db_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2708_c10_5301_return_output;
     VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2784_c18_1781_return_output;
     VAR_MUX_uxn_opcodes_h_l2708_c10_89db_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2708_c30_1dbc_return_output;
     VAR_MUX_uxn_opcodes_h_l2708_c10_89db_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2708_c57_ff7e_return_output;
     -- MUX[uxn_opcodes_h_l2784_c18_a29c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2784_c18_a29c_cond <= VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_cond;
     MUX_uxn_opcodes_h_l2784_c18_a29c_iftrue <= VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_iftrue;
     MUX_uxn_opcodes_h_l2784_c18_a29c_iffalse <= VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_return_output := MUX_uxn_opcodes_h_l2784_c18_a29c_return_output;

     -- MUX[uxn_opcodes_h_l2708_c10_89db] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2708_c10_89db_cond <= VAR_MUX_uxn_opcodes_h_l2708_c10_89db_cond;
     MUX_uxn_opcodes_h_l2708_c10_89db_iftrue <= VAR_MUX_uxn_opcodes_h_l2708_c10_89db_iftrue;
     MUX_uxn_opcodes_h_l2708_c10_89db_iffalse <= VAR_MUX_uxn_opcodes_h_l2708_c10_89db_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2708_c10_89db_return_output := MUX_uxn_opcodes_h_l2708_c10_89db_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2708_c2_cb4e := VAR_MUX_uxn_opcodes_h_l2708_c10_89db_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_left := VAR_MUX_uxn_opcodes_h_l2784_c18_a29c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_left := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2708_c2_cb4e;
     VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg1 := resize(VAR_opc_uxn_opcodes_h_l2708_c2_cb4e, 32);
     VAR_printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2708_c2_cb4e, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2779_c11_458c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_0f5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_1c50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_4e7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_7f83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_f6cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_8c1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_705d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_2be3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_a4aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_8ad6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_c858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_eefb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_0140] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_left;
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output := BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_1f13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_c2fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_37c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_00a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_441b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_8654] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_d0df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_a0d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_f114] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_3771] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_0549] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_left;
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output := BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_e66b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_ed4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_c568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_left;
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output := BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_75bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_9229] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_7d99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_2354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_c69c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_01be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_fb4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_bfbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_a413] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_0558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_2c65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_69b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_1ab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2780_c11_cf04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_4373] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_fbb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_b5fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_17ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_e770] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_206a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_f925] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_2a44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_bdf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_e874] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_f338] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_cb68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_left;
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output := BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_dea2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_49a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output;

     -- printf_uxn_opcodes_h_l2710_c2_ea42[uxn_opcodes_h_l2710_c2_ea42] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg0 <= VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg0;
     printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg1 <= VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg1;
     printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg2 <= VAR_printf_uxn_opcodes_h_l2710_c2_ea42_uxn_opcodes_h_l2710_c2_ea42_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2712_c6_835b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_87f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_dc0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_c23d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_bc99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_1921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_left;
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output := BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_6010] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_0739] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_d4b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_0684] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_a72b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_3011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_4699] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_1981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c6_835b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_441b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_00a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_e66b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f6cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_01be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_eefb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_f338_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_0549_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_fb4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e770_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_87f5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_2be3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_ed4b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_f114_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c858_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_a413_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_0140_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_c69c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0684_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_1981_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_cb68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_8654_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_c2fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_a0d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c568_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7d99_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_4e7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e874_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_8ad6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_37c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_d4b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_b5fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_bfbb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_75bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_6010_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_2a44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_1c50_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f925_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_1ab3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_8c1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_dea2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_0f5d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_0558_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_705d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_fbb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_bc99_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_3771_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdf0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_dc0a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_4699_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_49a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_1921_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c23d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_2354_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a72b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_1f13_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_69b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_a4aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0739_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_2c65_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_4373_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_206a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_17ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_9229_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d0df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3011_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_458c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_cf04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_7f83_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_89e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_ad3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2712_c2_df49] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_cond;
     is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output := is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output;
     VAR_printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_89e0_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_1c72] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output;

     -- printf_uxn_opcodes_h_l2712_c23_0fe2[uxn_opcodes_h_l2712_c23_0fe2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2712_c23_0fe2_uxn_opcodes_h_l2712_c23_0fe2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_3e3e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output;
     VAR_jci_uxn_opcodes_h_l2713_c41_62ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_1c72_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_3772] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_0342] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output;

     -- jci[uxn_opcodes_h_l2713_c41_62ed] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2713_c41_62ed_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2713_c41_62ed_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2713_c41_62ed_phase <= VAR_jci_uxn_opcodes_h_l2713_c41_62ed_phase;
     jci_uxn_opcodes_h_l2713_c41_62ed_pc <= VAR_jci_uxn_opcodes_h_l2713_c41_62ed_pc;
     jci_uxn_opcodes_h_l2713_c41_62ed_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2713_c41_62ed_previous_stack_read;
     jci_uxn_opcodes_h_l2713_c41_62ed_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2713_c41_62ed_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2713_c41_62ed_return_output := jci_uxn_opcodes_h_l2713_c41_62ed_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_0342_return_output;
     VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_3772_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue := VAR_jci_uxn_opcodes_h_l2713_c41_62ed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_3e54] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output;

     -- jmi[uxn_opcodes_h_l2714_c41_aa82] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2714_c41_aa82_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2714_c41_aa82_phase <= VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_phase;
     jmi_uxn_opcodes_h_l2714_c41_aa82_pc <= VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_pc;
     jmi_uxn_opcodes_h_l2714_c41_aa82_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_return_output := jmi_uxn_opcodes_h_l2714_c41_aa82_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_f5cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output;
     VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_f5cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue := VAR_jmi_uxn_opcodes_h_l2714_c41_aa82_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_e12a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output;

     -- jsi[uxn_opcodes_h_l2715_c41_7bab] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2715_c41_7bab_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2715_c41_7bab_phase <= VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_phase;
     jsi_uxn_opcodes_h_l2715_c41_7bab_pc <= VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_pc;
     jsi_uxn_opcodes_h_l2715_c41_7bab_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_return_output := jsi_uxn_opcodes_h_l2715_c41_7bab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_308e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_308e_return_output;
     VAR_lit_uxn_opcodes_h_l2716_c41_8022_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_e12a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue := VAR_jsi_uxn_opcodes_h_l2715_c41_7bab_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_53cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_418a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output;

     -- lit[uxn_opcodes_h_l2716_c41_8022] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2716_c41_8022_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2716_c41_8022_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2716_c41_8022_phase <= VAR_lit_uxn_opcodes_h_l2716_c41_8022_phase;
     lit_uxn_opcodes_h_l2716_c41_8022_pc <= VAR_lit_uxn_opcodes_h_l2716_c41_8022_pc;
     lit_uxn_opcodes_h_l2716_c41_8022_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2716_c41_8022_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2716_c41_8022_return_output := lit_uxn_opcodes_h_l2716_c41_8022_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_418a_return_output;
     VAR_lit2_uxn_opcodes_h_l2717_c41_534d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_53cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue := VAR_lit_uxn_opcodes_h_l2716_c41_8022_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_884f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_7ca0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output;

     -- lit2[uxn_opcodes_h_l2717_c41_534d] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2717_c41_534d_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2717_c41_534d_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2717_c41_534d_phase <= VAR_lit2_uxn_opcodes_h_l2717_c41_534d_phase;
     lit2_uxn_opcodes_h_l2717_c41_534d_pc <= VAR_lit2_uxn_opcodes_h_l2717_c41_534d_pc;
     lit2_uxn_opcodes_h_l2717_c41_534d_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2717_c41_534d_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2717_c41_534d_return_output := lit2_uxn_opcodes_h_l2717_c41_534d_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output;
     VAR_lit_uxn_opcodes_h_l2718_c41_2935_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_884f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue := VAR_lit2_uxn_opcodes_h_l2717_c41_534d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_0eaa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output;

     -- lit[uxn_opcodes_h_l2718_c41_2935] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2718_c41_2935_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2718_c41_2935_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2718_c41_2935_phase <= VAR_lit_uxn_opcodes_h_l2718_c41_2935_phase;
     lit_uxn_opcodes_h_l2718_c41_2935_pc <= VAR_lit_uxn_opcodes_h_l2718_c41_2935_pc;
     lit_uxn_opcodes_h_l2718_c41_2935_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2718_c41_2935_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2718_c41_2935_return_output := lit_uxn_opcodes_h_l2718_c41_2935_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_0883] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_0883_return_output;
     VAR_lit2_uxn_opcodes_h_l2719_c41_a705_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_0eaa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue := VAR_lit_uxn_opcodes_h_l2718_c41_2935_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_0007] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_aac9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output;

     -- lit2[uxn_opcodes_h_l2719_c41_a705] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2719_c41_a705_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2719_c41_a705_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2719_c41_a705_phase <= VAR_lit2_uxn_opcodes_h_l2719_c41_a705_phase;
     lit2_uxn_opcodes_h_l2719_c41_a705_pc <= VAR_lit2_uxn_opcodes_h_l2719_c41_a705_pc;
     lit2_uxn_opcodes_h_l2719_c41_a705_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2719_c41_a705_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2719_c41_a705_return_output := lit2_uxn_opcodes_h_l2719_c41_a705_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_0007_return_output;
     VAR_inc_uxn_opcodes_h_l2720_c41_f325_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_aac9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue := VAR_lit2_uxn_opcodes_h_l2719_c41_a705_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_6ae9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output;

     -- inc[uxn_opcodes_h_l2720_c41_f325] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2720_c41_f325_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2720_c41_f325_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2720_c41_f325_phase <= VAR_inc_uxn_opcodes_h_l2720_c41_f325_phase;
     inc_uxn_opcodes_h_l2720_c41_f325_ins <= VAR_inc_uxn_opcodes_h_l2720_c41_f325_ins;
     inc_uxn_opcodes_h_l2720_c41_f325_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2720_c41_f325_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2720_c41_f325_return_output := inc_uxn_opcodes_h_l2720_c41_f325_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_290e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_290e_return_output;
     VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_6ae9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue := VAR_inc_uxn_opcodes_h_l2720_c41_f325_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_d3f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_024b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output;

     -- inc2[uxn_opcodes_h_l2721_c41_d2b2] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2721_c41_d2b2_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2721_c41_d2b2_phase <= VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_phase;
     inc2_uxn_opcodes_h_l2721_c41_d2b2_ins <= VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_ins;
     inc2_uxn_opcodes_h_l2721_c41_d2b2_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output := inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output;
     VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_024b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue := VAR_inc2_uxn_opcodes_h_l2721_c41_d2b2_return_output;
     -- pop[uxn_opcodes_h_l2722_c41_a1cf] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2722_c41_a1cf_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2722_c41_a1cf_phase <= VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_phase;
     pop_uxn_opcodes_h_l2722_c41_a1cf_ins <= VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_return_output := pop_uxn_opcodes_h_l2722_c41_a1cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_d414] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_efaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output;
     VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_d414_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue := VAR_pop_uxn_opcodes_h_l2722_c41_a1cf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_411d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output;

     -- pop2[uxn_opcodes_h_l2723_c41_c7bb] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2723_c41_c7bb_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2723_c41_c7bb_phase <= VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_phase;
     pop2_uxn_opcodes_h_l2723_c41_c7bb_ins <= VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output := pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_799c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_799c_return_output;
     VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_411d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue := VAR_pop2_uxn_opcodes_h_l2723_c41_c7bb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_bf44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_2cab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output;

     -- nip[uxn_opcodes_h_l2724_c41_2f9f] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2724_c41_2f9f_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2724_c41_2f9f_phase <= VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_phase;
     nip_uxn_opcodes_h_l2724_c41_2f9f_ins <= VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_ins;
     nip_uxn_opcodes_h_l2724_c41_2f9f_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_return_output := nip_uxn_opcodes_h_l2724_c41_2f9f_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output;
     VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_bf44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue := VAR_nip_uxn_opcodes_h_l2724_c41_2f9f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_5595] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output;

     -- nip2[uxn_opcodes_h_l2725_c41_9c61] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2725_c41_9c61_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2725_c41_9c61_phase <= VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_phase;
     nip2_uxn_opcodes_h_l2725_c41_9c61_ins <= VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_ins;
     nip2_uxn_opcodes_h_l2725_c41_9c61_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_return_output := nip2_uxn_opcodes_h_l2725_c41_9c61_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_d9e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5595_return_output;
     VAR_swp_uxn_opcodes_h_l2726_c41_e603_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_d9e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue := VAR_nip2_uxn_opcodes_h_l2725_c41_9c61_return_output;
     -- swp[uxn_opcodes_h_l2726_c41_e603] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2726_c41_e603_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2726_c41_e603_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2726_c41_e603_phase <= VAR_swp_uxn_opcodes_h_l2726_c41_e603_phase;
     swp_uxn_opcodes_h_l2726_c41_e603_ins <= VAR_swp_uxn_opcodes_h_l2726_c41_e603_ins;
     swp_uxn_opcodes_h_l2726_c41_e603_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2726_c41_e603_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2726_c41_e603_return_output := swp_uxn_opcodes_h_l2726_c41_e603_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_1882] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_0c15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output;
     VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1882_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue := VAR_swp_uxn_opcodes_h_l2726_c41_e603_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_8896] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_e650] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output;

     -- swp2[uxn_opcodes_h_l2727_c41_5b20] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2727_c41_5b20_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2727_c41_5b20_phase <= VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_phase;
     swp2_uxn_opcodes_h_l2727_c41_5b20_ins <= VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_ins;
     swp2_uxn_opcodes_h_l2727_c41_5b20_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_return_output := swp2_uxn_opcodes_h_l2727_c41_5b20_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e650_return_output;
     VAR_rot_uxn_opcodes_h_l2728_c41_89d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_8896_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue := VAR_swp2_uxn_opcodes_h_l2727_c41_5b20_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_680f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output;

     -- rot[uxn_opcodes_h_l2728_c41_89d4] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2728_c41_89d4_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2728_c41_89d4_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2728_c41_89d4_phase <= VAR_rot_uxn_opcodes_h_l2728_c41_89d4_phase;
     rot_uxn_opcodes_h_l2728_c41_89d4_ins <= VAR_rot_uxn_opcodes_h_l2728_c41_89d4_ins;
     rot_uxn_opcodes_h_l2728_c41_89d4_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2728_c41_89d4_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2728_c41_89d4_return_output := rot_uxn_opcodes_h_l2728_c41_89d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_5ea2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output;
     VAR_rot2_uxn_opcodes_h_l2729_c41_524c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_680f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue := VAR_rot_uxn_opcodes_h_l2728_c41_89d4_return_output;
     -- rot2[uxn_opcodes_h_l2729_c41_524c] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2729_c41_524c_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2729_c41_524c_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2729_c41_524c_phase <= VAR_rot2_uxn_opcodes_h_l2729_c41_524c_phase;
     rot2_uxn_opcodes_h_l2729_c41_524c_ins <= VAR_rot2_uxn_opcodes_h_l2729_c41_524c_ins;
     rot2_uxn_opcodes_h_l2729_c41_524c_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2729_c41_524c_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2729_c41_524c_return_output := rot2_uxn_opcodes_h_l2729_c41_524c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_e9d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_a628] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_a628_return_output;
     VAR_dup_uxn_opcodes_h_l2730_c41_5294_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_e9d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue := VAR_rot2_uxn_opcodes_h_l2729_c41_524c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_914f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_5fc0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output;

     -- dup[uxn_opcodes_h_l2730_c41_5294] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2730_c41_5294_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2730_c41_5294_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2730_c41_5294_phase <= VAR_dup_uxn_opcodes_h_l2730_c41_5294_phase;
     dup_uxn_opcodes_h_l2730_c41_5294_ins <= VAR_dup_uxn_opcodes_h_l2730_c41_5294_ins;
     dup_uxn_opcodes_h_l2730_c41_5294_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2730_c41_5294_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2730_c41_5294_return_output := dup_uxn_opcodes_h_l2730_c41_5294_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output;
     VAR_dup2_uxn_opcodes_h_l2731_c41_5997_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_914f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue := VAR_dup_uxn_opcodes_h_l2730_c41_5294_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_072c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output;

     -- dup2[uxn_opcodes_h_l2731_c41_5997] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2731_c41_5997_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2731_c41_5997_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2731_c41_5997_phase <= VAR_dup2_uxn_opcodes_h_l2731_c41_5997_phase;
     dup2_uxn_opcodes_h_l2731_c41_5997_ins <= VAR_dup2_uxn_opcodes_h_l2731_c41_5997_ins;
     dup2_uxn_opcodes_h_l2731_c41_5997_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2731_c41_5997_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2731_c41_5997_return_output := dup2_uxn_opcodes_h_l2731_c41_5997_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_4469] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_4469_return_output;
     VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_072c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue := VAR_dup2_uxn_opcodes_h_l2731_c41_5997_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_fbc9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output;

     -- ovr[uxn_opcodes_h_l2732_c41_ab3a] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2732_c41_ab3a_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2732_c41_ab3a_phase <= VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_phase;
     ovr_uxn_opcodes_h_l2732_c41_ab3a_ins <= VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_ins;
     ovr_uxn_opcodes_h_l2732_c41_ab3a_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output := ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_dfba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output;
     VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_fbc9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue := VAR_ovr_uxn_opcodes_h_l2732_c41_ab3a_return_output;
     -- ovr2[uxn_opcodes_h_l2733_c41_4330] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2733_c41_4330_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2733_c41_4330_phase <= VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_phase;
     ovr2_uxn_opcodes_h_l2733_c41_4330_ins <= VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_ins;
     ovr2_uxn_opcodes_h_l2733_c41_4330_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_return_output := ovr2_uxn_opcodes_h_l2733_c41_4330_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_e9fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_d4b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output;
     VAR_equ_uxn_opcodes_h_l2734_c41_d5de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_d4b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue := VAR_ovr2_uxn_opcodes_h_l2733_c41_4330_return_output;
     -- equ[uxn_opcodes_h_l2734_c41_d5de] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2734_c41_d5de_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2734_c41_d5de_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2734_c41_d5de_phase <= VAR_equ_uxn_opcodes_h_l2734_c41_d5de_phase;
     equ_uxn_opcodes_h_l2734_c41_d5de_ins <= VAR_equ_uxn_opcodes_h_l2734_c41_d5de_ins;
     equ_uxn_opcodes_h_l2734_c41_d5de_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2734_c41_d5de_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2734_c41_d5de_return_output := equ_uxn_opcodes_h_l2734_c41_d5de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_27d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_dd84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output;
     VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_dd84_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue := VAR_equ_uxn_opcodes_h_l2734_c41_d5de_return_output;
     -- equ2[uxn_opcodes_h_l2735_c41_18f7] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2735_c41_18f7_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2735_c41_18f7_phase <= VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_phase;
     equ2_uxn_opcodes_h_l2735_c41_18f7_ins <= VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_ins;
     equ2_uxn_opcodes_h_l2735_c41_18f7_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_return_output := equ2_uxn_opcodes_h_l2735_c41_18f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_de5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_28f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output;
     VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_28f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue := VAR_equ2_uxn_opcodes_h_l2735_c41_18f7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_dadd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output;

     -- neq[uxn_opcodes_h_l2736_c41_bbc0] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2736_c41_bbc0_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2736_c41_bbc0_phase <= VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_phase;
     neq_uxn_opcodes_h_l2736_c41_bbc0_ins <= VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_ins;
     neq_uxn_opcodes_h_l2736_c41_bbc0_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_return_output := neq_uxn_opcodes_h_l2736_c41_bbc0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_0f99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output;
     VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_0f99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue := VAR_neq_uxn_opcodes_h_l2736_c41_bbc0_return_output;
     -- neq2[uxn_opcodes_h_l2737_c41_1abf] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2737_c41_1abf_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2737_c41_1abf_phase <= VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_phase;
     neq2_uxn_opcodes_h_l2737_c41_1abf_ins <= VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_ins;
     neq2_uxn_opcodes_h_l2737_c41_1abf_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_return_output := neq2_uxn_opcodes_h_l2737_c41_1abf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_3352] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_f5de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_3352_return_output;
     VAR_gth_uxn_opcodes_h_l2738_c41_41bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_f5de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue := VAR_neq2_uxn_opcodes_h_l2737_c41_1abf_return_output;
     -- gth[uxn_opcodes_h_l2738_c41_41bf] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2738_c41_41bf_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2738_c41_41bf_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2738_c41_41bf_phase <= VAR_gth_uxn_opcodes_h_l2738_c41_41bf_phase;
     gth_uxn_opcodes_h_l2738_c41_41bf_ins <= VAR_gth_uxn_opcodes_h_l2738_c41_41bf_ins;
     gth_uxn_opcodes_h_l2738_c41_41bf_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2738_c41_41bf_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2738_c41_41bf_return_output := gth_uxn_opcodes_h_l2738_c41_41bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_b05d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_61ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output;
     VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_61ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue := VAR_gth_uxn_opcodes_h_l2738_c41_41bf_return_output;
     -- gth2[uxn_opcodes_h_l2739_c41_0fc7] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2739_c41_0fc7_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2739_c41_0fc7_phase <= VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_phase;
     gth2_uxn_opcodes_h_l2739_c41_0fc7_ins <= VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_ins;
     gth2_uxn_opcodes_h_l2739_c41_0fc7_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output := gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_fb11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_02b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output;
     VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_02b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue := VAR_gth2_uxn_opcodes_h_l2739_c41_0fc7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_45ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output;

     -- lth[uxn_opcodes_h_l2740_c41_0fb5] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2740_c41_0fb5_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2740_c41_0fb5_phase <= VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_phase;
     lth_uxn_opcodes_h_l2740_c41_0fb5_ins <= VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_ins;
     lth_uxn_opcodes_h_l2740_c41_0fb5_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_return_output := lth_uxn_opcodes_h_l2740_c41_0fb5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_45ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output;
     VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_45ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue := VAR_lth_uxn_opcodes_h_l2740_c41_0fb5_return_output;
     -- lth2[uxn_opcodes_h_l2741_c41_e9b4] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2741_c41_e9b4_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2741_c41_e9b4_phase <= VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_phase;
     lth2_uxn_opcodes_h_l2741_c41_e9b4_ins <= VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_ins;
     lth2_uxn_opcodes_h_l2741_c41_e9b4_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output := lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_b538] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_9e2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b538_return_output;
     VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_9e2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue := VAR_lth2_uxn_opcodes_h_l2741_c41_e9b4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_64b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output;

     -- jmp[uxn_opcodes_h_l2742_c41_d4ea] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2742_c41_d4ea_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2742_c41_d4ea_phase <= VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_phase;
     jmp_uxn_opcodes_h_l2742_c41_d4ea_ins <= VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_ins;
     jmp_uxn_opcodes_h_l2742_c41_d4ea_pc <= VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_pc;
     jmp_uxn_opcodes_h_l2742_c41_d4ea_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output := jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_8556] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_8556_return_output;
     VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_64b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue := VAR_jmp_uxn_opcodes_h_l2742_c41_d4ea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_7cf7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_ffe5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output;

     -- jmp2[uxn_opcodes_h_l2743_c41_b42d] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2743_c41_b42d_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2743_c41_b42d_phase <= VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_phase;
     jmp2_uxn_opcodes_h_l2743_c41_b42d_ins <= VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_ins;
     jmp2_uxn_opcodes_h_l2743_c41_b42d_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output := jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output;
     VAR_jcn_uxn_opcodes_h_l2744_c41_860d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_ffe5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue := VAR_jmp2_uxn_opcodes_h_l2743_c41_b42d_return_output;
     -- jcn[uxn_opcodes_h_l2744_c41_860d] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2744_c41_860d_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2744_c41_860d_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2744_c41_860d_phase <= VAR_jcn_uxn_opcodes_h_l2744_c41_860d_phase;
     jcn_uxn_opcodes_h_l2744_c41_860d_ins <= VAR_jcn_uxn_opcodes_h_l2744_c41_860d_ins;
     jcn_uxn_opcodes_h_l2744_c41_860d_pc <= VAR_jcn_uxn_opcodes_h_l2744_c41_860d_pc;
     jcn_uxn_opcodes_h_l2744_c41_860d_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2744_c41_860d_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2744_c41_860d_return_output := jcn_uxn_opcodes_h_l2744_c41_860d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_3788] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_e078] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_e078_return_output;
     VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_3788_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue := VAR_jcn_uxn_opcodes_h_l2744_c41_860d_return_output;
     -- jcn2[uxn_opcodes_h_l2745_c41_0a01] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2745_c41_0a01_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2745_c41_0a01_phase <= VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_phase;
     jcn2_uxn_opcodes_h_l2745_c41_0a01_ins <= VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_ins;
     jcn2_uxn_opcodes_h_l2745_c41_0a01_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output := jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_45b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_0cde] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output;
     VAR_jsr_uxn_opcodes_h_l2746_c41_9435_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_45b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue := VAR_jcn2_uxn_opcodes_h_l2745_c41_0a01_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_6595] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output;

     -- jsr[uxn_opcodes_h_l2746_c41_9435] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2746_c41_9435_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2746_c41_9435_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2746_c41_9435_phase <= VAR_jsr_uxn_opcodes_h_l2746_c41_9435_phase;
     jsr_uxn_opcodes_h_l2746_c41_9435_ins <= VAR_jsr_uxn_opcodes_h_l2746_c41_9435_ins;
     jsr_uxn_opcodes_h_l2746_c41_9435_pc <= VAR_jsr_uxn_opcodes_h_l2746_c41_9435_pc;
     jsr_uxn_opcodes_h_l2746_c41_9435_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2746_c41_9435_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2746_c41_9435_return_output := jsr_uxn_opcodes_h_l2746_c41_9435_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_baa0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_6595_return_output;
     VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_baa0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue := VAR_jsr_uxn_opcodes_h_l2746_c41_9435_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_b24a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_e9d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output;

     -- jsr2[uxn_opcodes_h_l2747_c41_96e8] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2747_c41_96e8_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2747_c41_96e8_phase <= VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_phase;
     jsr2_uxn_opcodes_h_l2747_c41_96e8_ins <= VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_ins;
     jsr2_uxn_opcodes_h_l2747_c41_96e8_pc <= VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_pc;
     jsr2_uxn_opcodes_h_l2747_c41_96e8_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output := jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output;
     VAR_sth_uxn_opcodes_h_l2748_c41_6c84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_b24a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue := VAR_jsr2_uxn_opcodes_h_l2747_c41_96e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_7da4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output;

     -- sth[uxn_opcodes_h_l2748_c41_6c84] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2748_c41_6c84_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2748_c41_6c84_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2748_c41_6c84_phase <= VAR_sth_uxn_opcodes_h_l2748_c41_6c84_phase;
     sth_uxn_opcodes_h_l2748_c41_6c84_ins <= VAR_sth_uxn_opcodes_h_l2748_c41_6c84_ins;
     sth_uxn_opcodes_h_l2748_c41_6c84_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2748_c41_6c84_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2748_c41_6c84_return_output := sth_uxn_opcodes_h_l2748_c41_6c84_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_43ef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output;
     VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_43ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue := VAR_sth_uxn_opcodes_h_l2748_c41_6c84_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_9b97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output;

     -- sth2[uxn_opcodes_h_l2749_c41_2f57] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2749_c41_2f57_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2749_c41_2f57_phase <= VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_phase;
     sth2_uxn_opcodes_h_l2749_c41_2f57_ins <= VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_ins;
     sth2_uxn_opcodes_h_l2749_c41_2f57_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_return_output := sth2_uxn_opcodes_h_l2749_c41_2f57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_2c14] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output;
     VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_9b97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue := VAR_sth2_uxn_opcodes_h_l2749_c41_2f57_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_5364] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output;

     -- ldz[uxn_opcodes_h_l2750_c41_0c60] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2750_c41_0c60_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2750_c41_0c60_phase <= VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_phase;
     ldz_uxn_opcodes_h_l2750_c41_0c60_ins <= VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_ins;
     ldz_uxn_opcodes_h_l2750_c41_0c60_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_previous_stack_read;
     ldz_uxn_opcodes_h_l2750_c41_0c60_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_return_output := ldz_uxn_opcodes_h_l2750_c41_0c60_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_566e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_566e_return_output;
     VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_5364_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue := VAR_ldz_uxn_opcodes_h_l2750_c41_0c60_return_output;
     -- ldz2[uxn_opcodes_h_l2751_c41_cb3a] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2751_c41_cb3a_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2751_c41_cb3a_phase <= VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_phase;
     ldz2_uxn_opcodes_h_l2751_c41_cb3a_ins <= VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_ins;
     ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_stack_read;
     ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output := ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_d44b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_f663] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_f663_return_output;
     VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d44b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue := VAR_ldz2_uxn_opcodes_h_l2751_c41_cb3a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_8776] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_609c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output;

     -- stz[uxn_opcodes_h_l2752_c41_a1b3] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2752_c41_a1b3_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2752_c41_a1b3_phase <= VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_phase;
     stz_uxn_opcodes_h_l2752_c41_a1b3_ins <= VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_ins;
     stz_uxn_opcodes_h_l2752_c41_a1b3_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_return_output := stz_uxn_opcodes_h_l2752_c41_a1b3_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_609c_return_output;
     VAR_stz2_uxn_opcodes_h_l2753_c41_69da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8776_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue := VAR_stz_uxn_opcodes_h_l2752_c41_a1b3_return_output;
     -- stz2[uxn_opcodes_h_l2753_c41_69da] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2753_c41_69da_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2753_c41_69da_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2753_c41_69da_phase <= VAR_stz2_uxn_opcodes_h_l2753_c41_69da_phase;
     stz2_uxn_opcodes_h_l2753_c41_69da_ins <= VAR_stz2_uxn_opcodes_h_l2753_c41_69da_ins;
     stz2_uxn_opcodes_h_l2753_c41_69da_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2753_c41_69da_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2753_c41_69da_return_output := stz2_uxn_opcodes_h_l2753_c41_69da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_72b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_1213] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output;
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_1213_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue := VAR_stz2_uxn_opcodes_h_l2753_c41_69da_return_output;
     -- ldr[uxn_opcodes_h_l2754_c41_4e51] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2754_c41_4e51_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2754_c41_4e51_phase <= VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_phase;
     ldr_uxn_opcodes_h_l2754_c41_4e51_ins <= VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_ins;
     ldr_uxn_opcodes_h_l2754_c41_4e51_pc <= VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_pc;
     ldr_uxn_opcodes_h_l2754_c41_4e51_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_previous_stack_read;
     ldr_uxn_opcodes_h_l2754_c41_4e51_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_return_output := ldr_uxn_opcodes_h_l2754_c41_4e51_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_6a4f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_9ff3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output;
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_9ff3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue := VAR_ldr_uxn_opcodes_h_l2754_c41_4e51_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_a85b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_2b0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output;

     -- ldr2[uxn_opcodes_h_l2755_c41_48ca] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2755_c41_48ca_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2755_c41_48ca_phase <= VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_phase;
     ldr2_uxn_opcodes_h_l2755_c41_48ca_ins <= VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_ins;
     ldr2_uxn_opcodes_h_l2755_c41_48ca_pc <= VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_pc;
     ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_stack_read;
     ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output := ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output;
     VAR_str1_uxn_opcodes_h_l2756_c41_269a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_2b0b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue := VAR_ldr2_uxn_opcodes_h_l2755_c41_48ca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_ed4a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_3046] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output;

     -- str1[uxn_opcodes_h_l2756_c41_269a] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2756_c41_269a_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2756_c41_269a_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2756_c41_269a_phase <= VAR_str1_uxn_opcodes_h_l2756_c41_269a_phase;
     str1_uxn_opcodes_h_l2756_c41_269a_ins <= VAR_str1_uxn_opcodes_h_l2756_c41_269a_ins;
     str1_uxn_opcodes_h_l2756_c41_269a_pc <= VAR_str1_uxn_opcodes_h_l2756_c41_269a_pc;
     str1_uxn_opcodes_h_l2756_c41_269a_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2756_c41_269a_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2756_c41_269a_return_output := str1_uxn_opcodes_h_l2756_c41_269a_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output;
     VAR_str2_uxn_opcodes_h_l2757_c41_85ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_3046_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue := VAR_str1_uxn_opcodes_h_l2756_c41_269a_return_output;
     -- str2[uxn_opcodes_h_l2757_c41_85ab] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2757_c41_85ab_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2757_c41_85ab_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2757_c41_85ab_phase <= VAR_str2_uxn_opcodes_h_l2757_c41_85ab_phase;
     str2_uxn_opcodes_h_l2757_c41_85ab_ins <= VAR_str2_uxn_opcodes_h_l2757_c41_85ab_ins;
     str2_uxn_opcodes_h_l2757_c41_85ab_pc <= VAR_str2_uxn_opcodes_h_l2757_c41_85ab_pc;
     str2_uxn_opcodes_h_l2757_c41_85ab_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2757_c41_85ab_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2757_c41_85ab_return_output := str2_uxn_opcodes_h_l2757_c41_85ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_447b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_212e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_447b_return_output;
     VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_212e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue := VAR_str2_uxn_opcodes_h_l2757_c41_85ab_return_output;
     -- lda[uxn_opcodes_h_l2758_c41_cd8e] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2758_c41_cd8e_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2758_c41_cd8e_phase <= VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_phase;
     lda_uxn_opcodes_h_l2758_c41_cd8e_ins <= VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_ins;
     lda_uxn_opcodes_h_l2758_c41_cd8e_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_previous_stack_read;
     lda_uxn_opcodes_h_l2758_c41_cd8e_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_return_output := lda_uxn_opcodes_h_l2758_c41_cd8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_17e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_b49c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output;
     VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_b49c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue := VAR_lda_uxn_opcodes_h_l2758_c41_cd8e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_4a34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output;

     -- lda2[uxn_opcodes_h_l2759_c41_c75a] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2759_c41_c75a_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2759_c41_c75a_phase <= VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_phase;
     lda2_uxn_opcodes_h_l2759_c41_c75a_ins <= VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_ins;
     lda2_uxn_opcodes_h_l2759_c41_c75a_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_previous_stack_read;
     lda2_uxn_opcodes_h_l2759_c41_c75a_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_return_output := lda2_uxn_opcodes_h_l2759_c41_c75a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_38ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output;
     VAR_sta_uxn_opcodes_h_l2760_c41_a61d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_4a34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue := VAR_lda2_uxn_opcodes_h_l2759_c41_c75a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_76e9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_5cbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output;

     -- sta[uxn_opcodes_h_l2760_c41_a61d] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2760_c41_a61d_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2760_c41_a61d_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2760_c41_a61d_phase <= VAR_sta_uxn_opcodes_h_l2760_c41_a61d_phase;
     sta_uxn_opcodes_h_l2760_c41_a61d_ins <= VAR_sta_uxn_opcodes_h_l2760_c41_a61d_ins;
     sta_uxn_opcodes_h_l2760_c41_a61d_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2760_c41_a61d_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2760_c41_a61d_return_output := sta_uxn_opcodes_h_l2760_c41_a61d_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output;
     VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_5cbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue := VAR_sta_uxn_opcodes_h_l2760_c41_a61d_return_output;
     -- sta2[uxn_opcodes_h_l2761_c41_17e8] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2761_c41_17e8_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2761_c41_17e8_phase <= VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_phase;
     sta2_uxn_opcodes_h_l2761_c41_17e8_ins <= VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_ins;
     sta2_uxn_opcodes_h_l2761_c41_17e8_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_return_output := sta2_uxn_opcodes_h_l2761_c41_17e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_a97c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_0d50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output;
     VAR_dei_uxn_opcodes_h_l2762_c41_14d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_a97c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue := VAR_sta2_uxn_opcodes_h_l2761_c41_17e8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_50b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output;

     -- dei[uxn_opcodes_h_l2762_c41_14d9] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2762_c41_14d9_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2762_c41_14d9_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2762_c41_14d9_phase <= VAR_dei_uxn_opcodes_h_l2762_c41_14d9_phase;
     dei_uxn_opcodes_h_l2762_c41_14d9_ins <= VAR_dei_uxn_opcodes_h_l2762_c41_14d9_ins;
     dei_uxn_opcodes_h_l2762_c41_14d9_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2762_c41_14d9_previous_stack_read;
     dei_uxn_opcodes_h_l2762_c41_14d9_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2762_c41_14d9_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2762_c41_14d9_return_output := dei_uxn_opcodes_h_l2762_c41_14d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_0505] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_0505_return_output;
     VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_50b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue := VAR_dei_uxn_opcodes_h_l2762_c41_14d9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_4ba4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output;

     -- dei2[uxn_opcodes_h_l2763_c41_d5bc] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2763_c41_d5bc_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2763_c41_d5bc_phase <= VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_phase;
     dei2_uxn_opcodes_h_l2763_c41_d5bc_ins <= VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_ins;
     dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_stack_read;
     dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output := dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_ce18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output;
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_ce18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue := VAR_dei2_uxn_opcodes_h_l2763_c41_d5bc_return_output;
     -- deo[uxn_opcodes_h_l2764_c41_da68] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2764_c41_da68_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2764_c41_da68_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2764_c41_da68_phase <= VAR_deo_uxn_opcodes_h_l2764_c41_da68_phase;
     deo_uxn_opcodes_h_l2764_c41_da68_ins <= VAR_deo_uxn_opcodes_h_l2764_c41_da68_ins;
     deo_uxn_opcodes_h_l2764_c41_da68_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_stack_read;
     deo_uxn_opcodes_h_l2764_c41_da68_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_device_ram_read;
     deo_uxn_opcodes_h_l2764_c41_da68_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2764_c41_da68_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2764_c41_da68_return_output := deo_uxn_opcodes_h_l2764_c41_da68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_e4bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_fbe4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output;
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_e4bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue := VAR_deo_uxn_opcodes_h_l2764_c41_da68_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_31fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_f921] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output;

     -- deo2[uxn_opcodes_h_l2765_c41_515c] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2765_c41_515c_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2765_c41_515c_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2765_c41_515c_phase <= VAR_deo2_uxn_opcodes_h_l2765_c41_515c_phase;
     deo2_uxn_opcodes_h_l2765_c41_515c_ins <= VAR_deo2_uxn_opcodes_h_l2765_c41_515c_ins;
     deo2_uxn_opcodes_h_l2765_c41_515c_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_stack_read;
     deo2_uxn_opcodes_h_l2765_c41_515c_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2765_c41_515c_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2765_c41_515c_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2765_c41_515c_return_output := deo2_uxn_opcodes_h_l2765_c41_515c_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f921_return_output;
     VAR_add_uxn_opcodes_h_l2766_c41_0c05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_31fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue := VAR_deo2_uxn_opcodes_h_l2765_c41_515c_return_output;
     -- add[uxn_opcodes_h_l2766_c41_0c05] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2766_c41_0c05_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2766_c41_0c05_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2766_c41_0c05_phase <= VAR_add_uxn_opcodes_h_l2766_c41_0c05_phase;
     add_uxn_opcodes_h_l2766_c41_0c05_ins <= VAR_add_uxn_opcodes_h_l2766_c41_0c05_ins;
     add_uxn_opcodes_h_l2766_c41_0c05_previous_stack_read <= VAR_add_uxn_opcodes_h_l2766_c41_0c05_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2766_c41_0c05_return_output := add_uxn_opcodes_h_l2766_c41_0c05_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_2f26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_3297] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_3297_return_output;
     VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_2f26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue := VAR_add_uxn_opcodes_h_l2766_c41_0c05_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_1a23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output;

     -- add2[uxn_opcodes_h_l2767_c41_b2b5] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2767_c41_b2b5_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2767_c41_b2b5_phase <= VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_phase;
     add2_uxn_opcodes_h_l2767_c41_b2b5_ins <= VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_ins;
     add2_uxn_opcodes_h_l2767_c41_b2b5_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_return_output := add2_uxn_opcodes_h_l2767_c41_b2b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_ba9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output;
     VAR_sub_uxn_opcodes_h_l2768_c41_75da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_ba9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue := VAR_add2_uxn_opcodes_h_l2767_c41_b2b5_return_output;
     -- sub[uxn_opcodes_h_l2768_c41_75da] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2768_c41_75da_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2768_c41_75da_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2768_c41_75da_phase <= VAR_sub_uxn_opcodes_h_l2768_c41_75da_phase;
     sub_uxn_opcodes_h_l2768_c41_75da_ins <= VAR_sub_uxn_opcodes_h_l2768_c41_75da_ins;
     sub_uxn_opcodes_h_l2768_c41_75da_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2768_c41_75da_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2768_c41_75da_return_output := sub_uxn_opcodes_h_l2768_c41_75da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_10e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_6f9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output;
     VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_6f9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue := VAR_sub_uxn_opcodes_h_l2768_c41_75da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_ada7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output;

     -- sub2[uxn_opcodes_h_l2769_c41_30b5] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2769_c41_30b5_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2769_c41_30b5_phase <= VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_phase;
     sub2_uxn_opcodes_h_l2769_c41_30b5_ins <= VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_ins;
     sub2_uxn_opcodes_h_l2769_c41_30b5_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_return_output := sub2_uxn_opcodes_h_l2769_c41_30b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_76c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output;
     VAR_mul_uxn_opcodes_h_l2770_c41_9793_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_76c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue := VAR_sub2_uxn_opcodes_h_l2769_c41_30b5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_c668] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output;

     -- mul[uxn_opcodes_h_l2770_c41_9793] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2770_c41_9793_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2770_c41_9793_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2770_c41_9793_phase <= VAR_mul_uxn_opcodes_h_l2770_c41_9793_phase;
     mul_uxn_opcodes_h_l2770_c41_9793_ins <= VAR_mul_uxn_opcodes_h_l2770_c41_9793_ins;
     mul_uxn_opcodes_h_l2770_c41_9793_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2770_c41_9793_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2770_c41_9793_return_output := mul_uxn_opcodes_h_l2770_c41_9793_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_4632] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_4632_return_output;
     VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c668_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue := VAR_mul_uxn_opcodes_h_l2770_c41_9793_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_d8a3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_a448] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output;

     -- mul2[uxn_opcodes_h_l2771_c41_46d5] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2771_c41_46d5_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2771_c41_46d5_phase <= VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_phase;
     mul2_uxn_opcodes_h_l2771_c41_46d5_ins <= VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_ins;
     mul2_uxn_opcodes_h_l2771_c41_46d5_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_return_output := mul2_uxn_opcodes_h_l2771_c41_46d5_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output;
     VAR_div_uxn_opcodes_h_l2772_c41_8e54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_a448_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue := VAR_mul2_uxn_opcodes_h_l2771_c41_46d5_return_output;
     -- div[uxn_opcodes_h_l2772_c41_8e54] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2772_c41_8e54_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2772_c41_8e54_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2772_c41_8e54_phase <= VAR_div_uxn_opcodes_h_l2772_c41_8e54_phase;
     div_uxn_opcodes_h_l2772_c41_8e54_ins <= VAR_div_uxn_opcodes_h_l2772_c41_8e54_ins;
     div_uxn_opcodes_h_l2772_c41_8e54_previous_stack_read <= VAR_div_uxn_opcodes_h_l2772_c41_8e54_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2772_c41_8e54_return_output := div_uxn_opcodes_h_l2772_c41_8e54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_4492] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_881d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_881d_return_output;
     VAR_div2_uxn_opcodes_h_l2773_c41_aa63_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_4492_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue := VAR_div_uxn_opcodes_h_l2772_c41_8e54_return_output;
     -- div2[uxn_opcodes_h_l2773_c41_aa63] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2773_c41_aa63_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2773_c41_aa63_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2773_c41_aa63_phase <= VAR_div2_uxn_opcodes_h_l2773_c41_aa63_phase;
     div2_uxn_opcodes_h_l2773_c41_aa63_ins <= VAR_div2_uxn_opcodes_h_l2773_c41_aa63_ins;
     div2_uxn_opcodes_h_l2773_c41_aa63_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2773_c41_aa63_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2773_c41_aa63_return_output := div2_uxn_opcodes_h_l2773_c41_aa63_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_6734] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_e76a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_6734_return_output;
     VAR_and_uxn_opcodes_h_l2774_c41_3dfd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_e76a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue := VAR_div2_uxn_opcodes_h_l2773_c41_aa63_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_2328] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_d53c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output;

     -- and[uxn_opcodes_h_l2774_c41_3dfd] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2774_c41_3dfd_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2774_c41_3dfd_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2774_c41_3dfd_phase <= VAR_and_uxn_opcodes_h_l2774_c41_3dfd_phase;
     and_uxn_opcodes_h_l2774_c41_3dfd_ins <= VAR_and_uxn_opcodes_h_l2774_c41_3dfd_ins;
     and_uxn_opcodes_h_l2774_c41_3dfd_previous_stack_read <= VAR_and_uxn_opcodes_h_l2774_c41_3dfd_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2774_c41_3dfd_return_output := and_uxn_opcodes_h_l2774_c41_3dfd_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output;
     VAR_and2_uxn_opcodes_h_l2775_c41_a635_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_2328_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue := VAR_and_uxn_opcodes_h_l2774_c41_3dfd_return_output;
     -- and2[uxn_opcodes_h_l2775_c41_a635] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2775_c41_a635_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2775_c41_a635_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2775_c41_a635_phase <= VAR_and2_uxn_opcodes_h_l2775_c41_a635_phase;
     and2_uxn_opcodes_h_l2775_c41_a635_ins <= VAR_and2_uxn_opcodes_h_l2775_c41_a635_ins;
     and2_uxn_opcodes_h_l2775_c41_a635_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2775_c41_a635_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2775_c41_a635_return_output := and2_uxn_opcodes_h_l2775_c41_a635_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_fd17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_055b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_055b_return_output;
     VAR_ora_uxn_opcodes_h_l2776_c41_39f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fd17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue := VAR_and2_uxn_opcodes_h_l2775_c41_a635_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c7_919b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_f860] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output;

     -- ora[uxn_opcodes_h_l2776_c41_39f2] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2776_c41_39f2_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2776_c41_39f2_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2776_c41_39f2_phase <= VAR_ora_uxn_opcodes_h_l2776_c41_39f2_phase;
     ora_uxn_opcodes_h_l2776_c41_39f2_ins <= VAR_ora_uxn_opcodes_h_l2776_c41_39f2_ins;
     ora_uxn_opcodes_h_l2776_c41_39f2_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2776_c41_39f2_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2776_c41_39f2_return_output := ora_uxn_opcodes_h_l2776_c41_39f2_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_919b_return_output;
     VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_f860_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue := VAR_ora_uxn_opcodes_h_l2776_c41_39f2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_4bb8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c7_c1e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output;

     -- ora2[uxn_opcodes_h_l2777_c41_7f9a] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2777_c41_7f9a_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2777_c41_7f9a_phase <= VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_phase;
     ora2_uxn_opcodes_h_l2777_c41_7f9a_ins <= VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_ins;
     ora2_uxn_opcodes_h_l2777_c41_7f9a_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output := ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output;
     VAR_eor_uxn_opcodes_h_l2778_c41_7308_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_4bb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue := VAR_ora2_uxn_opcodes_h_l2777_c41_7f9a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c1_d07d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c7_f571] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output;

     -- eor[uxn_opcodes_h_l2778_c41_7308] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2778_c41_7308_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2778_c41_7308_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2778_c41_7308_phase <= VAR_eor_uxn_opcodes_h_l2778_c41_7308_phase;
     eor_uxn_opcodes_h_l2778_c41_7308_ins <= VAR_eor_uxn_opcodes_h_l2778_c41_7308_ins;
     eor_uxn_opcodes_h_l2778_c41_7308_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2778_c41_7308_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2778_c41_7308_return_output := eor_uxn_opcodes_h_l2778_c41_7308_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_f571_return_output;
     VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_d07d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue := VAR_eor_uxn_opcodes_h_l2778_c41_7308_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c1_9c26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output;

     -- eor2[uxn_opcodes_h_l2779_c41_2bd3] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2779_c41_2bd3_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2779_c41_2bd3_phase <= VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_phase;
     eor2_uxn_opcodes_h_l2779_c41_2bd3_ins <= VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_ins;
     eor2_uxn_opcodes_h_l2779_c41_2bd3_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output := eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c7_6e1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output;
     VAR_sft_uxn_opcodes_h_l2780_c41_a107_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_9c26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue := VAR_eor2_uxn_opcodes_h_l2779_c41_2bd3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c1_3c10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output;

     -- sft[uxn_opcodes_h_l2780_c41_a107] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2780_c41_a107_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2780_c41_a107_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2780_c41_a107_phase <= VAR_sft_uxn_opcodes_h_l2780_c41_a107_phase;
     sft_uxn_opcodes_h_l2780_c41_a107_ins <= VAR_sft_uxn_opcodes_h_l2780_c41_a107_ins;
     sft_uxn_opcodes_h_l2780_c41_a107_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2780_c41_a107_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2780_c41_a107_return_output := sft_uxn_opcodes_h_l2780_c41_a107_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c1_8085] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_3c10_return_output;
     VAR_sft2_uxn_opcodes_h_l2781_c41_9367_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_8085_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue := VAR_sft_uxn_opcodes_h_l2780_c41_a107_return_output;
     -- sft2[uxn_opcodes_h_l2781_c41_9367] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2781_c41_9367_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2781_c41_9367_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2781_c41_9367_phase <= VAR_sft2_uxn_opcodes_h_l2781_c41_9367_phase;
     sft2_uxn_opcodes_h_l2781_c41_9367_ins <= VAR_sft2_uxn_opcodes_h_l2781_c41_9367_ins;
     sft2_uxn_opcodes_h_l2781_c41_9367_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2781_c41_9367_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2781_c41_9367_return_output := sft2_uxn_opcodes_h_l2781_c41_9367_return_output;

     -- printf_uxn_opcodes_h_l2782_c9_640b[uxn_opcodes_h_l2782_c9_640b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_arg0 <= VAR_printf_uxn_opcodes_h_l2782_c9_640b_uxn_opcodes_h_l2782_c9_640b_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue := VAR_sft2_uxn_opcodes_h_l2781_c41_9367_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2781_c7_6e1c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_cond;
     opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output := opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_6e1c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2780_c7_f571] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_cond;
     opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output := opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_f571_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2779_c7_c1e7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_cond;
     opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output := opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_c1e7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2778_c7_919b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_cond;
     opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output := opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_919b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2777_c7_055b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_cond;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output := opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_055b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2776_c7_d53c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_cond;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output := opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_d53c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2775_c7_6734] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_cond;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output := opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_6734_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2774_c7_881d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_cond;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output := opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_881d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2773_c7_d8a3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_cond;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output := opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_d8a3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2772_c7_4632] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_cond;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output := opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_4632_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2771_c7_ada7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_cond;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output := opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_ada7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2770_c7_10e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output := opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_10e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2769_c7_1a23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_cond;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output := opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_1a23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2768_c7_3297] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_cond;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output := opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_3297_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2767_c7_f921] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_cond;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output := opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f921_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2766_c7_fbe4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_cond;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output := opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_fbe4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2765_c7_4ba4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_cond;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output := opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_4ba4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2764_c7_0505] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_cond;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output := opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_0505_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2763_c7_0d50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_cond;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output := opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0d50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2762_c7_76e9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_cond;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output := opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_76e9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2761_c7_38ea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_cond;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output := opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_38ea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2760_c7_17e7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_cond;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output := opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_17e7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2759_c7_447b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_cond;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output := opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_447b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2758_c7_ed4a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_cond;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output := opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_ed4a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2757_c7_a85b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_cond;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output := opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_a85b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2756_c7_6a4f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_cond;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output := opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_6a4f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2755_c7_72b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_cond;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output := opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_72b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2754_c7_609c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_cond;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output := opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_609c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2753_c7_f663] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_cond;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output := opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_f663_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2752_c7_566e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_cond;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output := opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_566e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2751_c7_2c14] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_cond;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output := opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_2c14_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2750_c7_7da4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_cond;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output := opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_7da4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2749_c7_e9d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output := opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_e9d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2748_c7_6595] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_cond;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output := opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_6595_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2747_c7_0cde] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_cond;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output := opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_0cde_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2746_c7_e078] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_cond;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output := opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_e078_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2745_c7_7cf7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_cond;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output := opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_7cf7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2744_c7_8556] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_cond;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output := opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_8556_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2743_c7_b538] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_cond;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output := opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b538_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2742_c7_45ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_cond;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output := opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_45ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2741_c7_fb11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_cond;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output := opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_fb11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2740_c7_b05d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_cond;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output := opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_b05d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2739_c7_3352] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_cond;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output := opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_3352_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2738_c7_dadd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_cond;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output := opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_dadd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2737_c7_de5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_cond;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output := opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_de5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2736_c7_27d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_cond;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output := opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_27d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2735_c7_e9fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_cond;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output := opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e9fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2734_c7_dfba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_cond;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output := opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_dfba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2733_c7_4469] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_cond;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output := opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_4469_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2732_c7_5fc0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_cond;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output := opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_5fc0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2731_c7_a628] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_cond;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output := opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_a628_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2730_c7_5ea2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_cond;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output := opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_5ea2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2729_c7_e650] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_cond;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output := opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e650_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2728_c7_0c15] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_cond;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output := opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_0c15_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2727_c7_5595] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_cond;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output := opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5595_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2726_c7_2cab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_cond;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output := opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2cab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2725_c7_799c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_cond;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output := opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_799c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2724_c7_efaa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_cond;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output := opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_efaa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2723_c7_d3f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output := opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_d3f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2722_c7_290e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_cond;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output := opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_290e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2721_c7_0007] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_cond;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output := opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_0007_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2720_c7_0883] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_cond;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output := opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_0883_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2719_c7_7ca0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_cond;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output := opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_7ca0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2718_c7_418a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_cond;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output := opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_418a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2717_c7_308e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_cond;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output := opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_308e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2716_c7_3e54] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_cond;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output := opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_3e54_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2715_c7_0342] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_cond;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output := opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_0342_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2714_c7_3e3e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_cond;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output := opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_3e3e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2713_c7_ad3a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_cond;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output := opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_ad3a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2712_c2_df49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_cond;
     opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output := opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2810_c34_6e1e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2810_c34_6e1e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2812_c33_5ea6] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2812_c33_5ea6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.vram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2791_l2789_DUPLICATE_8b7b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2791_l2789_DUPLICATE_8b7b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2787_c6_fd78] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2787_c6_fd78_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2806_c40_13ed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2806_c40_13ed_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2809_c33_759c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2809_c33_759c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2807_c34_733e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2807_c34_733e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2785_c17_a9ae] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2785_c17_a9ae_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2801_c3_eb0a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2801_c3_eb0a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2795_c70_60d7] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2795_c70_60d7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2811_c37_6670] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2811_c37_6670_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2808_c30_5354] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2808_c30_5354_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2813_l2800_DUPLICATE_9e41 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2813_l2800_DUPLICATE_9e41_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2805_c39_0bab] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2805_c39_0bab_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2814_c32_da30] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2814_c32_da30_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c2_df49_return_output.is_opc_done;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2787_c6_fd78_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2787_c6_fd78_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2785_c17_a9ae_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2801_c3_eb0a_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2813_l2800_DUPLICATE_9e41_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2795_c59_40aa] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2795_c59_40aa_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2795_c70_60d7_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2785_c2_7763] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_left;
     BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output := BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2816_l2694_DUPLICATE_9724 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2816_l2694_DUPLICATE_9724_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9(
     VAR_is_wait_MUX_uxn_opcodes_h_l2712_c2_df49_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2805_c39_0bab_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2806_c40_13ed_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2807_c34_733e_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2808_c30_5354_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2809_c33_759c_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2810_c34_6e1e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2811_c37_6670_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2812_c33_5ea6_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2813_l2800_DUPLICATE_9e41_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2814_c32_da30_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2789_l2791_DUPLICATE_6b3f LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2789_l2791_DUPLICATE_6b3f_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2791_l2789_DUPLICATE_8b7b_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output;
     VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2785_c2_7763_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2789_l2791_DUPLICATE_6b3f_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2789_l2791_DUPLICATE_6b3f_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2795_c59_40aa_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2816_l2694_DUPLICATE_9724_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2816_l2694_DUPLICATE_9724_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2791_c4_9577] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2789_c4_3515] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output;

     -- MUX[uxn_opcodes_h_l2796_c20_4d7f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2796_c20_4d7f_cond <= VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_cond;
     MUX_uxn_opcodes_h_l2796_c20_4d7f_iftrue <= VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_iftrue;
     MUX_uxn_opcodes_h_l2796_c20_4d7f_iffalse <= VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output := MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l2789_c4_56ee := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2789_c4_3515_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2791_c4_00f8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2791_c4_9577_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_right := VAR_MUX_uxn_opcodes_h_l2796_c20_4d7f_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse := VAR_sp0_uxn_opcodes_h_l2791_c4_00f8;
     VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue := VAR_sp1_uxn_opcodes_h_l2789_c4_56ee;
     -- sp1_MUX[uxn_opcodes_h_l2788_c3_ba80] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_cond;
     sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue;
     sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output := sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2788_c3_ba80] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_cond;
     sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iftrue;
     sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output := sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2788_c3_ba80_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2787_c2_b2ef] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond;
     sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue;
     sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output := sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2787_c2_b2ef] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_cond;
     sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iftrue;
     sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output := sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output;
     VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2787_c2_b2ef_return_output;
     -- MUX[uxn_opcodes_h_l2795_c30_37c1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2795_c30_37c1_cond <= VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_cond;
     MUX_uxn_opcodes_h_l2795_c30_37c1_iftrue <= VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_iftrue;
     MUX_uxn_opcodes_h_l2795_c30_37c1_iffalse <= VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_return_output := MUX_uxn_opcodes_h_l2795_c30_37c1_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2795_c19_2414] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2795_c19_2414_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2795_c30_37c1_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2795_c19_2414_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2795_c19_3771] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2795_c19_3771_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2796_c2_a05a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l2796_c2_80fa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c2_a05a_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2796_c2_80fa;
     VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_stack_address := VAR_stack_address_uxn_opcodes_h_l2796_c2_80fa;
     -- stack_ram_update[uxn_opcodes_h_l2798_c21_abfa] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_stack_address;
     stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_value <= VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_value;
     stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output := stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l2798_c21_abfa_return_output;
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
