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
-- Submodules: 375
entity eval_opcode_phased_0CLK_d5dcc70e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_d5dcc70e;
architecture arch of eval_opcode_phased_0CLK_d5dcc70e is
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
-- BIN_OP_AND[uxn_opcodes_h_l3127_c10_0066]
signal BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3127_c10_7946]
signal BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3127_c41_2c98]
signal BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3127_c57_cfe2]
signal CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3127_c10_7189]
signal MUX_uxn_opcodes_h_l3127_c10_7189_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3127_c10_7189_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3127_c10_7189_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3127_c10_7189_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3128_c18_4f92]
signal BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3128_c18_5ea5]
signal BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3128_c18_6af5]
signal MUX_uxn_opcodes_h_l3128_c18_6af5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3128_c18_6af5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3128_c18_6af5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3128_c18_6af5_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3130_c2_218f[uxn_opcodes_h_l3130_c2_218f]
signal printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3132_c6_b8c4]
signal BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3133_c7_fe84]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3132_c2_6bec]
signal opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3133_c11_f085]
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3133_c1_54cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3134_c7_00c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3133_c7_fe84]
signal opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3133_c41_1e23]
signal jci_uxn_opcodes_h_l3133_c41_1e23_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3133_c41_1e23_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3133_c41_1e23_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3133_c41_1e23_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3133_c41_1e23_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3133_c41_1e23_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3134_c11_11a5]
signal BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3134_c1_fc46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3135_c7_fb81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3134_c7_00c6]
signal opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3134_c41_f3f4]
signal jmi_uxn_opcodes_h_l3134_c41_f3f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3134_c41_f3f4_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3134_c41_f3f4_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3134_c41_f3f4_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3135_c11_c633]
signal BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3135_c1_208b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3136_c7_6f10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3135_c7_fb81]
signal opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3135_c41_00fd]
signal jsi_uxn_opcodes_h_l3135_c41_00fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3135_c41_00fd_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3135_c41_00fd_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3135_c41_00fd_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3135_c41_00fd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3136_c11_7125]
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3136_c1_3d49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c7_194c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3136_c7_6f10]
signal opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3136_c41_2e47]
signal lit_uxn_opcodes_h_l3136_c41_2e47_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3136_c41_2e47_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3136_c41_2e47_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3136_c41_2e47_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3136_c41_2e47_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_80fa]
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c1_4d6d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c7_2f58]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3137_c7_194c]
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3137_c41_bc3a]
signal lit2_uxn_opcodes_h_l3137_c41_bc3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3137_c41_bc3a_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3137_c41_bc3a_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3137_c41_bc3a_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3138_c11_65c5]
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c1_d768]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c7_282b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3138_c7_2f58]
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3138_c41_4d84]
signal lit_uxn_opcodes_h_l3138_c41_4d84_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3138_c41_4d84_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3138_c41_4d84_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3138_c41_4d84_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3138_c41_4d84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_6e50]
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c1_c33b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c7_d9e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3139_c7_282b]
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3139_c41_d362]
signal lit2_uxn_opcodes_h_l3139_c41_d362_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3139_c41_d362_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3139_c41_d362_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3139_c41_d362_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3139_c41_d362_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_e2c9]
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c1_8e46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c7_a04b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3140_c7_d9e1]
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3140_c41_2770]
signal inc_uxn_opcodes_h_l3140_c41_2770_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3140_c41_2770_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3140_c41_2770_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3140_c41_2770_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3140_c41_2770_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_964b]
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c1_bc0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c7_955c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3141_c7_a04b]
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3141_c41_200d]
signal inc2_uxn_opcodes_h_l3141_c41_200d_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3141_c41_200d_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3141_c41_200d_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3141_c41_200d_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3141_c41_200d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3142_c11_0aa2]
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c1_e7d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c7_141a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3142_c7_955c]
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3142_c41_aeac]
signal pop_uxn_opcodes_h_l3142_c41_aeac_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3142_c41_aeac_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3142_c41_aeac_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3142_c41_aeac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_4499]
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c1_94f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c7_8d5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3143_c7_141a]
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3143_c41_27a7]
signal pop2_uxn_opcodes_h_l3143_c41_27a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3143_c41_27a7_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3143_c41_27a7_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3143_c41_27a7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3144_c11_1cae]
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c1_524d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c7_bbfe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3144_c7_8d5f]
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3144_c41_32a9]
signal nip_uxn_opcodes_h_l3144_c41_32a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3144_c41_32a9_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3144_c41_32a9_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3144_c41_32a9_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3144_c41_32a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_6d96]
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c1_a212]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c7_8135]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3145_c7_bbfe]
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3145_c41_1209]
signal nip2_uxn_opcodes_h_l3145_c41_1209_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3145_c41_1209_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3145_c41_1209_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3145_c41_1209_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3145_c41_1209_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3146_c11_96b0]
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c1_6b8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c7_ac68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3146_c7_8135]
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3146_c41_27e8]
signal swp_uxn_opcodes_h_l3146_c41_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3146_c41_27e8_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3146_c41_27e8_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3146_c41_27e8_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3146_c41_27e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3147_c11_044c]
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c1_57ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c7_e3db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3147_c7_ac68]
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3147_c41_2a45]
signal swp2_uxn_opcodes_h_l3147_c41_2a45_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3147_c41_2a45_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3147_c41_2a45_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3147_c41_2a45_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3147_c41_2a45_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_8934]
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c1_c780]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c7_04df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3148_c7_e3db]
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3148_c41_b7a4]
signal rot_uxn_opcodes_h_l3148_c41_b7a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3148_c41_b7a4_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3148_c41_b7a4_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3148_c41_b7a4_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3148_c41_b7a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_1c5b]
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c1_9cad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c7_1b89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3149_c7_04df]
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3149_c41_e980]
signal rot2_uxn_opcodes_h_l3149_c41_e980_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3149_c41_e980_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3149_c41_e980_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3149_c41_e980_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3149_c41_e980_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3150_c11_381a]
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c1_aac1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c7_312f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3150_c7_1b89]
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3150_c41_4197]
signal dup_uxn_opcodes_h_l3150_c41_4197_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3150_c41_4197_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3150_c41_4197_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3150_c41_4197_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3150_c41_4197_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_c136]
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c1_ec11]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c7_6025]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3151_c7_312f]
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3151_c41_5397]
signal dup2_uxn_opcodes_h_l3151_c41_5397_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3151_c41_5397_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3151_c41_5397_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3151_c41_5397_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3151_c41_5397_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3152_c11_08c6]
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c1_619c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c7_2eba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3152_c7_6025]
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3152_c41_b20f]
signal ovr_uxn_opcodes_h_l3152_c41_b20f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3152_c41_b20f_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3152_c41_b20f_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3152_c41_b20f_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3152_c41_b20f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_cb16]
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c1_2109]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c7_cf21]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3153_c7_2eba]
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3153_c41_5bb8]
signal ovr2_uxn_opcodes_h_l3153_c41_5bb8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3153_c41_5bb8_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3153_c41_5bb8_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3153_c41_5bb8_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3154_c11_dcba]
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c1_474f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c7_8d63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3154_c7_cf21]
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3154_c41_5557]
signal equ_uxn_opcodes_h_l3154_c41_5557_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3154_c41_5557_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3154_c41_5557_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3154_c41_5557_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3154_c41_5557_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_bda9]
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c1_4fa1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c7_c1de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3155_c7_8d63]
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3155_c41_561f]
signal equ2_uxn_opcodes_h_l3155_c41_561f_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3155_c41_561f_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3155_c41_561f_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3155_c41_561f_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3155_c41_561f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3156_c11_a951]
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c1_7518]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c7_db23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3156_c7_c1de]
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3156_c41_27b0]
signal neq_uxn_opcodes_h_l3156_c41_27b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3156_c41_27b0_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3156_c41_27b0_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3156_c41_27b0_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3156_c41_27b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_9bea]
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c1_1447]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c7_616f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3157_c7_db23]
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3157_c41_567b]
signal neq2_uxn_opcodes_h_l3157_c41_567b_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3157_c41_567b_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3157_c41_567b_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3157_c41_567b_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3157_c41_567b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_2ca9]
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c1_d72e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c7_7638]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3158_c7_616f]
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3158_c41_b2ed]
signal gth_uxn_opcodes_h_l3158_c41_b2ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3158_c41_b2ed_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3158_c41_b2ed_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3158_c41_b2ed_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3158_c41_b2ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3159_c11_f832]
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c1_cdda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c7_9abc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3159_c7_7638]
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3159_c41_29e1]
signal gth2_uxn_opcodes_h_l3159_c41_29e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3159_c41_29e1_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3159_c41_29e1_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3159_c41_29e1_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3159_c41_29e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3160_c11_b935]
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c1_766b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c7_cea0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3160_c7_9abc]
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3160_c41_e88a]
signal lth_uxn_opcodes_h_l3160_c41_e88a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3160_c41_e88a_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3160_c41_e88a_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3160_c41_e88a_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3160_c41_e88a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_4686]
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c1_4b2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c7_3952]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3161_c7_cea0]
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3161_c41_194e]
signal lth2_uxn_opcodes_h_l3161_c41_194e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3161_c41_194e_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3161_c41_194e_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3161_c41_194e_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3161_c41_194e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3162_c11_bc69]
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c1_3dfa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c7_bde2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3162_c7_3952]
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3162_c41_e61d]
signal jmp_uxn_opcodes_h_l3162_c41_e61d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3162_c41_e61d_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3162_c41_e61d_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3162_c41_e61d_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3162_c41_e61d_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3162_c41_e61d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_4772]
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c1_8324]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c7_41ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3163_c7_bde2]
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3163_c41_d11f]
signal jmp2_uxn_opcodes_h_l3163_c41_d11f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3163_c41_d11f_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3163_c41_d11f_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3163_c41_d11f_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3164_c11_3f5b]
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c1_8972]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c7_3337]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3164_c7_41ff]
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3164_c41_4d6c]
signal jcn_uxn_opcodes_h_l3164_c41_4d6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3164_c41_4d6c_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3164_c41_4d6c_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3164_c41_4d6c_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3164_c41_4d6c_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_cd8b]
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c1_e320]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c7_5343]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3165_c7_3337]
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3165_c41_eaf0]
signal jcn2_uxn_opcodes_h_l3165_c41_eaf0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3165_c41_eaf0_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3165_c41_eaf0_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3165_c41_eaf0_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_56fe]
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c1_b9f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c7_85fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3166_c7_5343]
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3166_c41_3009]
signal jsr_uxn_opcodes_h_l3166_c41_3009_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3166_c41_3009_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3166_c41_3009_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3166_c41_3009_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3166_c41_3009_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3166_c41_3009_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3167_c11_2054]
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c1_8cc1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c7_ae33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3167_c7_85fa]
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3167_c41_fbef]
signal jsr2_uxn_opcodes_h_l3167_c41_fbef_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3167_c41_fbef_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3167_c41_fbef_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3167_c41_fbef_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3167_c41_fbef_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3168_c11_20ff]
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c1_2dde]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c7_07ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3168_c7_ae33]
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3168_c41_d6cb]
signal sth_uxn_opcodes_h_l3168_c41_d6cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3168_c41_d6cb_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3168_c41_d6cb_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3168_c41_d6cb_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3168_c41_d6cb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3169_c11_aa60]
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c1_b49c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c7_ff6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3169_c7_07ac]
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3169_c41_7d14]
signal sth2_uxn_opcodes_h_l3169_c41_7d14_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3169_c41_7d14_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3169_c41_7d14_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3169_c41_7d14_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3169_c41_7d14_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_4c66]
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c1_6da2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c7_b372]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3170_c7_ff6f]
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3170_c41_53e6]
signal ldz_uxn_opcodes_h_l3170_c41_53e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3170_c41_53e6_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3170_c41_53e6_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3170_c41_53e6_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3170_c41_53e6_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3170_c41_53e6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3171_c11_ce9d]
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c1_7879]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c7_8863]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3171_c7_b372]
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3171_c41_2613]
signal ldz2_uxn_opcodes_h_l3171_c41_2613_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3171_c41_2613_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3171_c41_2613_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3171_c41_2613_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3171_c41_2613_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3171_c41_2613_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3172_c11_5354]
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c1_480a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c7_2f0b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3172_c7_8863]
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3172_c41_9502]
signal stz_uxn_opcodes_h_l3172_c41_9502_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3172_c41_9502_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3172_c41_9502_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3172_c41_9502_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3172_c41_9502_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_c4e1]
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c1_d7bb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c7_d6f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3173_c7_2f0b]
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3173_c41_af83]
signal stz2_uxn_opcodes_h_l3173_c41_af83_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3173_c41_af83_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3173_c41_af83_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3173_c41_af83_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3173_c41_af83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3174_c11_f3df]
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c1_975b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c7_65e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3174_c7_d6f5]
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3174_c41_a4c3]
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3175_c11_9d43]
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c1_d72f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c7_2ee3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3175_c7_65e1]
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3175_c41_50cf]
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3176_c11_c440]
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c1_6121]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c7_040d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3176_c7_2ee3]
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3176_c41_92df]
signal str1_uxn_opcodes_h_l3176_c41_92df_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3176_c41_92df_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3176_c41_92df_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3176_c41_92df_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3176_c41_92df_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3176_c41_92df_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3177_c11_c106]
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c1_a03b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c7_5929]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3177_c7_040d]
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3177_c41_f00a]
signal str2_uxn_opcodes_h_l3177_c41_f00a_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3177_c41_f00a_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3177_c41_f00a_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3177_c41_f00a_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3177_c41_f00a_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3177_c41_f00a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_afe8]
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c1_9fc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c7_5f80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3178_c7_5929]
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3178_c41_5c07]
signal lda_uxn_opcodes_h_l3178_c41_5c07_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3178_c41_5c07_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3178_c41_5c07_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3178_c41_5c07_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3178_c41_5c07_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3178_c41_5c07_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3179_c11_e319]
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c1_4289]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c7_53cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3179_c7_5f80]
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3179_c41_03cf]
signal lda2_uxn_opcodes_h_l3179_c41_03cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3179_c41_03cf_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3179_c41_03cf_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3179_c41_03cf_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3179_c41_03cf_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3179_c41_03cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3180_c11_d36d]
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c1_f47a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c7_309c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3180_c7_53cb]
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3180_c41_dffa]
signal sta_uxn_opcodes_h_l3180_c41_dffa_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3180_c41_dffa_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3180_c41_dffa_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3180_c41_dffa_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3180_c41_dffa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_03f9]
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c1_e031]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c7_6dfa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3181_c7_309c]
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3181_c41_9192]
signal sta2_uxn_opcodes_h_l3181_c41_9192_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3181_c41_9192_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3181_c41_9192_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3181_c41_9192_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3181_c41_9192_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3182_c11_4679]
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c1_3f89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c7_7c16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3182_c7_6dfa]
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3182_c41_39ce]
signal dei_uxn_opcodes_h_l3182_c41_39ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3182_c41_39ce_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3182_c41_39ce_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3182_c41_39ce_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3182_c41_39ce_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3182_c41_39ce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3183_c11_622a]
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c1_07fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c7_9d5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3183_c7_7c16]
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3183_c41_85a9]
signal dei2_uxn_opcodes_h_l3183_c41_85a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3183_c41_85a9_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3183_c41_85a9_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3183_c41_85a9_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3183_c41_85a9_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3183_c41_85a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3184_c11_30b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c1_2503]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c7_8652]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3184_c7_9d5b]
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3184_c41_97f1]
signal deo_uxn_opcodes_h_l3184_c41_97f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3184_c41_97f1_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3184_c41_97f1_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3184_c41_97f1_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3184_c41_97f1_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3184_c41_97f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3185_c11_3346]
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c1_cd3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c7_a0e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3185_c7_8652]
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3185_c41_3e0b]
signal deo2_uxn_opcodes_h_l3185_c41_3e0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3185_c41_3e0b_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3185_c41_3e0b_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3186_c11_5f01]
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c1_6440]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c7_e9ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3186_c7_a0e0]
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3186_c41_d191]
signal add_uxn_opcodes_h_l3186_c41_d191_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3186_c41_d191_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3186_c41_d191_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3186_c41_d191_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3186_c41_d191_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_6feb]
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c1_51f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c7_eac7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3187_c7_e9ac]
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3187_c41_cbfc]
signal add2_uxn_opcodes_h_l3187_c41_cbfc_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3187_c41_cbfc_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3187_c41_cbfc_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3187_c41_cbfc_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3187_c41_cbfc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3188_c11_8137]
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c1_fdf5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c7_8131]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3188_c7_eac7]
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3188_c41_75d7]
signal sub_uxn_opcodes_h_l3188_c41_75d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3188_c41_75d7_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3188_c41_75d7_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3188_c41_75d7_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3188_c41_75d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3189_c11_c5b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c1_cc1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c7_3bef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3189_c7_8131]
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3189_c41_c14b]
signal sub2_uxn_opcodes_h_l3189_c41_c14b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3189_c41_c14b_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3189_c41_c14b_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3189_c41_c14b_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3189_c41_c14b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3190_c11_44d8]
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_0b39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c7_c6cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3190_c7_3bef]
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3190_c41_8e41]
signal mul_uxn_opcodes_h_l3190_c41_8e41_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3190_c41_8e41_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3190_c41_8e41_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3190_c41_8e41_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3190_c41_8e41_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3191_c11_79be]
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c1_cbdc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c7_c3a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3191_c7_c6cb]
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3191_c41_a271]
signal mul2_uxn_opcodes_h_l3191_c41_a271_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3191_c41_a271_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3191_c41_a271_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3191_c41_a271_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3191_c41_a271_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3192_c11_3221]
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c1_a579]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c7_de69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3192_c7_c3a5]
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3192_c41_b8bf]
signal div_uxn_opcodes_h_l3192_c41_b8bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3192_c41_b8bf_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3192_c41_b8bf_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3192_c41_b8bf_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3192_c41_b8bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_e89c]
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c1_a331]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c7_f517]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3193_c7_de69]
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3193_c41_eeac]
signal div2_uxn_opcodes_h_l3193_c41_eeac_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3193_c41_eeac_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3193_c41_eeac_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3193_c41_eeac_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3193_c41_eeac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3194_c11_2a98]
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c1_1d62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c7_13c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3194_c7_f517]
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3194_c41_08bb]
signal and_uxn_opcodes_h_l3194_c41_08bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3194_c41_08bb_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3194_c41_08bb_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3194_c41_08bb_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3194_c41_08bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3195_c11_89cb]
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c1_923b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c7_34de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3195_c7_13c8]
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3195_c41_beb5]
signal and2_uxn_opcodes_h_l3195_c41_beb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3195_c41_beb5_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3195_c41_beb5_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3195_c41_beb5_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3195_c41_beb5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_46a5]
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c1_4af9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c7_38e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3196_c7_34de]
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3196_c41_616d]
signal ora_uxn_opcodes_h_l3196_c41_616d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3196_c41_616d_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3196_c41_616d_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3196_c41_616d_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3196_c41_616d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_c918]
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c1_3df8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c7_7809]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3197_c7_38e3]
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3197_c41_e410]
signal ora2_uxn_opcodes_h_l3197_c41_e410_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3197_c41_e410_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3197_c41_e410_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3197_c41_e410_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3197_c41_e410_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3198_c11_1d29]
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c1_db65]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c7_f0d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3198_c7_7809]
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3198_c41_526e]
signal eor_uxn_opcodes_h_l3198_c41_526e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3198_c41_526e_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3198_c41_526e_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3198_c41_526e_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3198_c41_526e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_677e]
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c1_677f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c7_8429]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3199_c7_f0d8]
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3199_c41_0355]
signal eor2_uxn_opcodes_h_l3199_c41_0355_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3199_c41_0355_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3199_c41_0355_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3199_c41_0355_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3199_c41_0355_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3200_c11_4fd6]
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c1_5424]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c7_6af5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3200_c7_8429]
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3200_c41_e30b]
signal sft_uxn_opcodes_h_l3200_c41_e30b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3200_c41_e30b_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3200_c41_e30b_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3200_c41_e30b_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3200_c41_e30b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_f613]
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c1_c857]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c1_16bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3201_c7_6af5]
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3201_c41_5715]
signal sft2_uxn_opcodes_h_l3201_c41_5715_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3201_c41_5715_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3201_c41_5715_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3201_c41_5715_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3201_c41_5715_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3202_c9_94f2[uxn_opcodes_h_l3202_c9_94f2]
signal printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_arg0 : unsigned(31 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3204_c2_f292]
signal sp1_MUX_uxn_opcodes_h_l3204_c2_f292_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3204_c2_f292]
signal sp0_MUX_uxn_opcodes_h_l3204_c2_f292_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3205_c3_d08d]
signal sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3205_c3_d08d]
signal sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3206_c4_1282]
signal BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3208_c4_0f7b]
signal BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3213_c19_24e0]
signal MUX_uxn_opcodes_h_l3213_c19_24e0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3213_c19_24e0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3213_c19_24e0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3213_c19_24e0_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3213_c19_1b21]
signal BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l3214_c20_aa57]
signal MUX_uxn_opcodes_h_l3214_c20_aa57_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3214_c20_aa57_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3214_c20_aa57_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3214_c20_aa57_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3214_c2_b9c0]
signal BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output : unsigned(16 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3217_c21_9256]
signal stack_ram_update_uxn_opcodes_h_l3217_c21_9256_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3217_c21_9256_stack_address : unsigned(15 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3217_c21_9256_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3217_c21_9256_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_opcodes_h_l3223_c26_d54e]
signal device_ram_update_uxn_opcodes_h_l3223_c26_d54e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3223_c26_d54e_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3223_c26_d54e_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3223_c26_d54e_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_pc_updated := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066
BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_left,
BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_right,
BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946
BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_left,
BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_right,
BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98
BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_left,
BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_right,
BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2
CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_x,
CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output);

-- MUX_uxn_opcodes_h_l3127_c10_7189
MUX_uxn_opcodes_h_l3127_c10_7189 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3127_c10_7189_cond,
MUX_uxn_opcodes_h_l3127_c10_7189_iftrue,
MUX_uxn_opcodes_h_l3127_c10_7189_iffalse,
MUX_uxn_opcodes_h_l3127_c10_7189_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92
BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_left,
BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_right,
BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5
BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_left,
BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_right,
BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output);

-- MUX_uxn_opcodes_h_l3128_c18_6af5
MUX_uxn_opcodes_h_l3128_c18_6af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3128_c18_6af5_cond,
MUX_uxn_opcodes_h_l3128_c18_6af5_iftrue,
MUX_uxn_opcodes_h_l3128_c18_6af5_iffalse,
MUX_uxn_opcodes_h_l3128_c18_6af5_return_output);

-- printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f
printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f : entity work.printf_uxn_opcodes_h_l3130_c2_218f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg0,
printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg1,
printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4
BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_left,
BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_right,
BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec
opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_cond,
opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iftrue,
opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iffalse,
opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_left,
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_right,
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84
opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_cond,
opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue,
opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse,
opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output);

-- jci_uxn_opcodes_h_l3133_c41_1e23
jci_uxn_opcodes_h_l3133_c41_1e23 : entity work.jci_0CLK_5110df32 port map (
clk,
jci_uxn_opcodes_h_l3133_c41_1e23_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3133_c41_1e23_phase,
jci_uxn_opcodes_h_l3133_c41_1e23_pc,
jci_uxn_opcodes_h_l3133_c41_1e23_previous_stack_read,
jci_uxn_opcodes_h_l3133_c41_1e23_previous_ram_read,
jci_uxn_opcodes_h_l3133_c41_1e23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5
BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_left,
BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_right,
BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6
opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_cond,
opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output);

-- jmi_uxn_opcodes_h_l3134_c41_f3f4
jmi_uxn_opcodes_h_l3134_c41_f3f4 : entity work.jmi_0CLK_3045e391 port map (
clk,
jmi_uxn_opcodes_h_l3134_c41_f3f4_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3134_c41_f3f4_phase,
jmi_uxn_opcodes_h_l3134_c41_f3f4_pc,
jmi_uxn_opcodes_h_l3134_c41_f3f4_previous_ram_read,
jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633
BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_left,
BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_right,
BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81
opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_cond,
opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue,
opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse,
opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output);

-- jsi_uxn_opcodes_h_l3135_c41_00fd
jsi_uxn_opcodes_h_l3135_c41_00fd : entity work.jsi_0CLK_cf70ec0f port map (
clk,
jsi_uxn_opcodes_h_l3135_c41_00fd_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3135_c41_00fd_phase,
jsi_uxn_opcodes_h_l3135_c41_00fd_pc,
jsi_uxn_opcodes_h_l3135_c41_00fd_previous_ram_read,
jsi_uxn_opcodes_h_l3135_c41_00fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125
BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_left,
BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_right,
BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10
opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_cond,
opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue,
opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse,
opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output);

-- lit_uxn_opcodes_h_l3136_c41_2e47
lit_uxn_opcodes_h_l3136_c41_2e47 : entity work.lit_0CLK_e573058b port map (
clk,
lit_uxn_opcodes_h_l3136_c41_2e47_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3136_c41_2e47_phase,
lit_uxn_opcodes_h_l3136_c41_2e47_pc,
lit_uxn_opcodes_h_l3136_c41_2e47_previous_ram_read,
lit_uxn_opcodes_h_l3136_c41_2e47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_left,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_right,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3137_c7_194c
opc_result_MUX_uxn_opcodes_h_l3137_c7_194c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_cond,
opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output);

-- lit2_uxn_opcodes_h_l3137_c41_bc3a
lit2_uxn_opcodes_h_l3137_c41_bc3a : entity work.lit2_0CLK_a45e5d62 port map (
clk,
lit2_uxn_opcodes_h_l3137_c41_bc3a_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3137_c41_bc3a_phase,
lit2_uxn_opcodes_h_l3137_c41_bc3a_pc,
lit2_uxn_opcodes_h_l3137_c41_bc3a_previous_ram_read,
lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_left,
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_right,
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58
opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_cond,
opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue,
opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse,
opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output);

-- lit_uxn_opcodes_h_l3138_c41_4d84
lit_uxn_opcodes_h_l3138_c41_4d84 : entity work.lit_0CLK_e573058b port map (
clk,
lit_uxn_opcodes_h_l3138_c41_4d84_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3138_c41_4d84_phase,
lit_uxn_opcodes_h_l3138_c41_4d84_pc,
lit_uxn_opcodes_h_l3138_c41_4d84_previous_ram_read,
lit_uxn_opcodes_h_l3138_c41_4d84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_left,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_right,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3139_c7_282b
opc_result_MUX_uxn_opcodes_h_l3139_c7_282b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_cond,
opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output);

-- lit2_uxn_opcodes_h_l3139_c41_d362
lit2_uxn_opcodes_h_l3139_c41_d362 : entity work.lit2_0CLK_a45e5d62 port map (
clk,
lit2_uxn_opcodes_h_l3139_c41_d362_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3139_c41_d362_phase,
lit2_uxn_opcodes_h_l3139_c41_d362_pc,
lit2_uxn_opcodes_h_l3139_c41_d362_previous_ram_read,
lit2_uxn_opcodes_h_l3139_c41_d362_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_left,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_right,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1
opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond,
opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output);

-- inc_uxn_opcodes_h_l3140_c41_2770
inc_uxn_opcodes_h_l3140_c41_2770 : entity work.inc_0CLK_3045e391 port map (
clk,
inc_uxn_opcodes_h_l3140_c41_2770_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3140_c41_2770_phase,
inc_uxn_opcodes_h_l3140_c41_2770_ins,
inc_uxn_opcodes_h_l3140_c41_2770_previous_stack_read,
inc_uxn_opcodes_h_l3140_c41_2770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_left,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_right,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b
opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_cond,
opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output);

-- inc2_uxn_opcodes_h_l3141_c41_200d
inc2_uxn_opcodes_h_l3141_c41_200d : entity work.inc2_0CLK_50a1b8d0 port map (
clk,
inc2_uxn_opcodes_h_l3141_c41_200d_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3141_c41_200d_phase,
inc2_uxn_opcodes_h_l3141_c41_200d_ins,
inc2_uxn_opcodes_h_l3141_c41_200d_previous_stack_read,
inc2_uxn_opcodes_h_l3141_c41_200d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_left,
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_right,
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3142_c7_955c
opc_result_MUX_uxn_opcodes_h_l3142_c7_955c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_cond,
opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output);

-- pop_uxn_opcodes_h_l3142_c41_aeac
pop_uxn_opcodes_h_l3142_c41_aeac : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l3142_c41_aeac_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3142_c41_aeac_phase,
pop_uxn_opcodes_h_l3142_c41_aeac_ins,
pop_uxn_opcodes_h_l3142_c41_aeac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_left,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_right,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3143_c7_141a
opc_result_MUX_uxn_opcodes_h_l3143_c7_141a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_cond,
opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output);

-- pop2_uxn_opcodes_h_l3143_c41_27a7
pop2_uxn_opcodes_h_l3143_c41_27a7 : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l3143_c41_27a7_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3143_c41_27a7_phase,
pop2_uxn_opcodes_h_l3143_c41_27a7_ins,
pop2_uxn_opcodes_h_l3143_c41_27a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_left,
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_right,
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f
opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond,
opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output);

-- nip_uxn_opcodes_h_l3144_c41_32a9
nip_uxn_opcodes_h_l3144_c41_32a9 : entity work.nip_0CLK_46011230 port map (
clk,
nip_uxn_opcodes_h_l3144_c41_32a9_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3144_c41_32a9_phase,
nip_uxn_opcodes_h_l3144_c41_32a9_ins,
nip_uxn_opcodes_h_l3144_c41_32a9_previous_stack_read,
nip_uxn_opcodes_h_l3144_c41_32a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_left,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_right,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe
opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond,
opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue,
opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse,
opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output);

-- nip2_uxn_opcodes_h_l3145_c41_1209
nip2_uxn_opcodes_h_l3145_c41_1209 : entity work.nip2_0CLK_7c2e709f port map (
clk,
nip2_uxn_opcodes_h_l3145_c41_1209_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3145_c41_1209_phase,
nip2_uxn_opcodes_h_l3145_c41_1209_ins,
nip2_uxn_opcodes_h_l3145_c41_1209_previous_stack_read,
nip2_uxn_opcodes_h_l3145_c41_1209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_left,
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_right,
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3146_c7_8135
opc_result_MUX_uxn_opcodes_h_l3146_c7_8135 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_cond,
opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue,
opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse,
opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output);

-- swp_uxn_opcodes_h_l3146_c41_27e8
swp_uxn_opcodes_h_l3146_c41_27e8 : entity work.swp_0CLK_9ff5fd8d port map (
clk,
swp_uxn_opcodes_h_l3146_c41_27e8_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3146_c41_27e8_phase,
swp_uxn_opcodes_h_l3146_c41_27e8_ins,
swp_uxn_opcodes_h_l3146_c41_27e8_previous_stack_read,
swp_uxn_opcodes_h_l3146_c41_27e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_left,
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_right,
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68
opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_cond,
opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue,
opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse,
opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output);

-- swp2_uxn_opcodes_h_l3147_c41_2a45
swp2_uxn_opcodes_h_l3147_c41_2a45 : entity work.swp2_0CLK_37dbf2f3 port map (
clk,
swp2_uxn_opcodes_h_l3147_c41_2a45_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3147_c41_2a45_phase,
swp2_uxn_opcodes_h_l3147_c41_2a45_ins,
swp2_uxn_opcodes_h_l3147_c41_2a45_previous_stack_read,
swp2_uxn_opcodes_h_l3147_c41_2a45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_left,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_right,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db
opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_cond,
opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue,
opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse,
opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output);

-- rot_uxn_opcodes_h_l3148_c41_b7a4
rot_uxn_opcodes_h_l3148_c41_b7a4 : entity work.rot_0CLK_bbbe252c port map (
clk,
rot_uxn_opcodes_h_l3148_c41_b7a4_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3148_c41_b7a4_phase,
rot_uxn_opcodes_h_l3148_c41_b7a4_ins,
rot_uxn_opcodes_h_l3148_c41_b7a4_previous_stack_read,
rot_uxn_opcodes_h_l3148_c41_b7a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_left,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_right,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3149_c7_04df
opc_result_MUX_uxn_opcodes_h_l3149_c7_04df : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_cond,
opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue,
opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse,
opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output);

-- rot2_uxn_opcodes_h_l3149_c41_e980
rot2_uxn_opcodes_h_l3149_c41_e980 : entity work.rot2_0CLK_37f20a85 port map (
clk,
rot2_uxn_opcodes_h_l3149_c41_e980_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3149_c41_e980_phase,
rot2_uxn_opcodes_h_l3149_c41_e980_ins,
rot2_uxn_opcodes_h_l3149_c41_e980_previous_stack_read,
rot2_uxn_opcodes_h_l3149_c41_e980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_left,
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_right,
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89
opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_cond,
opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue,
opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse,
opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output);

-- dup_uxn_opcodes_h_l3150_c41_4197
dup_uxn_opcodes_h_l3150_c41_4197 : entity work.dup_0CLK_66ba3dc0 port map (
clk,
dup_uxn_opcodes_h_l3150_c41_4197_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3150_c41_4197_phase,
dup_uxn_opcodes_h_l3150_c41_4197_ins,
dup_uxn_opcodes_h_l3150_c41_4197_previous_stack_read,
dup_uxn_opcodes_h_l3150_c41_4197_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_left,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_right,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3151_c7_312f
opc_result_MUX_uxn_opcodes_h_l3151_c7_312f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_cond,
opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output);

-- dup2_uxn_opcodes_h_l3151_c41_5397
dup2_uxn_opcodes_h_l3151_c41_5397 : entity work.dup2_0CLK_ad7496ca port map (
clk,
dup2_uxn_opcodes_h_l3151_c41_5397_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3151_c41_5397_phase,
dup2_uxn_opcodes_h_l3151_c41_5397_ins,
dup2_uxn_opcodes_h_l3151_c41_5397_previous_stack_read,
dup2_uxn_opcodes_h_l3151_c41_5397_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_left,
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_right,
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3152_c7_6025
opc_result_MUX_uxn_opcodes_h_l3152_c7_6025 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_cond,
opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue,
opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse,
opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output);

-- ovr_uxn_opcodes_h_l3152_c41_b20f
ovr_uxn_opcodes_h_l3152_c41_b20f : entity work.ovr_0CLK_67fe881f port map (
clk,
ovr_uxn_opcodes_h_l3152_c41_b20f_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3152_c41_b20f_phase,
ovr_uxn_opcodes_h_l3152_c41_b20f_ins,
ovr_uxn_opcodes_h_l3152_c41_b20f_previous_stack_read,
ovr_uxn_opcodes_h_l3152_c41_b20f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_left,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_right,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba
opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_cond,
opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue,
opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse,
opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output);

-- ovr2_uxn_opcodes_h_l3153_c41_5bb8
ovr2_uxn_opcodes_h_l3153_c41_5bb8 : entity work.ovr2_0CLK_9fd731de port map (
clk,
ovr2_uxn_opcodes_h_l3153_c41_5bb8_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3153_c41_5bb8_phase,
ovr2_uxn_opcodes_h_l3153_c41_5bb8_ins,
ovr2_uxn_opcodes_h_l3153_c41_5bb8_previous_stack_read,
ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_left,
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_right,
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21
opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_cond,
opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue,
opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse,
opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output);

-- equ_uxn_opcodes_h_l3154_c41_5557
equ_uxn_opcodes_h_l3154_c41_5557 : entity work.equ_0CLK_1c7b7172 port map (
clk,
equ_uxn_opcodes_h_l3154_c41_5557_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3154_c41_5557_phase,
equ_uxn_opcodes_h_l3154_c41_5557_ins,
equ_uxn_opcodes_h_l3154_c41_5557_previous_stack_read,
equ_uxn_opcodes_h_l3154_c41_5557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_left,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_right,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63
opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_cond,
opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue,
opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse,
opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output);

-- equ2_uxn_opcodes_h_l3155_c41_561f
equ2_uxn_opcodes_h_l3155_c41_561f : entity work.equ2_0CLK_5ccafc54 port map (
clk,
equ2_uxn_opcodes_h_l3155_c41_561f_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3155_c41_561f_phase,
equ2_uxn_opcodes_h_l3155_c41_561f_ins,
equ2_uxn_opcodes_h_l3155_c41_561f_previous_stack_read,
equ2_uxn_opcodes_h_l3155_c41_561f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_left,
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_right,
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de
opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_cond,
opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue,
opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse,
opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output);

-- neq_uxn_opcodes_h_l3156_c41_27b0
neq_uxn_opcodes_h_l3156_c41_27b0 : entity work.neq_0CLK_1c7b7172 port map (
clk,
neq_uxn_opcodes_h_l3156_c41_27b0_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3156_c41_27b0_phase,
neq_uxn_opcodes_h_l3156_c41_27b0_ins,
neq_uxn_opcodes_h_l3156_c41_27b0_previous_stack_read,
neq_uxn_opcodes_h_l3156_c41_27b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_left,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_right,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3157_c7_db23
opc_result_MUX_uxn_opcodes_h_l3157_c7_db23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_cond,
opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue,
opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse,
opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output);

-- neq2_uxn_opcodes_h_l3157_c41_567b
neq2_uxn_opcodes_h_l3157_c41_567b : entity work.neq2_0CLK_5ccafc54 port map (
clk,
neq2_uxn_opcodes_h_l3157_c41_567b_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3157_c41_567b_phase,
neq2_uxn_opcodes_h_l3157_c41_567b_ins,
neq2_uxn_opcodes_h_l3157_c41_567b_previous_stack_read,
neq2_uxn_opcodes_h_l3157_c41_567b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_left,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_right,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3158_c7_616f
opc_result_MUX_uxn_opcodes_h_l3158_c7_616f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_cond,
opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output);

-- gth_uxn_opcodes_h_l3158_c41_b2ed
gth_uxn_opcodes_h_l3158_c41_b2ed : entity work.gth_0CLK_1c7b7172 port map (
clk,
gth_uxn_opcodes_h_l3158_c41_b2ed_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3158_c41_b2ed_phase,
gth_uxn_opcodes_h_l3158_c41_b2ed_ins,
gth_uxn_opcodes_h_l3158_c41_b2ed_previous_stack_read,
gth_uxn_opcodes_h_l3158_c41_b2ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_left,
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_right,
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3159_c7_7638
opc_result_MUX_uxn_opcodes_h_l3159_c7_7638 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_cond,
opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue,
opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse,
opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output);

-- gth2_uxn_opcodes_h_l3159_c41_29e1
gth2_uxn_opcodes_h_l3159_c41_29e1 : entity work.gth2_0CLK_5ccafc54 port map (
clk,
gth2_uxn_opcodes_h_l3159_c41_29e1_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3159_c41_29e1_phase,
gth2_uxn_opcodes_h_l3159_c41_29e1_ins,
gth2_uxn_opcodes_h_l3159_c41_29e1_previous_stack_read,
gth2_uxn_opcodes_h_l3159_c41_29e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_left,
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_right,
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc
opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_cond,
opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output);

-- lth_uxn_opcodes_h_l3160_c41_e88a
lth_uxn_opcodes_h_l3160_c41_e88a : entity work.lth_0CLK_1c7b7172 port map (
clk,
lth_uxn_opcodes_h_l3160_c41_e88a_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3160_c41_e88a_phase,
lth_uxn_opcodes_h_l3160_c41_e88a_ins,
lth_uxn_opcodes_h_l3160_c41_e88a_previous_stack_read,
lth_uxn_opcodes_h_l3160_c41_e88a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_left,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_right,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0
opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_cond,
opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output);

-- lth2_uxn_opcodes_h_l3161_c41_194e
lth2_uxn_opcodes_h_l3161_c41_194e : entity work.lth2_0CLK_5ccafc54 port map (
clk,
lth2_uxn_opcodes_h_l3161_c41_194e_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3161_c41_194e_phase,
lth2_uxn_opcodes_h_l3161_c41_194e_ins,
lth2_uxn_opcodes_h_l3161_c41_194e_previous_stack_read,
lth2_uxn_opcodes_h_l3161_c41_194e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_left,
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_right,
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3162_c7_3952
opc_result_MUX_uxn_opcodes_h_l3162_c7_3952 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_cond,
opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue,
opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse,
opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output);

-- jmp_uxn_opcodes_h_l3162_c41_e61d
jmp_uxn_opcodes_h_l3162_c41_e61d : entity work.jmp_0CLK_e573058b port map (
clk,
jmp_uxn_opcodes_h_l3162_c41_e61d_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3162_c41_e61d_phase,
jmp_uxn_opcodes_h_l3162_c41_e61d_ins,
jmp_uxn_opcodes_h_l3162_c41_e61d_pc,
jmp_uxn_opcodes_h_l3162_c41_e61d_previous_stack_read,
jmp_uxn_opcodes_h_l3162_c41_e61d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_left,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_right,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2
opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_cond,
opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output);

-- jmp2_uxn_opcodes_h_l3163_c41_d11f
jmp2_uxn_opcodes_h_l3163_c41_d11f : entity work.jmp2_0CLK_9101a1df port map (
clk,
jmp2_uxn_opcodes_h_l3163_c41_d11f_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3163_c41_d11f_phase,
jmp2_uxn_opcodes_h_l3163_c41_d11f_ins,
jmp2_uxn_opcodes_h_l3163_c41_d11f_previous_stack_read,
jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_left,
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_right,
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff
opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_cond,
opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output);

-- jcn_uxn_opcodes_h_l3164_c41_4d6c
jcn_uxn_opcodes_h_l3164_c41_4d6c : entity work.jcn_0CLK_df07acae port map (
clk,
jcn_uxn_opcodes_h_l3164_c41_4d6c_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3164_c41_4d6c_phase,
jcn_uxn_opcodes_h_l3164_c41_4d6c_ins,
jcn_uxn_opcodes_h_l3164_c41_4d6c_pc,
jcn_uxn_opcodes_h_l3164_c41_4d6c_previous_stack_read,
jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_left,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_right,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3165_c7_3337
opc_result_MUX_uxn_opcodes_h_l3165_c7_3337 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_cond,
opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue,
opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse,
opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output);

-- jcn2_uxn_opcodes_h_l3165_c41_eaf0
jcn2_uxn_opcodes_h_l3165_c41_eaf0 : entity work.jcn2_0CLK_c26dda62 port map (
clk,
jcn2_uxn_opcodes_h_l3165_c41_eaf0_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3165_c41_eaf0_phase,
jcn2_uxn_opcodes_h_l3165_c41_eaf0_ins,
jcn2_uxn_opcodes_h_l3165_c41_eaf0_previous_stack_read,
jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_left,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_right,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3166_c7_5343
opc_result_MUX_uxn_opcodes_h_l3166_c7_5343 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_cond,
opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue,
opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse,
opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output);

-- jsr_uxn_opcodes_h_l3166_c41_3009
jsr_uxn_opcodes_h_l3166_c41_3009 : entity work.jsr_0CLK_6c9b19c4 port map (
clk,
jsr_uxn_opcodes_h_l3166_c41_3009_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3166_c41_3009_phase,
jsr_uxn_opcodes_h_l3166_c41_3009_ins,
jsr_uxn_opcodes_h_l3166_c41_3009_pc,
jsr_uxn_opcodes_h_l3166_c41_3009_previous_stack_read,
jsr_uxn_opcodes_h_l3166_c41_3009_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_left,
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_right,
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa
opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_cond,
opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output);

-- jsr2_uxn_opcodes_h_l3167_c41_fbef
jsr2_uxn_opcodes_h_l3167_c41_fbef : entity work.jsr2_0CLK_e5fcbde3 port map (
clk,
jsr2_uxn_opcodes_h_l3167_c41_fbef_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3167_c41_fbef_phase,
jsr2_uxn_opcodes_h_l3167_c41_fbef_ins,
jsr2_uxn_opcodes_h_l3167_c41_fbef_pc,
jsr2_uxn_opcodes_h_l3167_c41_fbef_previous_stack_read,
jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_left,
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_right,
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33
opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_cond,
opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue,
opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse,
opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output);

-- sth_uxn_opcodes_h_l3168_c41_d6cb
sth_uxn_opcodes_h_l3168_c41_d6cb : entity work.sth_0CLK_d6c995e8 port map (
clk,
sth_uxn_opcodes_h_l3168_c41_d6cb_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3168_c41_d6cb_phase,
sth_uxn_opcodes_h_l3168_c41_d6cb_ins,
sth_uxn_opcodes_h_l3168_c41_d6cb_previous_stack_read,
sth_uxn_opcodes_h_l3168_c41_d6cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_left,
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_right,
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac
opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_cond,
opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output);

-- sth2_uxn_opcodes_h_l3169_c41_7d14
sth2_uxn_opcodes_h_l3169_c41_7d14 : entity work.sth2_0CLK_f1c92b33 port map (
clk,
sth2_uxn_opcodes_h_l3169_c41_7d14_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3169_c41_7d14_phase,
sth2_uxn_opcodes_h_l3169_c41_7d14_ins,
sth2_uxn_opcodes_h_l3169_c41_7d14_previous_stack_read,
sth2_uxn_opcodes_h_l3169_c41_7d14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_left,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_right,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f
opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond,
opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output);

-- ldz_uxn_opcodes_h_l3170_c41_53e6
ldz_uxn_opcodes_h_l3170_c41_53e6 : entity work.ldz_0CLK_df07acae port map (
clk,
ldz_uxn_opcodes_h_l3170_c41_53e6_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3170_c41_53e6_phase,
ldz_uxn_opcodes_h_l3170_c41_53e6_ins,
ldz_uxn_opcodes_h_l3170_c41_53e6_previous_stack_read,
ldz_uxn_opcodes_h_l3170_c41_53e6_previous_ram_read,
ldz_uxn_opcodes_h_l3170_c41_53e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_left,
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_right,
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3171_c7_b372
opc_result_MUX_uxn_opcodes_h_l3171_c7_b372 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_cond,
opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue,
opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse,
opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output);

-- ldz2_uxn_opcodes_h_l3171_c41_2613
ldz2_uxn_opcodes_h_l3171_c41_2613 : entity work.ldz2_0CLK_77d0ca3d port map (
clk,
ldz2_uxn_opcodes_h_l3171_c41_2613_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3171_c41_2613_phase,
ldz2_uxn_opcodes_h_l3171_c41_2613_ins,
ldz2_uxn_opcodes_h_l3171_c41_2613_previous_stack_read,
ldz2_uxn_opcodes_h_l3171_c41_2613_previous_ram_read,
ldz2_uxn_opcodes_h_l3171_c41_2613_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_left,
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_right,
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3172_c7_8863
opc_result_MUX_uxn_opcodes_h_l3172_c7_8863 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_cond,
opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue,
opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse,
opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output);

-- stz_uxn_opcodes_h_l3172_c41_9502
stz_uxn_opcodes_h_l3172_c41_9502 : entity work.stz_0CLK_3220bbf1 port map (
clk,
stz_uxn_opcodes_h_l3172_c41_9502_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3172_c41_9502_phase,
stz_uxn_opcodes_h_l3172_c41_9502_ins,
stz_uxn_opcodes_h_l3172_c41_9502_previous_stack_read,
stz_uxn_opcodes_h_l3172_c41_9502_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_left,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_right,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b
opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond,
opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output);

-- stz2_uxn_opcodes_h_l3173_c41_af83
stz2_uxn_opcodes_h_l3173_c41_af83 : entity work.stz2_0CLK_e6256695 port map (
clk,
stz2_uxn_opcodes_h_l3173_c41_af83_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3173_c41_af83_phase,
stz2_uxn_opcodes_h_l3173_c41_af83_ins,
stz2_uxn_opcodes_h_l3173_c41_af83_previous_stack_read,
stz2_uxn_opcodes_h_l3173_c41_af83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_left,
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_right,
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond,
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output);

-- ldr_uxn_opcodes_h_l3174_c41_a4c3
ldr_uxn_opcodes_h_l3174_c41_a4c3 : entity work.ldr_0CLK_3d5a5eea port map (
clk,
ldr_uxn_opcodes_h_l3174_c41_a4c3_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3174_c41_a4c3_phase,
ldr_uxn_opcodes_h_l3174_c41_a4c3_ins,
ldr_uxn_opcodes_h_l3174_c41_a4c3_pc,
ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_stack_read,
ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_ram_read,
ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_left,
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_right,
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1
opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_cond,
opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output);

-- ldr2_uxn_opcodes_h_l3175_c41_50cf
ldr2_uxn_opcodes_h_l3175_c41_50cf : entity work.ldr2_0CLK_77d0ca3d port map (
clk,
ldr2_uxn_opcodes_h_l3175_c41_50cf_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3175_c41_50cf_phase,
ldr2_uxn_opcodes_h_l3175_c41_50cf_ins,
ldr2_uxn_opcodes_h_l3175_c41_50cf_pc,
ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_stack_read,
ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_ram_read,
ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_left,
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_right,
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3
opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond,
opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output);

-- str1_uxn_opcodes_h_l3176_c41_92df
str1_uxn_opcodes_h_l3176_c41_92df : entity work.str1_0CLK_1c7b7172 port map (
clk,
str1_uxn_opcodes_h_l3176_c41_92df_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3176_c41_92df_phase,
str1_uxn_opcodes_h_l3176_c41_92df_ins,
str1_uxn_opcodes_h_l3176_c41_92df_pc,
str1_uxn_opcodes_h_l3176_c41_92df_previous_stack_read,
str1_uxn_opcodes_h_l3176_c41_92df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_left,
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_right,
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3177_c7_040d
opc_result_MUX_uxn_opcodes_h_l3177_c7_040d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_cond,
opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output);

-- str2_uxn_opcodes_h_l3177_c41_f00a
str2_uxn_opcodes_h_l3177_c41_f00a : entity work.str2_0CLK_e6256695 port map (
clk,
str2_uxn_opcodes_h_l3177_c41_f00a_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3177_c41_f00a_phase,
str2_uxn_opcodes_h_l3177_c41_f00a_ins,
str2_uxn_opcodes_h_l3177_c41_f00a_pc,
str2_uxn_opcodes_h_l3177_c41_f00a_previous_stack_read,
str2_uxn_opcodes_h_l3177_c41_f00a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_left,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_right,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3178_c7_5929
opc_result_MUX_uxn_opcodes_h_l3178_c7_5929 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_cond,
opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue,
opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse,
opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output);

-- lda_uxn_opcodes_h_l3178_c41_5c07
lda_uxn_opcodes_h_l3178_c41_5c07 : entity work.lda_0CLK_c26dda62 port map (
clk,
lda_uxn_opcodes_h_l3178_c41_5c07_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3178_c41_5c07_phase,
lda_uxn_opcodes_h_l3178_c41_5c07_ins,
lda_uxn_opcodes_h_l3178_c41_5c07_previous_stack_read,
lda_uxn_opcodes_h_l3178_c41_5c07_previous_ram_read,
lda_uxn_opcodes_h_l3178_c41_5c07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_left,
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_right,
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80
opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_cond,
opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue,
opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse,
opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output);

-- lda2_uxn_opcodes_h_l3179_c41_03cf
lda2_uxn_opcodes_h_l3179_c41_03cf : entity work.lda2_0CLK_2b0015ee port map (
clk,
lda2_uxn_opcodes_h_l3179_c41_03cf_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3179_c41_03cf_phase,
lda2_uxn_opcodes_h_l3179_c41_03cf_ins,
lda2_uxn_opcodes_h_l3179_c41_03cf_previous_stack_read,
lda2_uxn_opcodes_h_l3179_c41_03cf_previous_ram_read,
lda2_uxn_opcodes_h_l3179_c41_03cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_left,
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_right,
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb
opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_cond,
opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output);

-- sta_uxn_opcodes_h_l3180_c41_dffa
sta_uxn_opcodes_h_l3180_c41_dffa : entity work.sta_0CLK_f1f3c8fd port map (
clk,
sta_uxn_opcodes_h_l3180_c41_dffa_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3180_c41_dffa_phase,
sta_uxn_opcodes_h_l3180_c41_dffa_ins,
sta_uxn_opcodes_h_l3180_c41_dffa_previous_stack_read,
sta_uxn_opcodes_h_l3180_c41_dffa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_left,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_right,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3181_c7_309c
opc_result_MUX_uxn_opcodes_h_l3181_c7_309c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_cond,
opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output);

-- sta2_uxn_opcodes_h_l3181_c41_9192
sta2_uxn_opcodes_h_l3181_c41_9192 : entity work.sta2_0CLK_83f22136 port map (
clk,
sta2_uxn_opcodes_h_l3181_c41_9192_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3181_c41_9192_phase,
sta2_uxn_opcodes_h_l3181_c41_9192_ins,
sta2_uxn_opcodes_h_l3181_c41_9192_previous_stack_read,
sta2_uxn_opcodes_h_l3181_c41_9192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_left,
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_right,
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa
opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond,
opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output);

-- dei_uxn_opcodes_h_l3182_c41_39ce
dei_uxn_opcodes_h_l3182_c41_39ce : entity work.dei_0CLK_97c0477d port map (
clk,
dei_uxn_opcodes_h_l3182_c41_39ce_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3182_c41_39ce_phase,
dei_uxn_opcodes_h_l3182_c41_39ce_ins,
dei_uxn_opcodes_h_l3182_c41_39ce_previous_stack_read,
dei_uxn_opcodes_h_l3182_c41_39ce_previous_device_ram_read,
dei_uxn_opcodes_h_l3182_c41_39ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_left,
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_right,
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16
opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_cond,
opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue,
opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse,
opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output);

-- dei2_uxn_opcodes_h_l3183_c41_85a9
dei2_uxn_opcodes_h_l3183_c41_85a9 : entity work.dei2_0CLK_b333a2e2 port map (
clk,
dei2_uxn_opcodes_h_l3183_c41_85a9_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3183_c41_85a9_phase,
dei2_uxn_opcodes_h_l3183_c41_85a9_ins,
dei2_uxn_opcodes_h_l3183_c41_85a9_previous_stack_read,
dei2_uxn_opcodes_h_l3183_c41_85a9_previous_device_ram_read,
dei2_uxn_opcodes_h_l3183_c41_85a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b
opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond,
opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output);

-- deo_uxn_opcodes_h_l3184_c41_97f1
deo_uxn_opcodes_h_l3184_c41_97f1 : entity work.deo_0CLK_3f857061 port map (
clk,
deo_uxn_opcodes_h_l3184_c41_97f1_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3184_c41_97f1_phase,
deo_uxn_opcodes_h_l3184_c41_97f1_ins,
deo_uxn_opcodes_h_l3184_c41_97f1_previous_stack_read,
deo_uxn_opcodes_h_l3184_c41_97f1_previous_device_ram_read,
deo_uxn_opcodes_h_l3184_c41_97f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_left,
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_right,
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3185_c7_8652
opc_result_MUX_uxn_opcodes_h_l3185_c7_8652 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_cond,
opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue,
opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse,
opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output);

-- deo2_uxn_opcodes_h_l3185_c41_3e0b
deo2_uxn_opcodes_h_l3185_c41_3e0b : entity work.deo2_0CLK_0c8ca612 port map (
clk,
deo2_uxn_opcodes_h_l3185_c41_3e0b_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3185_c41_3e0b_phase,
deo2_uxn_opcodes_h_l3185_c41_3e0b_ins,
deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_stack_read,
deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_device_ram_read,
deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_left,
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_right,
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0
opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond,
opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output);

-- add_uxn_opcodes_h_l3186_c41_d191
add_uxn_opcodes_h_l3186_c41_d191 : entity work.add_0CLK_3220bbf1 port map (
clk,
add_uxn_opcodes_h_l3186_c41_d191_CLOCK_ENABLE,
add_uxn_opcodes_h_l3186_c41_d191_phase,
add_uxn_opcodes_h_l3186_c41_d191_ins,
add_uxn_opcodes_h_l3186_c41_d191_previous_stack_read,
add_uxn_opcodes_h_l3186_c41_d191_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_left,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_right,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac
opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond,
opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output);

-- add2_uxn_opcodes_h_l3187_c41_cbfc
add2_uxn_opcodes_h_l3187_c41_cbfc : entity work.add2_0CLK_df1f1450 port map (
clk,
add2_uxn_opcodes_h_l3187_c41_cbfc_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3187_c41_cbfc_phase,
add2_uxn_opcodes_h_l3187_c41_cbfc_ins,
add2_uxn_opcodes_h_l3187_c41_cbfc_previous_stack_read,
add2_uxn_opcodes_h_l3187_c41_cbfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_left,
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_right,
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7
opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_cond,
opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output);

-- sub_uxn_opcodes_h_l3188_c41_75d7
sub_uxn_opcodes_h_l3188_c41_75d7 : entity work.sub_0CLK_3220bbf1 port map (
clk,
sub_uxn_opcodes_h_l3188_c41_75d7_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3188_c41_75d7_phase,
sub_uxn_opcodes_h_l3188_c41_75d7_ins,
sub_uxn_opcodes_h_l3188_c41_75d7_previous_stack_read,
sub_uxn_opcodes_h_l3188_c41_75d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3189_c7_8131
opc_result_MUX_uxn_opcodes_h_l3189_c7_8131 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_cond,
opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue,
opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse,
opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output);

-- sub2_uxn_opcodes_h_l3189_c41_c14b
sub2_uxn_opcodes_h_l3189_c41_c14b : entity work.sub2_0CLK_df1f1450 port map (
clk,
sub2_uxn_opcodes_h_l3189_c41_c14b_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3189_c41_c14b_phase,
sub2_uxn_opcodes_h_l3189_c41_c14b_ins,
sub2_uxn_opcodes_h_l3189_c41_c14b_previous_stack_read,
sub2_uxn_opcodes_h_l3189_c41_c14b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_left,
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_right,
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef
opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_cond,
opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue,
opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse,
opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output);

-- mul_uxn_opcodes_h_l3190_c41_8e41
mul_uxn_opcodes_h_l3190_c41_8e41 : entity work.mul_0CLK_3220bbf1 port map (
clk,
mul_uxn_opcodes_h_l3190_c41_8e41_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3190_c41_8e41_phase,
mul_uxn_opcodes_h_l3190_c41_8e41_ins,
mul_uxn_opcodes_h_l3190_c41_8e41_previous_stack_read,
mul_uxn_opcodes_h_l3190_c41_8e41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_left,
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_right,
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb
opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond,
opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output);

-- mul2_uxn_opcodes_h_l3191_c41_a271
mul2_uxn_opcodes_h_l3191_c41_a271 : entity work.mul2_0CLK_df1f1450 port map (
clk,
mul2_uxn_opcodes_h_l3191_c41_a271_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3191_c41_a271_phase,
mul2_uxn_opcodes_h_l3191_c41_a271_ins,
mul2_uxn_opcodes_h_l3191_c41_a271_previous_stack_read,
mul2_uxn_opcodes_h_l3191_c41_a271_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_left,
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_right,
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5
opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond,
opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output);

-- div_uxn_opcodes_h_l3192_c41_b8bf
div_uxn_opcodes_h_l3192_c41_b8bf : entity work.div_0CLK_d8848769 port map (
clk,
div_uxn_opcodes_h_l3192_c41_b8bf_CLOCK_ENABLE,
div_uxn_opcodes_h_l3192_c41_b8bf_phase,
div_uxn_opcodes_h_l3192_c41_b8bf_ins,
div_uxn_opcodes_h_l3192_c41_b8bf_previous_stack_read,
div_uxn_opcodes_h_l3192_c41_b8bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_left,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_right,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3193_c7_de69
opc_result_MUX_uxn_opcodes_h_l3193_c7_de69 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_cond,
opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue,
opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse,
opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output);

-- div2_uxn_opcodes_h_l3193_c41_eeac
div2_uxn_opcodes_h_l3193_c41_eeac : entity work.div2_0CLK_392dd546 port map (
clk,
div2_uxn_opcodes_h_l3193_c41_eeac_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3193_c41_eeac_phase,
div2_uxn_opcodes_h_l3193_c41_eeac_ins,
div2_uxn_opcodes_h_l3193_c41_eeac_previous_stack_read,
div2_uxn_opcodes_h_l3193_c41_eeac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_left,
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_right,
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3194_c7_f517
opc_result_MUX_uxn_opcodes_h_l3194_c7_f517 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_cond,
opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue,
opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse,
opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output);

-- and_uxn_opcodes_h_l3194_c41_08bb
and_uxn_opcodes_h_l3194_c41_08bb : entity work.and_0CLK_3220bbf1 port map (
clk,
and_uxn_opcodes_h_l3194_c41_08bb_CLOCK_ENABLE,
and_uxn_opcodes_h_l3194_c41_08bb_phase,
and_uxn_opcodes_h_l3194_c41_08bb_ins,
and_uxn_opcodes_h_l3194_c41_08bb_previous_stack_read,
and_uxn_opcodes_h_l3194_c41_08bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_left,
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_right,
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8
opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_cond,
opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output);

-- and2_uxn_opcodes_h_l3195_c41_beb5
and2_uxn_opcodes_h_l3195_c41_beb5 : entity work.and2_0CLK_df1f1450 port map (
clk,
and2_uxn_opcodes_h_l3195_c41_beb5_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3195_c41_beb5_phase,
and2_uxn_opcodes_h_l3195_c41_beb5_ins,
and2_uxn_opcodes_h_l3195_c41_beb5_previous_stack_read,
and2_uxn_opcodes_h_l3195_c41_beb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_left,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_right,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3196_c7_34de
opc_result_MUX_uxn_opcodes_h_l3196_c7_34de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_cond,
opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue,
opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse,
opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output);

-- ora_uxn_opcodes_h_l3196_c41_616d
ora_uxn_opcodes_h_l3196_c41_616d : entity work.ora_0CLK_3220bbf1 port map (
clk,
ora_uxn_opcodes_h_l3196_c41_616d_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3196_c41_616d_phase,
ora_uxn_opcodes_h_l3196_c41_616d_ins,
ora_uxn_opcodes_h_l3196_c41_616d_previous_stack_read,
ora_uxn_opcodes_h_l3196_c41_616d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_left,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_right,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3
opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_cond,
opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output);

-- ora2_uxn_opcodes_h_l3197_c41_e410
ora2_uxn_opcodes_h_l3197_c41_e410 : entity work.ora2_0CLK_df1f1450 port map (
clk,
ora2_uxn_opcodes_h_l3197_c41_e410_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3197_c41_e410_phase,
ora2_uxn_opcodes_h_l3197_c41_e410_ins,
ora2_uxn_opcodes_h_l3197_c41_e410_previous_stack_read,
ora2_uxn_opcodes_h_l3197_c41_e410_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_left,
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_right,
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3198_c7_7809
opc_result_MUX_uxn_opcodes_h_l3198_c7_7809 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_cond,
opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue,
opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse,
opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output);

-- eor_uxn_opcodes_h_l3198_c41_526e
eor_uxn_opcodes_h_l3198_c41_526e : entity work.eor_0CLK_3220bbf1 port map (
clk,
eor_uxn_opcodes_h_l3198_c41_526e_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3198_c41_526e_phase,
eor_uxn_opcodes_h_l3198_c41_526e_ins,
eor_uxn_opcodes_h_l3198_c41_526e_previous_stack_read,
eor_uxn_opcodes_h_l3198_c41_526e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_left,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_right,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8
opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond,
opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output);

-- eor2_uxn_opcodes_h_l3199_c41_0355
eor2_uxn_opcodes_h_l3199_c41_0355 : entity work.eor2_0CLK_df1f1450 port map (
clk,
eor2_uxn_opcodes_h_l3199_c41_0355_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3199_c41_0355_phase,
eor2_uxn_opcodes_h_l3199_c41_0355_ins,
eor2_uxn_opcodes_h_l3199_c41_0355_previous_stack_read,
eor2_uxn_opcodes_h_l3199_c41_0355_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_left,
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_right,
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3200_c7_8429
opc_result_MUX_uxn_opcodes_h_l3200_c7_8429 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_cond,
opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue,
opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse,
opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output);

-- sft_uxn_opcodes_h_l3200_c41_e30b
sft_uxn_opcodes_h_l3200_c41_e30b : entity work.sft_0CLK_71bf0c33 port map (
clk,
sft_uxn_opcodes_h_l3200_c41_e30b_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3200_c41_e30b_phase,
sft_uxn_opcodes_h_l3200_c41_e30b_ins,
sft_uxn_opcodes_h_l3200_c41_e30b_previous_stack_read,
sft_uxn_opcodes_h_l3200_c41_e30b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_left,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_right,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5
opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_cond,
opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output);

-- sft2_uxn_opcodes_h_l3201_c41_5715
sft2_uxn_opcodes_h_l3201_c41_5715 : entity work.sft2_0CLK_cb029fa9 port map (
clk,
sft2_uxn_opcodes_h_l3201_c41_5715_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3201_c41_5715_phase,
sft2_uxn_opcodes_h_l3201_c41_5715_ins,
sft2_uxn_opcodes_h_l3201_c41_5715_previous_stack_read,
sft2_uxn_opcodes_h_l3201_c41_5715_return_output);

-- printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2
printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2 : entity work.printf_uxn_opcodes_h_l3202_c9_94f2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_arg0);

-- sp1_MUX_uxn_opcodes_h_l3204_c2_f292
sp1_MUX_uxn_opcodes_h_l3204_c2_f292 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3204_c2_f292_cond,
sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue,
sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse,
sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output);

-- sp0_MUX_uxn_opcodes_h_l3204_c2_f292
sp0_MUX_uxn_opcodes_h_l3204_c2_f292 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3204_c2_f292_cond,
sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue,
sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse,
sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output);

-- sp1_MUX_uxn_opcodes_h_l3205_c3_d08d
sp1_MUX_uxn_opcodes_h_l3205_c3_d08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_cond,
sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue,
sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse,
sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output);

-- sp0_MUX_uxn_opcodes_h_l3205_c3_d08d
sp0_MUX_uxn_opcodes_h_l3205_c3_d08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_cond,
sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue,
sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse,
sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282
BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_left,
BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_right,
BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b
BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_left,
BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_right,
BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output);

-- MUX_uxn_opcodes_h_l3213_c19_24e0
MUX_uxn_opcodes_h_l3213_c19_24e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3213_c19_24e0_cond,
MUX_uxn_opcodes_h_l3213_c19_24e0_iftrue,
MUX_uxn_opcodes_h_l3213_c19_24e0_iffalse,
MUX_uxn_opcodes_h_l3213_c19_24e0_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21
BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_left,
BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_right,
BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output);

-- MUX_uxn_opcodes_h_l3214_c20_aa57
MUX_uxn_opcodes_h_l3214_c20_aa57 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3214_c20_aa57_cond,
MUX_uxn_opcodes_h_l3214_c20_aa57_iftrue,
MUX_uxn_opcodes_h_l3214_c20_aa57_iffalse,
MUX_uxn_opcodes_h_l3214_c20_aa57_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0
BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0 : entity work.BIN_OP_PLUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_left,
BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_right,
BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output);

-- stack_ram_update_uxn_opcodes_h_l3217_c21_9256
stack_ram_update_uxn_opcodes_h_l3217_c21_9256 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3217_c21_9256_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3217_c21_9256_stack_address,
stack_ram_update_uxn_opcodes_h_l3217_c21_9256_value,
stack_ram_update_uxn_opcodes_h_l3217_c21_9256_write_enable,
stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output);

-- device_ram_update_uxn_opcodes_h_l3223_c26_d54e
device_ram_update_uxn_opcodes_h_l3223_c26_d54e : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_opcodes_h_l3223_c26_d54e_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3223_c26_d54e_device_address,
device_ram_update_uxn_opcodes_h_l3223_c26_d54e_value,
device_ram_update_uxn_opcodes_h_l3223_c26_d54e_write_enable,
device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output,
 CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output,
 MUX_uxn_opcodes_h_l3127_c10_7189_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output,
 MUX_uxn_opcodes_h_l3128_c18_6af5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output,
 opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output,
 jci_uxn_opcodes_h_l3133_c41_1e23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output,
 opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output,
 jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output,
 opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output,
 jsi_uxn_opcodes_h_l3135_c41_00fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output,
 lit_uxn_opcodes_h_l3136_c41_2e47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output,
 opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output,
 lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output,
 lit_uxn_opcodes_h_l3138_c41_4d84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output,
 lit2_uxn_opcodes_h_l3139_c41_d362_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output,
 inc_uxn_opcodes_h_l3140_c41_2770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output,
 inc2_uxn_opcodes_h_l3141_c41_200d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output,
 pop_uxn_opcodes_h_l3142_c41_aeac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output,
 pop2_uxn_opcodes_h_l3143_c41_27a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output,
 opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output,
 nip_uxn_opcodes_h_l3144_c41_32a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output,
 opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output,
 nip2_uxn_opcodes_h_l3145_c41_1209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output,
 opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output,
 swp_uxn_opcodes_h_l3146_c41_27e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output,
 opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output,
 swp2_uxn_opcodes_h_l3147_c41_2a45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output,
 opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output,
 rot_uxn_opcodes_h_l3148_c41_b7a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output,
 opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output,
 rot2_uxn_opcodes_h_l3149_c41_e980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output,
 dup_uxn_opcodes_h_l3150_c41_4197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output,
 opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output,
 dup2_uxn_opcodes_h_l3151_c41_5397_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output,
 opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output,
 ovr_uxn_opcodes_h_l3152_c41_b20f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output,
 opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output,
 ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output,
 opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output,
 equ_uxn_opcodes_h_l3154_c41_5557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output,
 opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output,
 equ2_uxn_opcodes_h_l3155_c41_561f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output,
 opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output,
 neq_uxn_opcodes_h_l3156_c41_27b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output,
 neq2_uxn_opcodes_h_l3157_c41_567b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output,
 opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output,
 gth_uxn_opcodes_h_l3158_c41_b2ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output,
 gth2_uxn_opcodes_h_l3159_c41_29e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output,
 lth_uxn_opcodes_h_l3160_c41_e88a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output,
 opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output,
 lth2_uxn_opcodes_h_l3161_c41_194e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output,
 jmp_uxn_opcodes_h_l3162_c41_e61d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output,
 jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output,
 opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output,
 jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output,
 opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output,
 jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output,
 jsr_uxn_opcodes_h_l3166_c41_3009_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output,
 opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output,
 jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output,
 sth_uxn_opcodes_h_l3168_c41_d6cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output,
 sth2_uxn_opcodes_h_l3169_c41_7d14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output,
 opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output,
 ldz_uxn_opcodes_h_l3170_c41_53e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output,
 opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output,
 ldz2_uxn_opcodes_h_l3171_c41_2613_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output,
 stz_uxn_opcodes_h_l3172_c41_9502_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output,
 stz2_uxn_opcodes_h_l3173_c41_af83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output,
 ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output,
 ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output,
 str1_uxn_opcodes_h_l3176_c41_92df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output,
 opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output,
 str2_uxn_opcodes_h_l3177_c41_f00a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output,
 opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output,
 lda_uxn_opcodes_h_l3178_c41_5c07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output,
 lda2_uxn_opcodes_h_l3179_c41_03cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output,
 sta_uxn_opcodes_h_l3180_c41_dffa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output,
 sta2_uxn_opcodes_h_l3181_c41_9192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output,
 opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output,
 dei_uxn_opcodes_h_l3182_c41_39ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output,
 dei2_uxn_opcodes_h_l3183_c41_85a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output,
 opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output,
 deo_uxn_opcodes_h_l3184_c41_97f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output,
 deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output,
 add_uxn_opcodes_h_l3186_c41_d191_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output,
 add2_uxn_opcodes_h_l3187_c41_cbfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output,
 opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output,
 sub_uxn_opcodes_h_l3188_c41_75d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output,
 opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output,
 sub2_uxn_opcodes_h_l3189_c41_c14b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output,
 mul_uxn_opcodes_h_l3190_c41_8e41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output,
 mul2_uxn_opcodes_h_l3191_c41_a271_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output,
 opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output,
 div_uxn_opcodes_h_l3192_c41_b8bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output,
 opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output,
 div2_uxn_opcodes_h_l3193_c41_eeac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output,
 and_uxn_opcodes_h_l3194_c41_08bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output,
 opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output,
 and2_uxn_opcodes_h_l3195_c41_beb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output,
 ora_uxn_opcodes_h_l3196_c41_616d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output,
 opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output,
 ora2_uxn_opcodes_h_l3197_c41_e410_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output,
 eor_uxn_opcodes_h_l3198_c41_526e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output,
 opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output,
 eor2_uxn_opcodes_h_l3199_c41_0355_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output,
 sft_uxn_opcodes_h_l3200_c41_e30b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output,
 sft2_uxn_opcodes_h_l3201_c41_5715_return_output,
 sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output,
 sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output,
 sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output,
 sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output,
 MUX_uxn_opcodes_h_l3213_c19_24e0_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output,
 MUX_uxn_opcodes_h_l3214_c20_aa57_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output,
 stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output,
 device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3127_c2_bf21 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3127_c10_7189_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3127_c10_7189_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3127_c10_7189_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3127_c30_f58e_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3127_c57_892d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3127_c10_7189_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3132_c2_6bec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3133_c41_1e23_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3133_c41_1e23_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3133_c41_1e23_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3133_c41_1e23_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3133_c41_1e23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3133_c41_1e23_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3136_c41_2e47_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3136_c41_2e47_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3136_c41_2e47_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3136_c41_2e47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3136_c41_2e47_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3138_c41_4d84_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3138_c41_4d84_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3138_c41_4d84_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3138_c41_4d84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3138_c41_4d84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3139_c41_d362_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3139_c41_d362_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3139_c41_d362_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3139_c41_d362_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3139_c41_d362_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3140_c41_2770_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3140_c41_2770_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3140_c41_2770_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3140_c41_2770_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3140_c41_2770_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3141_c41_200d_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3141_c41_200d_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3141_c41_200d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3141_c41_200d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3141_c41_200d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3142_c41_aeac_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3142_c41_aeac_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3142_c41_aeac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3142_c41_aeac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3144_c41_32a9_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3144_c41_32a9_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3144_c41_32a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3144_c41_32a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3144_c41_32a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3145_c41_1209_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3145_c41_1209_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3145_c41_1209_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3145_c41_1209_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3145_c41_1209_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3146_c41_27e8_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3146_c41_27e8_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3146_c41_27e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3146_c41_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3146_c41_27e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3149_c41_e980_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3149_c41_e980_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3149_c41_e980_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3149_c41_e980_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3149_c41_e980_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3150_c41_4197_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3150_c41_4197_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3150_c41_4197_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3150_c41_4197_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3150_c41_4197_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3151_c41_5397_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3151_c41_5397_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3151_c41_5397_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3151_c41_5397_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3151_c41_5397_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3154_c41_5557_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3154_c41_5557_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3154_c41_5557_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3154_c41_5557_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3154_c41_5557_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3155_c41_561f_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3155_c41_561f_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3155_c41_561f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3155_c41_561f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3155_c41_561f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3156_c41_27b0_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3156_c41_27b0_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3156_c41_27b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3156_c41_27b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3156_c41_27b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3157_c41_567b_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3157_c41_567b_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3157_c41_567b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3157_c41_567b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3157_c41_567b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3160_c41_e88a_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3160_c41_e88a_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3160_c41_e88a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3160_c41_e88a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3160_c41_e88a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3161_c41_194e_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3161_c41_194e_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3161_c41_194e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3161_c41_194e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3161_c41_194e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3166_c41_3009_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3166_c41_3009_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3166_c41_3009_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3166_c41_3009_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3166_c41_3009_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3166_c41_3009_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3172_c41_9502_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3172_c41_9502_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3172_c41_9502_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3172_c41_9502_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3172_c41_9502_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3173_c41_af83_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3173_c41_af83_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3173_c41_af83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3173_c41_af83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3173_c41_af83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3176_c41_92df_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3176_c41_92df_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3176_c41_92df_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3176_c41_92df_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3176_c41_92df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3176_c41_92df_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3177_c41_f00a_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3177_c41_f00a_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3177_c41_f00a_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3177_c41_f00a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3177_c41_f00a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3177_c41_f00a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3178_c41_5c07_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3178_c41_5c07_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3178_c41_5c07_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3178_c41_5c07_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3178_c41_5c07_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3178_c41_5c07_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3180_c41_dffa_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3180_c41_dffa_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3180_c41_dffa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3180_c41_dffa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3180_c41_dffa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3181_c41_9192_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3181_c41_9192_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3181_c41_9192_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3181_c41_9192_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3181_c41_9192_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3182_c41_39ce_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3182_c41_39ce_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3182_c41_39ce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3182_c41_39ce_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3182_c41_39ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3182_c41_39ce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3184_c41_97f1_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3184_c41_97f1_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3184_c41_97f1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3184_c41_97f1_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3184_c41_97f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3184_c41_97f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3186_c41_d191_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3186_c41_d191_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3186_c41_d191_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3186_c41_d191_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3186_c41_d191_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3188_c41_75d7_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3188_c41_75d7_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3188_c41_75d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3188_c41_75d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3188_c41_75d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3190_c41_8e41_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3190_c41_8e41_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3190_c41_8e41_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3190_c41_8e41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3190_c41_8e41_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3191_c41_a271_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3191_c41_a271_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3191_c41_a271_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3191_c41_a271_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3191_c41_a271_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3192_c41_b8bf_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3192_c41_b8bf_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3192_c41_b8bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3192_c41_b8bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3192_c41_b8bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3193_c41_eeac_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3193_c41_eeac_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3193_c41_eeac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3193_c41_eeac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3193_c41_eeac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3194_c41_08bb_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3194_c41_08bb_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3194_c41_08bb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3194_c41_08bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3194_c41_08bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3195_c41_beb5_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3195_c41_beb5_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3195_c41_beb5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3195_c41_beb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3195_c41_beb5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3196_c41_616d_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3196_c41_616d_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3196_c41_616d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3196_c41_616d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3196_c41_616d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3197_c41_e410_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3197_c41_e410_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3197_c41_e410_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3197_c41_e410_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3197_c41_e410_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3198_c41_526e_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3198_c41_526e_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3198_c41_526e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3198_c41_526e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3198_c41_526e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3199_c41_0355_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3199_c41_0355_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3199_c41_0355_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3199_c41_0355_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3199_c41_0355_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3200_c41_e30b_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3200_c41_e30b_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3200_c41_e30b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3200_c41_e30b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3200_c41_e30b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3201_c41_5715_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3201_c41_5715_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3201_c41_5715_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3201_c41_5715_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3201_c41_5715_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3204_c6_d58d_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3206_c4_56d2 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3208_c4_f513 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3212_c19_c4a0_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3213_c2_8c59 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3213_c82_4f97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output : unsigned(7 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3214_c2_8a4f : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3215_c22_f789_return_output : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_stack_address : unsigned(15 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_write_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3224_c3_06b0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3225_c3_3d51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3226_c3_da31_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3229_c34_23eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3230_c23_85b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3231_c33_486a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3232_c29_cdf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3233_c30_c82a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3234_c34_ddfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3235_c33_1a6d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3236_c31_27dd_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3237_c32_6824_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3213_l3214_l3205_DUPLICATE_9649_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3206_l3208_DUPLICATE_30c2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3239_l3111_DUPLICATE_e3b5_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_right := to_unsigned(34, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_right := to_unsigned(64, 7);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_right := to_unsigned(30, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_right := to_unsigned(2048, 12);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_right := to_unsigned(1024, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_right := to_unsigned(24, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_right := to_unsigned(2560, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_right := to_unsigned(37, 6);
     VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_right := to_unsigned(1536, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_right := to_unsigned(54, 6);
     VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_right := to_unsigned(9, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3182_c41_39ce_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3184_c41_97f1_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3186_c41_d191_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3195_c41_beb5_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3194_c41_08bb_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3182_c41_39ce_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3184_c41_97f1_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3193_c41_eeac_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3192_c41_b8bf_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3151_c41_5397_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3150_c41_4197_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3199_c41_0355_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3198_c41_526e_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3155_c41_561f_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3154_c41_5557_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3141_c41_200d_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3140_c41_2770_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3166_c41_3009_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3178_c41_5c07_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3161_c41_194e_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3160_c41_e88a_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3191_c41_a271_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3190_c41_8e41_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3157_c41_567b_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3156_c41_27b0_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3145_c41_1209_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3144_c41_32a9_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3197_c41_e410_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3196_c41_616d_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3142_c41_aeac_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3149_c41_e980_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3201_c41_5715_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3200_c41_e30b_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3181_c41_9192_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3180_c41_dffa_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3176_c41_92df_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3177_c41_f00a_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3173_c41_af83_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3172_c41_9502_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3188_c41_75d7_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3146_c41_27e8_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3133_c41_1e23_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3166_c41_3009_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3139_c41_d362_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3136_c41_2e47_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3138_c41_4d84_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3176_c41_92df_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3177_c41_f00a_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3186_c41_d191_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3195_c41_beb5_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3194_c41_08bb_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3182_c41_39ce_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3184_c41_97f1_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3193_c41_eeac_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3192_c41_b8bf_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3151_c41_5397_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3150_c41_4197_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3199_c41_0355_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3198_c41_526e_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3155_c41_561f_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3154_c41_5557_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3141_c41_200d_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3140_c41_2770_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3133_c41_1e23_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3166_c41_3009_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3178_c41_5c07_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3139_c41_d362_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3136_c41_2e47_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3138_c41_4d84_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3161_c41_194e_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3160_c41_e88a_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3191_c41_a271_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3190_c41_8e41_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3157_c41_567b_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3156_c41_27b0_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3145_c41_1209_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3144_c41_32a9_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3197_c41_e410_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3196_c41_616d_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3142_c41_aeac_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3149_c41_e980_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3201_c41_5715_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3200_c41_e30b_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3181_c41_9192_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3180_c41_dffa_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3176_c41_92df_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3177_c41_f00a_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3173_c41_af83_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3172_c41_9502_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3188_c41_75d7_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3146_c41_27e8_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3133_c41_1e23_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3178_c41_5c07_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3139_c41_d362_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3136_c41_2e47_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3138_c41_4d84_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3186_c41_d191_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3195_c41_beb5_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3194_c41_08bb_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3182_c41_39ce_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3184_c41_97f1_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3193_c41_eeac_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3192_c41_b8bf_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3151_c41_5397_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3150_c41_4197_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3199_c41_0355_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3198_c41_526e_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3155_c41_561f_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3154_c41_5557_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3141_c41_200d_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3140_c41_2770_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3133_c41_1e23_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3166_c41_3009_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3178_c41_5c07_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3161_c41_194e_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3160_c41_e88a_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3191_c41_a271_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3190_c41_8e41_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3157_c41_567b_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3156_c41_27b0_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3145_c41_1209_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3144_c41_32a9_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3197_c41_e410_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3196_c41_616d_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3149_c41_e980_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3201_c41_5715_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3200_c41_e30b_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3181_c41_9192_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3180_c41_dffa_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3176_c41_92df_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3177_c41_f00a_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3173_c41_af83_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3172_c41_9502_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3188_c41_75d7_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3146_c41_27e8_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l3127_c41_2c98] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_left;
     BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output := BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3127_c57_892d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3127_c57_892d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3128_c18_4f92] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_left;
     BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output := BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3127_c10_0066] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_left;
     BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output := BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3132_c2_6bec] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3132_c2_6bec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c10_0066_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_4f92_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3127_c57_892d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3132_c2_6bec_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3127_c30_f58e] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3127_c30_f58e_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3127_c41_2c98_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3128_c18_5ea5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_left;
     BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output := BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3127_c10_7946] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_left;
     BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output := BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l3127_c57_cfe2] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output := CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3127_c10_7189_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3127_c10_7946_return_output;
     VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_5ea5_return_output;
     VAR_MUX_uxn_opcodes_h_l3127_c10_7189_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3127_c30_f58e_return_output;
     VAR_MUX_uxn_opcodes_h_l3127_c10_7189_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3127_c57_cfe2_return_output;
     -- MUX[uxn_opcodes_h_l3127_c10_7189] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3127_c10_7189_cond <= VAR_MUX_uxn_opcodes_h_l3127_c10_7189_cond;
     MUX_uxn_opcodes_h_l3127_c10_7189_iftrue <= VAR_MUX_uxn_opcodes_h_l3127_c10_7189_iftrue;
     MUX_uxn_opcodes_h_l3127_c10_7189_iffalse <= VAR_MUX_uxn_opcodes_h_l3127_c10_7189_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3127_c10_7189_return_output := MUX_uxn_opcodes_h_l3127_c10_7189_return_output;

     -- MUX[uxn_opcodes_h_l3128_c18_6af5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3128_c18_6af5_cond <= VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_cond;
     MUX_uxn_opcodes_h_l3128_c18_6af5_iftrue <= VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_iftrue;
     MUX_uxn_opcodes_h_l3128_c18_6af5_iffalse <= VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_return_output := MUX_uxn_opcodes_h_l3128_c18_6af5_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3127_c2_bf21 := VAR_MUX_uxn_opcodes_h_l3127_c10_7189_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_left := VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l3128_c18_6af5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_left := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3127_c2_bf21;
     VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg1 := resize(VAR_opc_uxn_opcodes_h_l3127_c2_bf21, 32);
     VAR_printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_arg0 := resize(VAR_opc_uxn_opcodes_h_l3127_c2_bf21, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3184_c11_30b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_c136] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_left;
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output := BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3177_c11_c106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_left;
     BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output := BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_4499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_left;
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output := BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_4686] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_left;
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output := BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3200_c11_4fd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3183_c11_622a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3191_c11_79be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_left;
     BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output := BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3176_c11_c440] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_left;
     BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output := BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_c918] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_left;
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output := BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_cd8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_4c66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_left;
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output := BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_6d96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_left;
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output := BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3146_c11_96b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_46a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3189_c11_c5b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3167_c11_2054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_left;
     BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output := BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_4772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_left;
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output := BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_1c5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_964b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3168_c11_20ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3138_c11_65c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_bda9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_afe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_9bea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_left;
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output := BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3135_c11_c633] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_left;
     BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output := BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3152_c11_08c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3172_c11_5354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_left;
     BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output := BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3195_c11_89cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3133_c11_f085] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_left;
     BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output := BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_8934] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_left;
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output := BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3142_c11_0aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_6feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3154_c11_dcba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_left;
     BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output := BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3156_c11_a951] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_left;
     BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output := BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3134_c11_11a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_80fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_e2c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3179_c11_e319] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_left;
     BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output := BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3180_c11_d36d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_03f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3192_c11_3221] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_left;
     BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output := BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3190_c11_44d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_677e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_c4e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_56fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3144_c11_1cae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_left;
     BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output := BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3132_c6_b8c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3169_c11_aa60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_left;
     BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output := BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_6e50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_left;
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output := BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3186_c11_5f01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_left;
     BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output := BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_cb16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_left;
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output := BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3174_c11_f3df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_left;
     BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output := BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3194_c11_2a98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_left;
     BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output := BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output;

     -- printf_uxn_opcodes_h_l3130_c2_218f[uxn_opcodes_h_l3130_c2_218f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg0 <= VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg0;
     printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg1 <= VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg1;
     printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg2 <= VAR_printf_uxn_opcodes_h_l3130_c2_218f_uxn_opcodes_h_l3130_c2_218f_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_e89c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3136_c11_7125] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_left;
     BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output := BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3175_c11_9d43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_left;
     BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output := BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3150_c11_381a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_f613] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_left;
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output := BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3185_c11_3346] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_left;
     BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output := BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3147_c11_044c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3182_c11_4679] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_left;
     BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output := BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3160_c11_b935] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_left;
     BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output := BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3162_c11_bc69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_left;
     BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output := BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3164_c11_3f5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3188_c11_8137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_left;
     BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output := BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_2ca9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3159_c11_f832] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_left;
     BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output := BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3198_c11_1d29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_left;
     BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output := BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3171_c11_ce9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3132_c6_b8c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_f085_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c11_11a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3135_c11_c633_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c11_7125_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_80fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_65c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_6e50_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e2c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_964b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_0aa2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_4499_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_1cae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6d96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_96b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_044c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_8934_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_1c5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_381a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_c136_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_08c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_cb16_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_dcba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_bda9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_a951_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_9bea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_2ca9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_f832_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_b935_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_4686_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_bc69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_4772_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_3f5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_cd8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_56fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_2054_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_20ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_aa60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_4c66_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_ce9d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_5354_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_c4e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_f3df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_9d43_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_c440_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c106_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_afe8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_e319_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_d36d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_03f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4679_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_622a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_30b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_3346_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_5f01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_6feb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8137_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_c5b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_44d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_79be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_3221_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_e89c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_2a98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_89cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_46a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_c918_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_1d29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_677e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_4fd6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_f613_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3133_c7_fe84] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3133_c1_54cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3134_c7_00c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output;
     VAR_jci_uxn_opcodes_h_l3133_c41_1e23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3133_c1_54cf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3134_c1_fc46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3135_c7_fb81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output;

     -- jci[uxn_opcodes_h_l3133_c41_1e23] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3133_c41_1e23_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3133_c41_1e23_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3133_c41_1e23_phase <= VAR_jci_uxn_opcodes_h_l3133_c41_1e23_phase;
     jci_uxn_opcodes_h_l3133_c41_1e23_pc <= VAR_jci_uxn_opcodes_h_l3133_c41_1e23_pc;
     jci_uxn_opcodes_h_l3133_c41_1e23_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3133_c41_1e23_previous_stack_read;
     jci_uxn_opcodes_h_l3133_c41_1e23_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3133_c41_1e23_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3133_c41_1e23_return_output := jci_uxn_opcodes_h_l3133_c41_1e23_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output;
     VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_fc46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue := VAR_jci_uxn_opcodes_h_l3133_c41_1e23_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3135_c1_208b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output;

     -- jmi[uxn_opcodes_h_l3134_c41_f3f4] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3134_c41_f3f4_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3134_c41_f3f4_phase <= VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_phase;
     jmi_uxn_opcodes_h_l3134_c41_f3f4_pc <= VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_pc;
     jmi_uxn_opcodes_h_l3134_c41_f3f4_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output := jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3136_c7_6f10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output;
     VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3135_c1_208b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue := VAR_jmi_uxn_opcodes_h_l3134_c41_f3f4_return_output;
     -- jsi[uxn_opcodes_h_l3135_c41_00fd] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3135_c41_00fd_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3135_c41_00fd_phase <= VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_phase;
     jsi_uxn_opcodes_h_l3135_c41_00fd_pc <= VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_pc;
     jsi_uxn_opcodes_h_l3135_c41_00fd_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_return_output := jsi_uxn_opcodes_h_l3135_c41_00fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c7_194c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3136_c1_3d49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_194c_return_output;
     VAR_lit_uxn_opcodes_h_l3136_c41_2e47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3136_c1_3d49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue := VAR_jsi_uxn_opcodes_h_l3135_c41_00fd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c7_2f58] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output;

     -- lit[uxn_opcodes_h_l3136_c41_2e47] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3136_c41_2e47_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3136_c41_2e47_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3136_c41_2e47_phase <= VAR_lit_uxn_opcodes_h_l3136_c41_2e47_phase;
     lit_uxn_opcodes_h_l3136_c41_2e47_pc <= VAR_lit_uxn_opcodes_h_l3136_c41_2e47_pc;
     lit_uxn_opcodes_h_l3136_c41_2e47_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3136_c41_2e47_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3136_c41_2e47_return_output := lit_uxn_opcodes_h_l3136_c41_2e47_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c1_4d6d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output;
     VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_4d6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue := VAR_lit_uxn_opcodes_h_l3136_c41_2e47_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c1_d768] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output;

     -- lit2[uxn_opcodes_h_l3137_c41_bc3a] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3137_c41_bc3a_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3137_c41_bc3a_phase <= VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_phase;
     lit2_uxn_opcodes_h_l3137_c41_bc3a_pc <= VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_pc;
     lit2_uxn_opcodes_h_l3137_c41_bc3a_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output := lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c7_282b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_282b_return_output;
     VAR_lit_uxn_opcodes_h_l3138_c41_4d84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_d768_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue := VAR_lit2_uxn_opcodes_h_l3137_c41_bc3a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c1_c33b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c7_d9e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output;

     -- lit[uxn_opcodes_h_l3138_c41_4d84] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3138_c41_4d84_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3138_c41_4d84_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3138_c41_4d84_phase <= VAR_lit_uxn_opcodes_h_l3138_c41_4d84_phase;
     lit_uxn_opcodes_h_l3138_c41_4d84_pc <= VAR_lit_uxn_opcodes_h_l3138_c41_4d84_pc;
     lit_uxn_opcodes_h_l3138_c41_4d84_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3138_c41_4d84_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3138_c41_4d84_return_output := lit_uxn_opcodes_h_l3138_c41_4d84_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output;
     VAR_lit2_uxn_opcodes_h_l3139_c41_d362_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_c33b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue := VAR_lit_uxn_opcodes_h_l3138_c41_4d84_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c7_a04b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output;

     -- lit2[uxn_opcodes_h_l3139_c41_d362] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3139_c41_d362_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3139_c41_d362_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3139_c41_d362_phase <= VAR_lit2_uxn_opcodes_h_l3139_c41_d362_phase;
     lit2_uxn_opcodes_h_l3139_c41_d362_pc <= VAR_lit2_uxn_opcodes_h_l3139_c41_d362_pc;
     lit2_uxn_opcodes_h_l3139_c41_d362_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3139_c41_d362_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3139_c41_d362_return_output := lit2_uxn_opcodes_h_l3139_c41_d362_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c1_8e46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output;
     VAR_inc_uxn_opcodes_h_l3140_c41_2770_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_8e46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue := VAR_lit2_uxn_opcodes_h_l3139_c41_d362_return_output;
     -- inc[uxn_opcodes_h_l3140_c41_2770] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3140_c41_2770_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3140_c41_2770_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3140_c41_2770_phase <= VAR_inc_uxn_opcodes_h_l3140_c41_2770_phase;
     inc_uxn_opcodes_h_l3140_c41_2770_ins <= VAR_inc_uxn_opcodes_h_l3140_c41_2770_ins;
     inc_uxn_opcodes_h_l3140_c41_2770_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3140_c41_2770_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3140_c41_2770_return_output := inc_uxn_opcodes_h_l3140_c41_2770_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c7_955c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c1_bc0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_955c_return_output;
     VAR_inc2_uxn_opcodes_h_l3141_c41_200d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_bc0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue := VAR_inc_uxn_opcodes_h_l3140_c41_2770_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c1_e7d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output;

     -- inc2[uxn_opcodes_h_l3141_c41_200d] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3141_c41_200d_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3141_c41_200d_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3141_c41_200d_phase <= VAR_inc2_uxn_opcodes_h_l3141_c41_200d_phase;
     inc2_uxn_opcodes_h_l3141_c41_200d_ins <= VAR_inc2_uxn_opcodes_h_l3141_c41_200d_ins;
     inc2_uxn_opcodes_h_l3141_c41_200d_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3141_c41_200d_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3141_c41_200d_return_output := inc2_uxn_opcodes_h_l3141_c41_200d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c7_141a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_141a_return_output;
     VAR_pop_uxn_opcodes_h_l3142_c41_aeac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_e7d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue := VAR_inc2_uxn_opcodes_h_l3141_c41_200d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c1_94f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c7_8d5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output;

     -- pop[uxn_opcodes_h_l3142_c41_aeac] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3142_c41_aeac_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3142_c41_aeac_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3142_c41_aeac_phase <= VAR_pop_uxn_opcodes_h_l3142_c41_aeac_phase;
     pop_uxn_opcodes_h_l3142_c41_aeac_ins <= VAR_pop_uxn_opcodes_h_l3142_c41_aeac_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3142_c41_aeac_return_output := pop_uxn_opcodes_h_l3142_c41_aeac_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output;
     VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_94f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue := VAR_pop_uxn_opcodes_h_l3142_c41_aeac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c7_bbfe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c1_524d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output;

     -- pop2[uxn_opcodes_h_l3143_c41_27a7] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3143_c41_27a7_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3143_c41_27a7_phase <= VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_phase;
     pop2_uxn_opcodes_h_l3143_c41_27a7_ins <= VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_return_output := pop2_uxn_opcodes_h_l3143_c41_27a7_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output;
     VAR_nip_uxn_opcodes_h_l3144_c41_32a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_524d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue := VAR_pop2_uxn_opcodes_h_l3143_c41_27a7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c7_8135] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c1_a212] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output;

     -- nip[uxn_opcodes_h_l3144_c41_32a9] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3144_c41_32a9_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3144_c41_32a9_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3144_c41_32a9_phase <= VAR_nip_uxn_opcodes_h_l3144_c41_32a9_phase;
     nip_uxn_opcodes_h_l3144_c41_32a9_ins <= VAR_nip_uxn_opcodes_h_l3144_c41_32a9_ins;
     nip_uxn_opcodes_h_l3144_c41_32a9_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3144_c41_32a9_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3144_c41_32a9_return_output := nip_uxn_opcodes_h_l3144_c41_32a9_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_8135_return_output;
     VAR_nip2_uxn_opcodes_h_l3145_c41_1209_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_a212_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue := VAR_nip_uxn_opcodes_h_l3144_c41_32a9_return_output;
     -- nip2[uxn_opcodes_h_l3145_c41_1209] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3145_c41_1209_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3145_c41_1209_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3145_c41_1209_phase <= VAR_nip2_uxn_opcodes_h_l3145_c41_1209_phase;
     nip2_uxn_opcodes_h_l3145_c41_1209_ins <= VAR_nip2_uxn_opcodes_h_l3145_c41_1209_ins;
     nip2_uxn_opcodes_h_l3145_c41_1209_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3145_c41_1209_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3145_c41_1209_return_output := nip2_uxn_opcodes_h_l3145_c41_1209_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c7_ac68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c1_6b8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output;
     VAR_swp_uxn_opcodes_h_l3146_c41_27e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_6b8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue := VAR_nip2_uxn_opcodes_h_l3145_c41_1209_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c7_e3db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c1_57ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output;

     -- swp[uxn_opcodes_h_l3146_c41_27e8] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3146_c41_27e8_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3146_c41_27e8_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3146_c41_27e8_phase <= VAR_swp_uxn_opcodes_h_l3146_c41_27e8_phase;
     swp_uxn_opcodes_h_l3146_c41_27e8_ins <= VAR_swp_uxn_opcodes_h_l3146_c41_27e8_ins;
     swp_uxn_opcodes_h_l3146_c41_27e8_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3146_c41_27e8_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3146_c41_27e8_return_output := swp_uxn_opcodes_h_l3146_c41_27e8_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output;
     VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_57ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue := VAR_swp_uxn_opcodes_h_l3146_c41_27e8_return_output;
     -- swp2[uxn_opcodes_h_l3147_c41_2a45] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3147_c41_2a45_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3147_c41_2a45_phase <= VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_phase;
     swp2_uxn_opcodes_h_l3147_c41_2a45_ins <= VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_ins;
     swp2_uxn_opcodes_h_l3147_c41_2a45_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_return_output := swp2_uxn_opcodes_h_l3147_c41_2a45_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c7_04df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c1_c780] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_04df_return_output;
     VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_c780_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue := VAR_swp2_uxn_opcodes_h_l3147_c41_2a45_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c1_9cad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c7_1b89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output;

     -- rot[uxn_opcodes_h_l3148_c41_b7a4] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3148_c41_b7a4_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3148_c41_b7a4_phase <= VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_phase;
     rot_uxn_opcodes_h_l3148_c41_b7a4_ins <= VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_ins;
     rot_uxn_opcodes_h_l3148_c41_b7a4_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_return_output := rot_uxn_opcodes_h_l3148_c41_b7a4_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output;
     VAR_rot2_uxn_opcodes_h_l3149_c41_e980_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_9cad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue := VAR_rot_uxn_opcodes_h_l3148_c41_b7a4_return_output;
     -- rot2[uxn_opcodes_h_l3149_c41_e980] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3149_c41_e980_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3149_c41_e980_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3149_c41_e980_phase <= VAR_rot2_uxn_opcodes_h_l3149_c41_e980_phase;
     rot2_uxn_opcodes_h_l3149_c41_e980_ins <= VAR_rot2_uxn_opcodes_h_l3149_c41_e980_ins;
     rot2_uxn_opcodes_h_l3149_c41_e980_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3149_c41_e980_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3149_c41_e980_return_output := rot2_uxn_opcodes_h_l3149_c41_e980_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c1_aac1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c7_312f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_312f_return_output;
     VAR_dup_uxn_opcodes_h_l3150_c41_4197_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_aac1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue := VAR_rot2_uxn_opcodes_h_l3149_c41_e980_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c1_ec11] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c7_6025] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output;

     -- dup[uxn_opcodes_h_l3150_c41_4197] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3150_c41_4197_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3150_c41_4197_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3150_c41_4197_phase <= VAR_dup_uxn_opcodes_h_l3150_c41_4197_phase;
     dup_uxn_opcodes_h_l3150_c41_4197_ins <= VAR_dup_uxn_opcodes_h_l3150_c41_4197_ins;
     dup_uxn_opcodes_h_l3150_c41_4197_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3150_c41_4197_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3150_c41_4197_return_output := dup_uxn_opcodes_h_l3150_c41_4197_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_6025_return_output;
     VAR_dup2_uxn_opcodes_h_l3151_c41_5397_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_ec11_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue := VAR_dup_uxn_opcodes_h_l3150_c41_4197_return_output;
     -- dup2[uxn_opcodes_h_l3151_c41_5397] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3151_c41_5397_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3151_c41_5397_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3151_c41_5397_phase <= VAR_dup2_uxn_opcodes_h_l3151_c41_5397_phase;
     dup2_uxn_opcodes_h_l3151_c41_5397_ins <= VAR_dup2_uxn_opcodes_h_l3151_c41_5397_ins;
     dup2_uxn_opcodes_h_l3151_c41_5397_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3151_c41_5397_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3151_c41_5397_return_output := dup2_uxn_opcodes_h_l3151_c41_5397_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c1_619c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c7_2eba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output;
     VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_619c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue := VAR_dup2_uxn_opcodes_h_l3151_c41_5397_return_output;
     -- ovr[uxn_opcodes_h_l3152_c41_b20f] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3152_c41_b20f_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3152_c41_b20f_phase <= VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_phase;
     ovr_uxn_opcodes_h_l3152_c41_b20f_ins <= VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_ins;
     ovr_uxn_opcodes_h_l3152_c41_b20f_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_return_output := ovr_uxn_opcodes_h_l3152_c41_b20f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c7_cf21] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c1_2109] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output;
     VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_2109_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue := VAR_ovr_uxn_opcodes_h_l3152_c41_b20f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c7_8d63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output;

     -- ovr2[uxn_opcodes_h_l3153_c41_5bb8] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3153_c41_5bb8_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3153_c41_5bb8_phase <= VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_phase;
     ovr2_uxn_opcodes_h_l3153_c41_5bb8_ins <= VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_ins;
     ovr2_uxn_opcodes_h_l3153_c41_5bb8_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output := ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c1_474f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output;
     VAR_equ_uxn_opcodes_h_l3154_c41_5557_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_474f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue := VAR_ovr2_uxn_opcodes_h_l3153_c41_5bb8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c7_c1de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output;

     -- equ[uxn_opcodes_h_l3154_c41_5557] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3154_c41_5557_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3154_c41_5557_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3154_c41_5557_phase <= VAR_equ_uxn_opcodes_h_l3154_c41_5557_phase;
     equ_uxn_opcodes_h_l3154_c41_5557_ins <= VAR_equ_uxn_opcodes_h_l3154_c41_5557_ins;
     equ_uxn_opcodes_h_l3154_c41_5557_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3154_c41_5557_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3154_c41_5557_return_output := equ_uxn_opcodes_h_l3154_c41_5557_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c1_4fa1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output;
     VAR_equ2_uxn_opcodes_h_l3155_c41_561f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_4fa1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue := VAR_equ_uxn_opcodes_h_l3154_c41_5557_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c1_7518] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output;

     -- equ2[uxn_opcodes_h_l3155_c41_561f] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3155_c41_561f_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3155_c41_561f_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3155_c41_561f_phase <= VAR_equ2_uxn_opcodes_h_l3155_c41_561f_phase;
     equ2_uxn_opcodes_h_l3155_c41_561f_ins <= VAR_equ2_uxn_opcodes_h_l3155_c41_561f_ins;
     equ2_uxn_opcodes_h_l3155_c41_561f_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3155_c41_561f_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3155_c41_561f_return_output := equ2_uxn_opcodes_h_l3155_c41_561f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c7_db23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_db23_return_output;
     VAR_neq_uxn_opcodes_h_l3156_c41_27b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_7518_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue := VAR_equ2_uxn_opcodes_h_l3155_c41_561f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c7_616f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output;

     -- neq[uxn_opcodes_h_l3156_c41_27b0] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3156_c41_27b0_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3156_c41_27b0_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3156_c41_27b0_phase <= VAR_neq_uxn_opcodes_h_l3156_c41_27b0_phase;
     neq_uxn_opcodes_h_l3156_c41_27b0_ins <= VAR_neq_uxn_opcodes_h_l3156_c41_27b0_ins;
     neq_uxn_opcodes_h_l3156_c41_27b0_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3156_c41_27b0_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3156_c41_27b0_return_output := neq_uxn_opcodes_h_l3156_c41_27b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c1_1447] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_616f_return_output;
     VAR_neq2_uxn_opcodes_h_l3157_c41_567b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_1447_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue := VAR_neq_uxn_opcodes_h_l3156_c41_27b0_return_output;
     -- neq2[uxn_opcodes_h_l3157_c41_567b] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3157_c41_567b_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3157_c41_567b_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3157_c41_567b_phase <= VAR_neq2_uxn_opcodes_h_l3157_c41_567b_phase;
     neq2_uxn_opcodes_h_l3157_c41_567b_ins <= VAR_neq2_uxn_opcodes_h_l3157_c41_567b_ins;
     neq2_uxn_opcodes_h_l3157_c41_567b_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3157_c41_567b_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3157_c41_567b_return_output := neq2_uxn_opcodes_h_l3157_c41_567b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c1_d72e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c7_7638] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_7638_return_output;
     VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_d72e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue := VAR_neq2_uxn_opcodes_h_l3157_c41_567b_return_output;
     -- gth[uxn_opcodes_h_l3158_c41_b2ed] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3158_c41_b2ed_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3158_c41_b2ed_phase <= VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_phase;
     gth_uxn_opcodes_h_l3158_c41_b2ed_ins <= VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_ins;
     gth_uxn_opcodes_h_l3158_c41_b2ed_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_return_output := gth_uxn_opcodes_h_l3158_c41_b2ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c7_9abc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c1_cdda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output;
     VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_cdda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue := VAR_gth_uxn_opcodes_h_l3158_c41_b2ed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c7_cea0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c1_766b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output;

     -- gth2[uxn_opcodes_h_l3159_c41_29e1] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3159_c41_29e1_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3159_c41_29e1_phase <= VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_phase;
     gth2_uxn_opcodes_h_l3159_c41_29e1_ins <= VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_ins;
     gth2_uxn_opcodes_h_l3159_c41_29e1_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_return_output := gth2_uxn_opcodes_h_l3159_c41_29e1_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output;
     VAR_lth_uxn_opcodes_h_l3160_c41_e88a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_766b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue := VAR_gth2_uxn_opcodes_h_l3159_c41_29e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c1_4b2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output;

     -- lth[uxn_opcodes_h_l3160_c41_e88a] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3160_c41_e88a_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3160_c41_e88a_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3160_c41_e88a_phase <= VAR_lth_uxn_opcodes_h_l3160_c41_e88a_phase;
     lth_uxn_opcodes_h_l3160_c41_e88a_ins <= VAR_lth_uxn_opcodes_h_l3160_c41_e88a_ins;
     lth_uxn_opcodes_h_l3160_c41_e88a_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3160_c41_e88a_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3160_c41_e88a_return_output := lth_uxn_opcodes_h_l3160_c41_e88a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c7_3952] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_3952_return_output;
     VAR_lth2_uxn_opcodes_h_l3161_c41_194e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_4b2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue := VAR_lth_uxn_opcodes_h_l3160_c41_e88a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c7_bde2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c1_3dfa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output;

     -- lth2[uxn_opcodes_h_l3161_c41_194e] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3161_c41_194e_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3161_c41_194e_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3161_c41_194e_phase <= VAR_lth2_uxn_opcodes_h_l3161_c41_194e_phase;
     lth2_uxn_opcodes_h_l3161_c41_194e_ins <= VAR_lth2_uxn_opcodes_h_l3161_c41_194e_ins;
     lth2_uxn_opcodes_h_l3161_c41_194e_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3161_c41_194e_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3161_c41_194e_return_output := lth2_uxn_opcodes_h_l3161_c41_194e_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output;
     VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_3dfa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue := VAR_lth2_uxn_opcodes_h_l3161_c41_194e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c7_41ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c1_8324] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output;

     -- jmp[uxn_opcodes_h_l3162_c41_e61d] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3162_c41_e61d_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3162_c41_e61d_phase <= VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_phase;
     jmp_uxn_opcodes_h_l3162_c41_e61d_ins <= VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_ins;
     jmp_uxn_opcodes_h_l3162_c41_e61d_pc <= VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_pc;
     jmp_uxn_opcodes_h_l3162_c41_e61d_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_return_output := jmp_uxn_opcodes_h_l3162_c41_e61d_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output;
     VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_8324_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue := VAR_jmp_uxn_opcodes_h_l3162_c41_e61d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c7_3337] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c1_8972] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output;

     -- jmp2[uxn_opcodes_h_l3163_c41_d11f] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3163_c41_d11f_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3163_c41_d11f_phase <= VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_phase;
     jmp2_uxn_opcodes_h_l3163_c41_d11f_ins <= VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_ins;
     jmp2_uxn_opcodes_h_l3163_c41_d11f_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output := jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3337_return_output;
     VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_8972_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue := VAR_jmp2_uxn_opcodes_h_l3163_c41_d11f_return_output;
     -- jcn[uxn_opcodes_h_l3164_c41_4d6c] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3164_c41_4d6c_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3164_c41_4d6c_phase <= VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_phase;
     jcn_uxn_opcodes_h_l3164_c41_4d6c_ins <= VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_ins;
     jcn_uxn_opcodes_h_l3164_c41_4d6c_pc <= VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_pc;
     jcn_uxn_opcodes_h_l3164_c41_4d6c_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output := jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c1_e320] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c7_5343] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_5343_return_output;
     VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_e320_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue := VAR_jcn_uxn_opcodes_h_l3164_c41_4d6c_return_output;
     -- jcn2[uxn_opcodes_h_l3165_c41_eaf0] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3165_c41_eaf0_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3165_c41_eaf0_phase <= VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_phase;
     jcn2_uxn_opcodes_h_l3165_c41_eaf0_ins <= VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_ins;
     jcn2_uxn_opcodes_h_l3165_c41_eaf0_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output := jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c1_b9f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c7_85fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output;
     VAR_jsr_uxn_opcodes_h_l3166_c41_3009_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_b9f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue := VAR_jcn2_uxn_opcodes_h_l3165_c41_eaf0_return_output;
     -- jsr[uxn_opcodes_h_l3166_c41_3009] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3166_c41_3009_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3166_c41_3009_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3166_c41_3009_phase <= VAR_jsr_uxn_opcodes_h_l3166_c41_3009_phase;
     jsr_uxn_opcodes_h_l3166_c41_3009_ins <= VAR_jsr_uxn_opcodes_h_l3166_c41_3009_ins;
     jsr_uxn_opcodes_h_l3166_c41_3009_pc <= VAR_jsr_uxn_opcodes_h_l3166_c41_3009_pc;
     jsr_uxn_opcodes_h_l3166_c41_3009_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3166_c41_3009_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3166_c41_3009_return_output := jsr_uxn_opcodes_h_l3166_c41_3009_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c7_ae33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c1_8cc1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output;
     VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_8cc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue := VAR_jsr_uxn_opcodes_h_l3166_c41_3009_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c7_07ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c1_2dde] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output;

     -- jsr2[uxn_opcodes_h_l3167_c41_fbef] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3167_c41_fbef_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3167_c41_fbef_phase <= VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_phase;
     jsr2_uxn_opcodes_h_l3167_c41_fbef_ins <= VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_ins;
     jsr2_uxn_opcodes_h_l3167_c41_fbef_pc <= VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_pc;
     jsr2_uxn_opcodes_h_l3167_c41_fbef_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output := jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output;
     VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_2dde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue := VAR_jsr2_uxn_opcodes_h_l3167_c41_fbef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c1_b49c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output;

     -- sth[uxn_opcodes_h_l3168_c41_d6cb] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3168_c41_d6cb_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3168_c41_d6cb_phase <= VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_phase;
     sth_uxn_opcodes_h_l3168_c41_d6cb_ins <= VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_ins;
     sth_uxn_opcodes_h_l3168_c41_d6cb_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_return_output := sth_uxn_opcodes_h_l3168_c41_d6cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c7_ff6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output;
     VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_b49c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue := VAR_sth_uxn_opcodes_h_l3168_c41_d6cb_return_output;
     -- sth2[uxn_opcodes_h_l3169_c41_7d14] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3169_c41_7d14_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3169_c41_7d14_phase <= VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_phase;
     sth2_uxn_opcodes_h_l3169_c41_7d14_ins <= VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_ins;
     sth2_uxn_opcodes_h_l3169_c41_7d14_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_return_output := sth2_uxn_opcodes_h_l3169_c41_7d14_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c1_6da2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c7_b372] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_b372_return_output;
     VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_6da2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue := VAR_sth2_uxn_opcodes_h_l3169_c41_7d14_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c1_7879] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c7_8863] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output;

     -- ldz[uxn_opcodes_h_l3170_c41_53e6] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3170_c41_53e6_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3170_c41_53e6_phase <= VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_phase;
     ldz_uxn_opcodes_h_l3170_c41_53e6_ins <= VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_ins;
     ldz_uxn_opcodes_h_l3170_c41_53e6_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_previous_stack_read;
     ldz_uxn_opcodes_h_l3170_c41_53e6_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_return_output := ldz_uxn_opcodes_h_l3170_c41_53e6_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_8863_return_output;
     VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_7879_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue := VAR_ldz_uxn_opcodes_h_l3170_c41_53e6_return_output;
     -- ldz2[uxn_opcodes_h_l3171_c41_2613] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3171_c41_2613_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3171_c41_2613_phase <= VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_phase;
     ldz2_uxn_opcodes_h_l3171_c41_2613_ins <= VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_ins;
     ldz2_uxn_opcodes_h_l3171_c41_2613_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_previous_stack_read;
     ldz2_uxn_opcodes_h_l3171_c41_2613_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_return_output := ldz2_uxn_opcodes_h_l3171_c41_2613_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c1_480a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c7_2f0b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output;
     VAR_stz_uxn_opcodes_h_l3172_c41_9502_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_480a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue := VAR_ldz2_uxn_opcodes_h_l3171_c41_2613_return_output;
     -- stz[uxn_opcodes_h_l3172_c41_9502] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3172_c41_9502_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3172_c41_9502_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3172_c41_9502_phase <= VAR_stz_uxn_opcodes_h_l3172_c41_9502_phase;
     stz_uxn_opcodes_h_l3172_c41_9502_ins <= VAR_stz_uxn_opcodes_h_l3172_c41_9502_ins;
     stz_uxn_opcodes_h_l3172_c41_9502_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3172_c41_9502_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3172_c41_9502_return_output := stz_uxn_opcodes_h_l3172_c41_9502_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c1_d7bb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c7_d6f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output;
     VAR_stz2_uxn_opcodes_h_l3173_c41_af83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_d7bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue := VAR_stz_uxn_opcodes_h_l3172_c41_9502_return_output;
     -- stz2[uxn_opcodes_h_l3173_c41_af83] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3173_c41_af83_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3173_c41_af83_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3173_c41_af83_phase <= VAR_stz2_uxn_opcodes_h_l3173_c41_af83_phase;
     stz2_uxn_opcodes_h_l3173_c41_af83_ins <= VAR_stz2_uxn_opcodes_h_l3173_c41_af83_ins;
     stz2_uxn_opcodes_h_l3173_c41_af83_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3173_c41_af83_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3173_c41_af83_return_output := stz2_uxn_opcodes_h_l3173_c41_af83_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c1_975b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c7_65e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output;
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_975b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue := VAR_stz2_uxn_opcodes_h_l3173_c41_af83_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c7_2ee3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c1_d72f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output;

     -- ldr[uxn_opcodes_h_l3174_c41_a4c3] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3174_c41_a4c3_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3174_c41_a4c3_phase <= VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_phase;
     ldr_uxn_opcodes_h_l3174_c41_a4c3_ins <= VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_ins;
     ldr_uxn_opcodes_h_l3174_c41_a4c3_pc <= VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_pc;
     ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_stack_read;
     ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output := ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output;
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_d72f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue := VAR_ldr_uxn_opcodes_h_l3174_c41_a4c3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c7_040d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output;

     -- ldr2[uxn_opcodes_h_l3175_c41_50cf] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3175_c41_50cf_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3175_c41_50cf_phase <= VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_phase;
     ldr2_uxn_opcodes_h_l3175_c41_50cf_ins <= VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_ins;
     ldr2_uxn_opcodes_h_l3175_c41_50cf_pc <= VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_pc;
     ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_stack_read;
     ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output := ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c1_6121] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_040d_return_output;
     VAR_str1_uxn_opcodes_h_l3176_c41_92df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_6121_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue := VAR_ldr2_uxn_opcodes_h_l3175_c41_50cf_return_output;
     -- str1[uxn_opcodes_h_l3176_c41_92df] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3176_c41_92df_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3176_c41_92df_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3176_c41_92df_phase <= VAR_str1_uxn_opcodes_h_l3176_c41_92df_phase;
     str1_uxn_opcodes_h_l3176_c41_92df_ins <= VAR_str1_uxn_opcodes_h_l3176_c41_92df_ins;
     str1_uxn_opcodes_h_l3176_c41_92df_pc <= VAR_str1_uxn_opcodes_h_l3176_c41_92df_pc;
     str1_uxn_opcodes_h_l3176_c41_92df_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3176_c41_92df_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3176_c41_92df_return_output := str1_uxn_opcodes_h_l3176_c41_92df_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c7_5929] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c1_a03b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_5929_return_output;
     VAR_str2_uxn_opcodes_h_l3177_c41_f00a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_a03b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue := VAR_str1_uxn_opcodes_h_l3176_c41_92df_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c1_9fc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output;

     -- str2[uxn_opcodes_h_l3177_c41_f00a] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3177_c41_f00a_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3177_c41_f00a_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3177_c41_f00a_phase <= VAR_str2_uxn_opcodes_h_l3177_c41_f00a_phase;
     str2_uxn_opcodes_h_l3177_c41_f00a_ins <= VAR_str2_uxn_opcodes_h_l3177_c41_f00a_ins;
     str2_uxn_opcodes_h_l3177_c41_f00a_pc <= VAR_str2_uxn_opcodes_h_l3177_c41_f00a_pc;
     str2_uxn_opcodes_h_l3177_c41_f00a_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3177_c41_f00a_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3177_c41_f00a_return_output := str2_uxn_opcodes_h_l3177_c41_f00a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c7_5f80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output;
     VAR_lda_uxn_opcodes_h_l3178_c41_5c07_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_9fc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue := VAR_str2_uxn_opcodes_h_l3177_c41_f00a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c7_53cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c1_4289] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output;

     -- lda[uxn_opcodes_h_l3178_c41_5c07] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3178_c41_5c07_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3178_c41_5c07_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3178_c41_5c07_phase <= VAR_lda_uxn_opcodes_h_l3178_c41_5c07_phase;
     lda_uxn_opcodes_h_l3178_c41_5c07_ins <= VAR_lda_uxn_opcodes_h_l3178_c41_5c07_ins;
     lda_uxn_opcodes_h_l3178_c41_5c07_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3178_c41_5c07_previous_stack_read;
     lda_uxn_opcodes_h_l3178_c41_5c07_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3178_c41_5c07_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3178_c41_5c07_return_output := lda_uxn_opcodes_h_l3178_c41_5c07_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output;
     VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_4289_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue := VAR_lda_uxn_opcodes_h_l3178_c41_5c07_return_output;
     -- lda2[uxn_opcodes_h_l3179_c41_03cf] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3179_c41_03cf_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3179_c41_03cf_phase <= VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_phase;
     lda2_uxn_opcodes_h_l3179_c41_03cf_ins <= VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_ins;
     lda2_uxn_opcodes_h_l3179_c41_03cf_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_previous_stack_read;
     lda2_uxn_opcodes_h_l3179_c41_03cf_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_return_output := lda2_uxn_opcodes_h_l3179_c41_03cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c7_309c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c1_f47a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_309c_return_output;
     VAR_sta_uxn_opcodes_h_l3180_c41_dffa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_f47a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue := VAR_lda2_uxn_opcodes_h_l3179_c41_03cf_return_output;
     -- sta[uxn_opcodes_h_l3180_c41_dffa] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3180_c41_dffa_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3180_c41_dffa_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3180_c41_dffa_phase <= VAR_sta_uxn_opcodes_h_l3180_c41_dffa_phase;
     sta_uxn_opcodes_h_l3180_c41_dffa_ins <= VAR_sta_uxn_opcodes_h_l3180_c41_dffa_ins;
     sta_uxn_opcodes_h_l3180_c41_dffa_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3180_c41_dffa_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3180_c41_dffa_return_output := sta_uxn_opcodes_h_l3180_c41_dffa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c7_6dfa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c1_e031] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output;
     VAR_sta2_uxn_opcodes_h_l3181_c41_9192_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_e031_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue := VAR_sta_uxn_opcodes_h_l3180_c41_dffa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c7_7c16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output;

     -- sta2[uxn_opcodes_h_l3181_c41_9192] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3181_c41_9192_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3181_c41_9192_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3181_c41_9192_phase <= VAR_sta2_uxn_opcodes_h_l3181_c41_9192_phase;
     sta2_uxn_opcodes_h_l3181_c41_9192_ins <= VAR_sta2_uxn_opcodes_h_l3181_c41_9192_ins;
     sta2_uxn_opcodes_h_l3181_c41_9192_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3181_c41_9192_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3181_c41_9192_return_output := sta2_uxn_opcodes_h_l3181_c41_9192_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c1_3f89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output;
     VAR_dei_uxn_opcodes_h_l3182_c41_39ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_3f89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue := VAR_sta2_uxn_opcodes_h_l3181_c41_9192_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c7_9d5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output;

     -- dei[uxn_opcodes_h_l3182_c41_39ce] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3182_c41_39ce_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3182_c41_39ce_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3182_c41_39ce_phase <= VAR_dei_uxn_opcodes_h_l3182_c41_39ce_phase;
     dei_uxn_opcodes_h_l3182_c41_39ce_ins <= VAR_dei_uxn_opcodes_h_l3182_c41_39ce_ins;
     dei_uxn_opcodes_h_l3182_c41_39ce_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3182_c41_39ce_previous_stack_read;
     dei_uxn_opcodes_h_l3182_c41_39ce_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3182_c41_39ce_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3182_c41_39ce_return_output := dei_uxn_opcodes_h_l3182_c41_39ce_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c1_07fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output;
     VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_07fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue := VAR_dei_uxn_opcodes_h_l3182_c41_39ce_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c7_8652] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c1_2503] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output;

     -- dei2[uxn_opcodes_h_l3183_c41_85a9] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3183_c41_85a9_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3183_c41_85a9_phase <= VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_phase;
     dei2_uxn_opcodes_h_l3183_c41_85a9_ins <= VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_ins;
     dei2_uxn_opcodes_h_l3183_c41_85a9_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_previous_stack_read;
     dei2_uxn_opcodes_h_l3183_c41_85a9_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_return_output := dei2_uxn_opcodes_h_l3183_c41_85a9_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8652_return_output;
     VAR_deo_uxn_opcodes_h_l3184_c41_97f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_2503_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue := VAR_dei2_uxn_opcodes_h_l3183_c41_85a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c1_cd3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output;

     -- deo[uxn_opcodes_h_l3184_c41_97f1] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3184_c41_97f1_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3184_c41_97f1_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3184_c41_97f1_phase <= VAR_deo_uxn_opcodes_h_l3184_c41_97f1_phase;
     deo_uxn_opcodes_h_l3184_c41_97f1_ins <= VAR_deo_uxn_opcodes_h_l3184_c41_97f1_ins;
     deo_uxn_opcodes_h_l3184_c41_97f1_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3184_c41_97f1_previous_stack_read;
     deo_uxn_opcodes_h_l3184_c41_97f1_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3184_c41_97f1_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3184_c41_97f1_return_output := deo_uxn_opcodes_h_l3184_c41_97f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c7_a0e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output;
     VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_cd3b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue := VAR_deo_uxn_opcodes_h_l3184_c41_97f1_return_output;
     -- deo2[uxn_opcodes_h_l3185_c41_3e0b] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3185_c41_3e0b_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3185_c41_3e0b_phase <= VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_phase;
     deo2_uxn_opcodes_h_l3185_c41_3e0b_ins <= VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_ins;
     deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_stack_read;
     deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output := deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c7_e9ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c1_6440] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output;
     VAR_add_uxn_opcodes_h_l3186_c41_d191_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_6440_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue := VAR_deo2_uxn_opcodes_h_l3185_c41_3e0b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c1_51f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output;

     -- add[uxn_opcodes_h_l3186_c41_d191] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3186_c41_d191_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3186_c41_d191_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3186_c41_d191_phase <= VAR_add_uxn_opcodes_h_l3186_c41_d191_phase;
     add_uxn_opcodes_h_l3186_c41_d191_ins <= VAR_add_uxn_opcodes_h_l3186_c41_d191_ins;
     add_uxn_opcodes_h_l3186_c41_d191_previous_stack_read <= VAR_add_uxn_opcodes_h_l3186_c41_d191_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3186_c41_d191_return_output := add_uxn_opcodes_h_l3186_c41_d191_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c7_eac7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output;
     VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_51f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue := VAR_add_uxn_opcodes_h_l3186_c41_d191_return_output;
     -- add2[uxn_opcodes_h_l3187_c41_cbfc] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3187_c41_cbfc_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3187_c41_cbfc_phase <= VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_phase;
     add2_uxn_opcodes_h_l3187_c41_cbfc_ins <= VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_ins;
     add2_uxn_opcodes_h_l3187_c41_cbfc_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_return_output := add2_uxn_opcodes_h_l3187_c41_cbfc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c7_8131] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c1_fdf5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_8131_return_output;
     VAR_sub_uxn_opcodes_h_l3188_c41_75d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_fdf5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue := VAR_add2_uxn_opcodes_h_l3187_c41_cbfc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c7_3bef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output;

     -- sub[uxn_opcodes_h_l3188_c41_75d7] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3188_c41_75d7_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3188_c41_75d7_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3188_c41_75d7_phase <= VAR_sub_uxn_opcodes_h_l3188_c41_75d7_phase;
     sub_uxn_opcodes_h_l3188_c41_75d7_ins <= VAR_sub_uxn_opcodes_h_l3188_c41_75d7_ins;
     sub_uxn_opcodes_h_l3188_c41_75d7_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3188_c41_75d7_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3188_c41_75d7_return_output := sub_uxn_opcodes_h_l3188_c41_75d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c1_cc1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output;
     VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_cc1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue := VAR_sub_uxn_opcodes_h_l3188_c41_75d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c7_c6cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_0b39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output;

     -- sub2[uxn_opcodes_h_l3189_c41_c14b] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3189_c41_c14b_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3189_c41_c14b_phase <= VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_phase;
     sub2_uxn_opcodes_h_l3189_c41_c14b_ins <= VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_ins;
     sub2_uxn_opcodes_h_l3189_c41_c14b_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_return_output := sub2_uxn_opcodes_h_l3189_c41_c14b_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output;
     VAR_mul_uxn_opcodes_h_l3190_c41_8e41_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0b39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue := VAR_sub2_uxn_opcodes_h_l3189_c41_c14b_return_output;
     -- mul[uxn_opcodes_h_l3190_c41_8e41] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3190_c41_8e41_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3190_c41_8e41_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3190_c41_8e41_phase <= VAR_mul_uxn_opcodes_h_l3190_c41_8e41_phase;
     mul_uxn_opcodes_h_l3190_c41_8e41_ins <= VAR_mul_uxn_opcodes_h_l3190_c41_8e41_ins;
     mul_uxn_opcodes_h_l3190_c41_8e41_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3190_c41_8e41_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3190_c41_8e41_return_output := mul_uxn_opcodes_h_l3190_c41_8e41_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c1_cbdc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c7_c3a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output;
     VAR_mul2_uxn_opcodes_h_l3191_c41_a271_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_cbdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue := VAR_mul_uxn_opcodes_h_l3190_c41_8e41_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c1_a579] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output;

     -- mul2[uxn_opcodes_h_l3191_c41_a271] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3191_c41_a271_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3191_c41_a271_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3191_c41_a271_phase <= VAR_mul2_uxn_opcodes_h_l3191_c41_a271_phase;
     mul2_uxn_opcodes_h_l3191_c41_a271_ins <= VAR_mul2_uxn_opcodes_h_l3191_c41_a271_ins;
     mul2_uxn_opcodes_h_l3191_c41_a271_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3191_c41_a271_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3191_c41_a271_return_output := mul2_uxn_opcodes_h_l3191_c41_a271_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c7_de69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_de69_return_output;
     VAR_div_uxn_opcodes_h_l3192_c41_b8bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_a579_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue := VAR_mul2_uxn_opcodes_h_l3191_c41_a271_return_output;
     -- div[uxn_opcodes_h_l3192_c41_b8bf] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3192_c41_b8bf_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3192_c41_b8bf_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3192_c41_b8bf_phase <= VAR_div_uxn_opcodes_h_l3192_c41_b8bf_phase;
     div_uxn_opcodes_h_l3192_c41_b8bf_ins <= VAR_div_uxn_opcodes_h_l3192_c41_b8bf_ins;
     div_uxn_opcodes_h_l3192_c41_b8bf_previous_stack_read <= VAR_div_uxn_opcodes_h_l3192_c41_b8bf_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3192_c41_b8bf_return_output := div_uxn_opcodes_h_l3192_c41_b8bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c1_a331] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c7_f517] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_f517_return_output;
     VAR_div2_uxn_opcodes_h_l3193_c41_eeac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_a331_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue := VAR_div_uxn_opcodes_h_l3192_c41_b8bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c7_13c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output;

     -- div2[uxn_opcodes_h_l3193_c41_eeac] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3193_c41_eeac_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3193_c41_eeac_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3193_c41_eeac_phase <= VAR_div2_uxn_opcodes_h_l3193_c41_eeac_phase;
     div2_uxn_opcodes_h_l3193_c41_eeac_ins <= VAR_div2_uxn_opcodes_h_l3193_c41_eeac_ins;
     div2_uxn_opcodes_h_l3193_c41_eeac_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3193_c41_eeac_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3193_c41_eeac_return_output := div2_uxn_opcodes_h_l3193_c41_eeac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c1_1d62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output;
     VAR_and_uxn_opcodes_h_l3194_c41_08bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_1d62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue := VAR_div2_uxn_opcodes_h_l3193_c41_eeac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c1_923b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output;

     -- and[uxn_opcodes_h_l3194_c41_08bb] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3194_c41_08bb_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3194_c41_08bb_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3194_c41_08bb_phase <= VAR_and_uxn_opcodes_h_l3194_c41_08bb_phase;
     and_uxn_opcodes_h_l3194_c41_08bb_ins <= VAR_and_uxn_opcodes_h_l3194_c41_08bb_ins;
     and_uxn_opcodes_h_l3194_c41_08bb_previous_stack_read <= VAR_and_uxn_opcodes_h_l3194_c41_08bb_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3194_c41_08bb_return_output := and_uxn_opcodes_h_l3194_c41_08bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c7_34de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_34de_return_output;
     VAR_and2_uxn_opcodes_h_l3195_c41_beb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_923b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue := VAR_and_uxn_opcodes_h_l3194_c41_08bb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c1_4af9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c7_38e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output;

     -- and2[uxn_opcodes_h_l3195_c41_beb5] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3195_c41_beb5_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3195_c41_beb5_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3195_c41_beb5_phase <= VAR_and2_uxn_opcodes_h_l3195_c41_beb5_phase;
     and2_uxn_opcodes_h_l3195_c41_beb5_ins <= VAR_and2_uxn_opcodes_h_l3195_c41_beb5_ins;
     and2_uxn_opcodes_h_l3195_c41_beb5_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3195_c41_beb5_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3195_c41_beb5_return_output := and2_uxn_opcodes_h_l3195_c41_beb5_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output;
     VAR_ora_uxn_opcodes_h_l3196_c41_616d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_4af9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue := VAR_and2_uxn_opcodes_h_l3195_c41_beb5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c1_3df8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c7_7809] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output;

     -- ora[uxn_opcodes_h_l3196_c41_616d] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3196_c41_616d_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3196_c41_616d_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3196_c41_616d_phase <= VAR_ora_uxn_opcodes_h_l3196_c41_616d_phase;
     ora_uxn_opcodes_h_l3196_c41_616d_ins <= VAR_ora_uxn_opcodes_h_l3196_c41_616d_ins;
     ora_uxn_opcodes_h_l3196_c41_616d_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3196_c41_616d_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3196_c41_616d_return_output := ora_uxn_opcodes_h_l3196_c41_616d_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_7809_return_output;
     VAR_ora2_uxn_opcodes_h_l3197_c41_e410_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_3df8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue := VAR_ora_uxn_opcodes_h_l3196_c41_616d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c7_f0d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output;

     -- ora2[uxn_opcodes_h_l3197_c41_e410] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3197_c41_e410_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3197_c41_e410_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3197_c41_e410_phase <= VAR_ora2_uxn_opcodes_h_l3197_c41_e410_phase;
     ora2_uxn_opcodes_h_l3197_c41_e410_ins <= VAR_ora2_uxn_opcodes_h_l3197_c41_e410_ins;
     ora2_uxn_opcodes_h_l3197_c41_e410_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3197_c41_e410_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3197_c41_e410_return_output := ora2_uxn_opcodes_h_l3197_c41_e410_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c1_db65] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output;
     VAR_eor_uxn_opcodes_h_l3198_c41_526e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_db65_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue := VAR_ora2_uxn_opcodes_h_l3197_c41_e410_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c7_8429] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c1_677f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output;

     -- eor[uxn_opcodes_h_l3198_c41_526e] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3198_c41_526e_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3198_c41_526e_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3198_c41_526e_phase <= VAR_eor_uxn_opcodes_h_l3198_c41_526e_phase;
     eor_uxn_opcodes_h_l3198_c41_526e_ins <= VAR_eor_uxn_opcodes_h_l3198_c41_526e_ins;
     eor_uxn_opcodes_h_l3198_c41_526e_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3198_c41_526e_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3198_c41_526e_return_output := eor_uxn_opcodes_h_l3198_c41_526e_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_8429_return_output;
     VAR_eor2_uxn_opcodes_h_l3199_c41_0355_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_677f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue := VAR_eor_uxn_opcodes_h_l3198_c41_526e_return_output;
     -- eor2[uxn_opcodes_h_l3199_c41_0355] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3199_c41_0355_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3199_c41_0355_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3199_c41_0355_phase <= VAR_eor2_uxn_opcodes_h_l3199_c41_0355_phase;
     eor2_uxn_opcodes_h_l3199_c41_0355_ins <= VAR_eor2_uxn_opcodes_h_l3199_c41_0355_ins;
     eor2_uxn_opcodes_h_l3199_c41_0355_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3199_c41_0355_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3199_c41_0355_return_output := eor2_uxn_opcodes_h_l3199_c41_0355_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c7_6af5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c1_5424] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output;
     VAR_sft_uxn_opcodes_h_l3200_c41_e30b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_5424_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue := VAR_eor2_uxn_opcodes_h_l3199_c41_0355_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c1_16bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output;

     -- sft[uxn_opcodes_h_l3200_c41_e30b] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3200_c41_e30b_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3200_c41_e30b_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3200_c41_e30b_phase <= VAR_sft_uxn_opcodes_h_l3200_c41_e30b_phase;
     sft_uxn_opcodes_h_l3200_c41_e30b_ins <= VAR_sft_uxn_opcodes_h_l3200_c41_e30b_ins;
     sft_uxn_opcodes_h_l3200_c41_e30b_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3200_c41_e30b_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3200_c41_e30b_return_output := sft_uxn_opcodes_h_l3200_c41_e30b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c1_c857] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_16bf_return_output;
     VAR_sft2_uxn_opcodes_h_l3201_c41_5715_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_c857_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue := VAR_sft_uxn_opcodes_h_l3200_c41_e30b_return_output;
     -- printf_uxn_opcodes_h_l3202_c9_94f2[uxn_opcodes_h_l3202_c9_94f2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_arg0 <= VAR_printf_uxn_opcodes_h_l3202_c9_94f2_uxn_opcodes_h_l3202_c9_94f2_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l3201_c41_5715] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3201_c41_5715_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3201_c41_5715_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3201_c41_5715_phase <= VAR_sft2_uxn_opcodes_h_l3201_c41_5715_phase;
     sft2_uxn_opcodes_h_l3201_c41_5715_ins <= VAR_sft2_uxn_opcodes_h_l3201_c41_5715_ins;
     sft2_uxn_opcodes_h_l3201_c41_5715_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3201_c41_5715_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3201_c41_5715_return_output := sft2_uxn_opcodes_h_l3201_c41_5715_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue := VAR_sft2_uxn_opcodes_h_l3201_c41_5715_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3201_c7_6af5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_cond;
     opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output := opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_6af5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3200_c7_8429] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_cond;
     opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output := opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_8429_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3199_c7_f0d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_cond;
     opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output := opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_f0d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3198_c7_7809] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_cond;
     opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output := opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_7809_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3197_c7_38e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_cond;
     opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output := opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_38e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3196_c7_34de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_cond;
     opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output := opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_34de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3195_c7_13c8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_cond;
     opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output := opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_13c8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3194_c7_f517] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_cond;
     opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output := opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_f517_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3193_c7_de69] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_cond;
     opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output := opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_de69_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3192_c7_c3a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_cond;
     opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output := opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_c3a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3191_c7_c6cb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_cond;
     opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output := opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_c6cb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3190_c7_3bef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_cond;
     opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output := opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_3bef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3189_c7_8131] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_cond;
     opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output := opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_8131_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3188_c7_eac7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_cond;
     opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output := opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_eac7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3187_c7_e9ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_cond;
     opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output := opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_e9ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3186_c7_a0e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_cond;
     opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output := opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_a0e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3185_c7_8652] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_cond;
     opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output := opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8652_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3184_c7_9d5b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_cond;
     opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output := opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_9d5b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3183_c7_7c16] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_cond;
     opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output := opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_7c16_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3182_c7_6dfa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_cond;
     opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output := opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_6dfa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3181_c7_309c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_cond;
     opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output := opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_309c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3180_c7_53cb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_cond;
     opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output := opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_53cb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3179_c7_5f80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_cond;
     opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output := opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_5f80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3178_c7_5929] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_cond;
     opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output := opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_5929_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3177_c7_040d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_cond;
     opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output := opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_040d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3176_c7_2ee3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_cond;
     opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output := opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2ee3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3175_c7_65e1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_cond;
     opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output := opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_65e1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3174_c7_d6f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_cond;
     opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output := opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3173_c7_2f0b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_cond;
     opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output := opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_2f0b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3172_c7_8863] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_cond;
     opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output := opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_8863_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3171_c7_b372] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_cond;
     opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output := opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_b372_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3170_c7_ff6f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_cond;
     opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output := opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_ff6f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3169_c7_07ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_cond;
     opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output := opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_07ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3168_c7_ae33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_cond;
     opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output := opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_ae33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3167_c7_85fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_cond;
     opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output := opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_85fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3166_c7_5343] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_cond;
     opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output := opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_5343_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3165_c7_3337] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_cond;
     opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output := opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3337_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3164_c7_41ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_cond;
     opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output := opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_41ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3163_c7_bde2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_cond;
     opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output := opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_bde2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3162_c7_3952] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_cond;
     opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output := opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_3952_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3161_c7_cea0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_cond;
     opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output := opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cea0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3160_c7_9abc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_cond;
     opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output := opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_9abc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3159_c7_7638] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_cond;
     opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output := opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_7638_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3158_c7_616f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_cond;
     opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output := opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_616f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3157_c7_db23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_cond;
     opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output := opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_db23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3156_c7_c1de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_cond;
     opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output := opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_c1de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3155_c7_8d63] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_cond;
     opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output := opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_8d63_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3154_c7_cf21] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_cond;
     opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output := opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_cf21_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3153_c7_2eba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_cond;
     opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output := opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_2eba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3152_c7_6025] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_cond;
     opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output := opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_6025_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3151_c7_312f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_cond;
     opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output := opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_312f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3150_c7_1b89] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_cond;
     opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output := opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1b89_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3149_c7_04df] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_cond;
     opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output := opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_04df_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3148_c7_e3db] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_cond;
     opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output := opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_e3db_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3147_c7_ac68] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_cond;
     opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output := opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_ac68_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3146_c7_8135] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_cond;
     opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output := opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_8135_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3145_c7_bbfe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_cond;
     opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output := opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_bbfe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3144_c7_8d5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_cond;
     opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output := opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_8d5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3143_c7_141a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_cond;
     opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output := opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_141a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3142_c7_955c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_cond;
     opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output := opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_955c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3141_c7_a04b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_cond;
     opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output := opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_a04b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3140_c7_d9e1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_cond;
     opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output := opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_d9e1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3139_c7_282b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_cond;
     opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output := opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_282b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3138_c7_2f58] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_cond;
     opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output := opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_2f58_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3137_c7_194c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_cond;
     opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output := opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_194c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3136_c7_6f10] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_cond;
     opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output := opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c7_6f10_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3135_c7_fb81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_cond;
     opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output := opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3135_c7_fb81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3134_c7_00c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_cond;
     opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output := opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3134_c7_00c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3133_c7_fe84] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_cond;
     opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output := opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3133_c7_fe84_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3132_c2_6bec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_cond;
     opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output := opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3206_l3208_DUPLICATE_30c2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3206_l3208_DUPLICATE_30c2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3226_c3_da31] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3226_c3_da31_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l3233_c30_c82a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3233_c30_c82a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l3225_c3_3d51] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3225_c3_3d51_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3234_c34_ddfc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3234_c34_ddfc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3213_l3214_l3205_DUPLICATE_9649 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3213_l3214_l3205_DUPLICATE_9649_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3212_c19_c4a0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3212_c19_c4a0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_stack_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l3236_c31_27dd] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3236_c31_27dd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3204_c6_d58d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3204_c6_d58d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3229_c34_23eb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3229_c34_23eb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_pc_updated;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3235_c33_1a6d] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3235_c33_1a6d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l3232_c29_cdf6] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3232_c29_cdf6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.ram_addr;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l3230_c23_85b5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3230_c23_85b5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l3215_c22_f789] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3215_c22_f789_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3213_c82_4f97] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3213_c82_4f97_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3231_c33_486a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3231_c33_486a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3224_c3_06b0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3224_c3_06b0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3237_c32_6824] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3237_c32_6824_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3132_c2_6bec_return_output.is_opc_done;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3206_l3208_DUPLICATE_30c2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3206_l3208_DUPLICATE_30c2_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3226_c3_da31_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3204_c6_d58d_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3204_c6_d58d_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3213_l3214_l3205_DUPLICATE_9649_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3212_c19_c4a0_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3212_c19_c4a0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_device_address := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3224_c3_06b0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3225_c3_3d51_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3213_c82_4f97_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3215_c22_f789_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3215_c22_f789_return_output;
     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3239_l3111_DUPLICATE_e3b5 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3239_l3111_DUPLICATE_e3b5_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3229_c34_23eb_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3230_c23_85b5_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3231_c33_486a_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3232_c29_cdf6_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3233_c30_c82a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3234_c34_ddfc_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3235_c33_1a6d_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3236_c31_27dd_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3237_c32_6824_return_output);

     -- device_ram_update[uxn_opcodes_h_l3223_c26_d54e] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3223_c26_d54e_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3223_c26_d54e_device_address <= VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_device_address;
     device_ram_update_uxn_opcodes_h_l3223_c26_d54e_value <= VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_value;
     device_ram_update_uxn_opcodes_h_l3223_c26_d54e_write_enable <= VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output := device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3206_c4_1282] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output;

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3208_c4_0f7b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l3206_c4_56d2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3206_c4_1282_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3208_c4_f513 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3208_c4_0f7b_return_output)),8);
     VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output;
     VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3205_l3214_l3213_DUPLICATE_ae91_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3239_l3111_DUPLICATE_e3b5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3239_l3111_DUPLICATE_e3b5_return_output;
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_opcodes_h_l3223_c26_d54e_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse := VAR_sp0_uxn_opcodes_h_l3208_c4_f513;
     VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue := VAR_sp1_uxn_opcodes_h_l3206_c4_56d2;
     -- sp0_MUX[uxn_opcodes_h_l3205_c3_d08d] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_cond;
     sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue;
     sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output := sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output;

     -- MUX[uxn_opcodes_h_l3214_c20_aa57] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3214_c20_aa57_cond <= VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_cond;
     MUX_uxn_opcodes_h_l3214_c20_aa57_iftrue <= VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_iftrue;
     MUX_uxn_opcodes_h_l3214_c20_aa57_iffalse <= VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_return_output := MUX_uxn_opcodes_h_l3214_c20_aa57_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3205_c3_d08d] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_cond;
     sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iftrue;
     sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output := sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output;

     -- Submodule level 148
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_right := VAR_MUX_uxn_opcodes_h_l3214_c20_aa57_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3205_c3_d08d_return_output;
     -- sp1_MUX[uxn_opcodes_h_l3204_c2_f292] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3204_c2_f292_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_cond;
     sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue;
     sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output := sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3204_c2_f292] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3204_c2_f292_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_cond;
     sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iftrue;
     sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output := sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3204_c2_f292_return_output;
     VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3204_c2_f292_return_output;
     -- MUX[uxn_opcodes_h_l3213_c19_24e0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3213_c19_24e0_cond <= VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_cond;
     MUX_uxn_opcodes_h_l3213_c19_24e0_iftrue <= VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_iftrue;
     MUX_uxn_opcodes_h_l3213_c19_24e0_iffalse <= VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_return_output := MUX_uxn_opcodes_h_l3213_c19_24e0_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_left := VAR_MUX_uxn_opcodes_h_l3213_c19_24e0_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3213_c19_1b21] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l3213_c2_8c59 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l3213_c19_1b21_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_left := VAR_stack_address_uxn_opcodes_h_l3213_c2_8c59;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3214_c2_b9c0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output;

     -- Submodule level 152
     VAR_stack_address_uxn_opcodes_h_l3214_c2_8a4f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3214_c2_b9c0_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3214_c2_8a4f;
     VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_stack_address := VAR_stack_address_uxn_opcodes_h_l3214_c2_8a4f;
     -- stack_ram_update[uxn_opcodes_h_l3217_c21_9256] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3217_c21_9256_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3217_c21_9256_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_stack_address;
     stack_ram_update_uxn_opcodes_h_l3217_c21_9256_value <= VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_value;
     stack_ram_update_uxn_opcodes_h_l3217_c21_9256_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output := stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3217_c21_9256_return_output;
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
