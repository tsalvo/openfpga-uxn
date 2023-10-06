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
entity eval_opcode_phased_0CLK_3220735c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_3220735c;
architecture arch of eval_opcode_phased_0CLK_3220735c is
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
-- BIN_OP_AND[uxn_opcodes_h_l3328_c10_5a56]
signal BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3328_c10_31e9]
signal BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3328_c41_d027]
signal BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3328_c57_8c98]
signal CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3328_c10_cbb9]
signal MUX_uxn_opcodes_h_l3328_c10_cbb9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3328_c10_cbb9_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3328_c10_cbb9_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3329_c18_b84d]
signal BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3329_c18_3092]
signal BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3329_c18_ec96]
signal MUX_uxn_opcodes_h_l3329_c18_ec96_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3329_c18_ec96_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3329_c18_ec96_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3329_c18_ec96_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3331_c2_e6b8[uxn_opcodes_h_l3331_c2_e6b8]
signal printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3333_c6_1ffa]
signal BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c7_d569]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3333_c2_e1e6]
signal opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3334_c11_e511]
signal BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c1_cc49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c7_7ad6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3334_c7_d569]
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3334_c41_255d]
signal jci_uxn_opcodes_h_l3334_c41_255d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3334_c41_255d_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3334_c41_255d_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3334_c41_255d_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3334_c41_255d_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3334_c41_255d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3335_c11_51f3]
signal BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c1_0016]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c7_b567]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3335_c7_7ad6]
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3335_c41_2244]
signal jmi_uxn_opcodes_h_l3335_c41_2244_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3335_c41_2244_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3335_c41_2244_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3335_c41_2244_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3335_c41_2244_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3336_c11_4d96]
signal BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c1_c77f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c7_e43c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3336_c7_b567]
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3336_c41_d14a]
signal jsi_uxn_opcodes_h_l3336_c41_d14a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3336_c41_d14a_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3336_c41_d14a_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3336_c41_d14a_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3336_c41_d14a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3337_c11_1dc6]
signal BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c1_98c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c7_07cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3337_c7_e43c]
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3337_c41_1a1c]
signal lit_uxn_opcodes_h_l3337_c41_1a1c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3337_c41_1a1c_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3337_c41_1a1c_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3337_c41_1a1c_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3337_c41_1a1c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3338_c11_b1eb]
signal BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c1_ef7f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c7_21d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3338_c7_07cc]
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3338_c41_e8ad]
signal lit2_uxn_opcodes_h_l3338_c41_e8ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3338_c41_e8ad_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3338_c41_e8ad_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3338_c41_e8ad_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3339_c11_9565]
signal BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c1_aef0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c7_ef2e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3339_c7_21d1]
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3339_c41_8576]
signal lit_uxn_opcodes_h_l3339_c41_8576_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3339_c41_8576_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3339_c41_8576_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3339_c41_8576_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3339_c41_8576_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3340_c11_e489]
signal BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c1_3696]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c7_3b56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3340_c7_ef2e]
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3340_c41_a236]
signal lit2_uxn_opcodes_h_l3340_c41_a236_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3340_c41_a236_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3340_c41_a236_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3340_c41_a236_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3340_c41_a236_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3341_c11_096c]
signal BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c1_c3e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c7_2284]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3341_c7_3b56]
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3341_c41_3785]
signal inc_uxn_opcodes_h_l3341_c41_3785_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3341_c41_3785_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3341_c41_3785_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3341_c41_3785_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3341_c41_3785_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3342_c11_1bbf]
signal BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c1_99c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c7_0a0b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3342_c7_2284]
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3342_c41_b664]
signal inc2_uxn_opcodes_h_l3342_c41_b664_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3342_c41_b664_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3342_c41_b664_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3342_c41_b664_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3342_c41_b664_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3343_c11_043d]
signal BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c1_4a3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c7_56d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3343_c7_0a0b]
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3343_c41_e5d2]
signal pop_uxn_opcodes_h_l3343_c41_e5d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3343_c41_e5d2_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3343_c41_e5d2_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3343_c41_e5d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3344_c11_bced]
signal BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c1_dd8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c7_91d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3344_c7_56d4]
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3344_c41_9c27]
signal pop2_uxn_opcodes_h_l3344_c41_9c27_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3344_c41_9c27_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3344_c41_9c27_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3344_c41_9c27_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3345_c11_d435]
signal BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c1_34a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c7_baf0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3345_c7_91d1]
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3345_c41_c95c]
signal nip_uxn_opcodes_h_l3345_c41_c95c_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3345_c41_c95c_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3345_c41_c95c_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3345_c41_c95c_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3345_c41_c95c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3346_c11_04c9]
signal BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c1_4a03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c7_489e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3346_c7_baf0]
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3346_c41_4464]
signal nip2_uxn_opcodes_h_l3346_c41_4464_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3346_c41_4464_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3346_c41_4464_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3346_c41_4464_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3346_c41_4464_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3347_c11_3f7a]
signal BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c1_d2fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c7_c22e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3347_c7_489e]
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3347_c41_d898]
signal swp_uxn_opcodes_h_l3347_c41_d898_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3347_c41_d898_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3347_c41_d898_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3347_c41_d898_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3347_c41_d898_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3348_c11_6c9e]
signal BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c1_e940]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c7_291c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3348_c7_c22e]
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3348_c41_4296]
signal swp2_uxn_opcodes_h_l3348_c41_4296_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3348_c41_4296_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3348_c41_4296_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3348_c41_4296_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3348_c41_4296_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3349_c11_058d]
signal BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c1_9251]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c7_04e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3349_c7_291c]
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3349_c41_720d]
signal rot_uxn_opcodes_h_l3349_c41_720d_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3349_c41_720d_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3349_c41_720d_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3349_c41_720d_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3349_c41_720d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3350_c11_65be]
signal BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c1_c94b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c7_4d65]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3350_c7_04e8]
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3350_c41_56ae]
signal rot2_uxn_opcodes_h_l3350_c41_56ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3350_c41_56ae_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3350_c41_56ae_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3350_c41_56ae_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3350_c41_56ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3351_c11_fba3]
signal BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c1_d844]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c7_0056]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3351_c7_4d65]
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3351_c41_f088]
signal dup_uxn_opcodes_h_l3351_c41_f088_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3351_c41_f088_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3351_c41_f088_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3351_c41_f088_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3351_c41_f088_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3352_c11_ef8c]
signal BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c1_6635]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c7_1955]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3352_c7_0056]
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3352_c41_6f4f]
signal dup2_uxn_opcodes_h_l3352_c41_6f4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3352_c41_6f4f_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3352_c41_6f4f_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3352_c41_6f4f_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3353_c11_75ca]
signal BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c1_89db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c7_7591]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3353_c7_1955]
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3353_c41_7f51]
signal ovr_uxn_opcodes_h_l3353_c41_7f51_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3353_c41_7f51_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3353_c41_7f51_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3353_c41_7f51_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3353_c41_7f51_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3354_c11_a6cd]
signal BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c1_506b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3355_c7_f840]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3354_c7_7591]
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3354_c41_3006]
signal ovr2_uxn_opcodes_h_l3354_c41_3006_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3354_c41_3006_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3354_c41_3006_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3354_c41_3006_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3354_c41_3006_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3355_c11_635e]
signal BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3355_c1_1a53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3356_c7_e29e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3355_c7_f840]
signal opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3355_c41_d0da]
signal equ_uxn_opcodes_h_l3355_c41_d0da_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3355_c41_d0da_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3355_c41_d0da_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3355_c41_d0da_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3355_c41_d0da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3356_c11_e0f1]
signal BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3356_c1_c710]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3357_c7_775e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3356_c7_e29e]
signal opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3356_c41_52fa]
signal equ2_uxn_opcodes_h_l3356_c41_52fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3356_c41_52fa_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3356_c41_52fa_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3356_c41_52fa_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3356_c41_52fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3357_c11_db4e]
signal BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3357_c1_48ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3358_c7_467d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3357_c7_775e]
signal opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3357_c41_ca08]
signal neq_uxn_opcodes_h_l3357_c41_ca08_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3357_c41_ca08_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3357_c41_ca08_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3357_c41_ca08_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3357_c41_ca08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3358_c11_9292]
signal BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3358_c1_55d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3359_c7_a139]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3358_c7_467d]
signal opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3358_c41_7fc2]
signal neq2_uxn_opcodes_h_l3358_c41_7fc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3358_c41_7fc2_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3358_c41_7fc2_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3358_c41_7fc2_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3359_c11_a063]
signal BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3359_c1_19e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3360_c7_fa68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3359_c7_a139]
signal opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3359_c41_65f1]
signal gth_uxn_opcodes_h_l3359_c41_65f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3359_c41_65f1_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3359_c41_65f1_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3359_c41_65f1_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3359_c41_65f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3360_c11_a075]
signal BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3360_c1_f8da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3361_c7_446d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3360_c7_fa68]
signal opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3360_c41_9f17]
signal gth2_uxn_opcodes_h_l3360_c41_9f17_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3360_c41_9f17_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3360_c41_9f17_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3360_c41_9f17_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3360_c41_9f17_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3361_c11_60f3]
signal BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3361_c1_ee8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3362_c7_0421]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3361_c7_446d]
signal opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3361_c41_715d]
signal lth_uxn_opcodes_h_l3361_c41_715d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3361_c41_715d_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3361_c41_715d_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3361_c41_715d_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3361_c41_715d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3362_c11_f9d2]
signal BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3362_c1_da07]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3363_c7_93ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3362_c7_0421]
signal opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3362_c41_b16e]
signal lth2_uxn_opcodes_h_l3362_c41_b16e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3362_c41_b16e_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3362_c41_b16e_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3362_c41_b16e_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3362_c41_b16e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3363_c11_0202]
signal BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3363_c1_e0e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3364_c7_cd4c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3363_c7_93ac]
signal opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3363_c41_ead6]
signal jmp_uxn_opcodes_h_l3363_c41_ead6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3363_c41_ead6_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3363_c41_ead6_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3363_c41_ead6_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3363_c41_ead6_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3363_c41_ead6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3364_c11_1822]
signal BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3364_c1_75b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3365_c7_2ebf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3364_c7_cd4c]
signal opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3364_c41_78bc]
signal jmp2_uxn_opcodes_h_l3364_c41_78bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3364_c41_78bc_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3364_c41_78bc_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3364_c41_78bc_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3365_c11_1787]
signal BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3365_c1_bf1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3366_c7_0418]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3365_c7_2ebf]
signal opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3365_c41_f3b5]
signal jcn_uxn_opcodes_h_l3365_c41_f3b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3365_c41_f3b5_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3365_c41_f3b5_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3365_c41_f3b5_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3365_c41_f3b5_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3366_c11_b924]
signal BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3366_c1_1145]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3367_c7_bc72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3366_c7_0418]
signal opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3366_c41_35c4]
signal jcn2_uxn_opcodes_h_l3366_c41_35c4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3366_c41_35c4_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3366_c41_35c4_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3366_c41_35c4_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3367_c11_3447]
signal BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3367_c1_c449]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3368_c7_ac1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3367_c7_bc72]
signal opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3367_c41_fbc2]
signal jsr_uxn_opcodes_h_l3367_c41_fbc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3367_c41_fbc2_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3367_c41_fbc2_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3367_c41_fbc2_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3367_c41_fbc2_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3368_c11_f383]
signal BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3368_c1_1516]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3369_c7_8412]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3368_c7_ac1a]
signal opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3368_c41_2ee2]
signal jsr2_uxn_opcodes_h_l3368_c41_2ee2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3368_c41_2ee2_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3368_c41_2ee2_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3368_c41_2ee2_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3368_c41_2ee2_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3369_c11_33a3]
signal BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3369_c1_e38f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3370_c7_2c71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3369_c7_8412]
signal opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3369_c41_d1d5]
signal sth_uxn_opcodes_h_l3369_c41_d1d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3369_c41_d1d5_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3369_c41_d1d5_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3369_c41_d1d5_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3369_c41_d1d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3370_c11_4bcb]
signal BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3370_c1_ffbc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3371_c7_7fa4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3370_c7_2c71]
signal opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3370_c41_4a6b]
signal sth2_uxn_opcodes_h_l3370_c41_4a6b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3370_c41_4a6b_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3370_c41_4a6b_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3370_c41_4a6b_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3371_c11_b200]
signal BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3371_c1_1d2c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3372_c7_0d4a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3371_c7_7fa4]
signal opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3371_c41_bb2f]
signal ldz_uxn_opcodes_h_l3371_c41_bb2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3371_c41_bb2f_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3371_c41_bb2f_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3372_c11_d864]
signal BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3372_c1_a313]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3373_c7_7bf5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3372_c7_0d4a]
signal opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3372_c41_da99]
signal ldz2_uxn_opcodes_h_l3372_c41_da99_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3372_c41_da99_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3372_c41_da99_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3372_c41_da99_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3372_c41_da99_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3372_c41_da99_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3373_c11_bf06]
signal BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3373_c1_52a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3374_c7_2840]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3373_c7_7bf5]
signal opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3373_c41_818b]
signal stz_uxn_opcodes_h_l3373_c41_818b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3373_c41_818b_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3373_c41_818b_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3373_c41_818b_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3373_c41_818b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3374_c11_13f0]
signal BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3374_c1_4d38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3375_c7_8894]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3374_c7_2840]
signal opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3374_c41_73fa]
signal stz2_uxn_opcodes_h_l3374_c41_73fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3374_c41_73fa_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3374_c41_73fa_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3374_c41_73fa_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3374_c41_73fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3375_c11_af7a]
signal BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3375_c1_504b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3376_c7_ac60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3375_c7_8894]
signal opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3375_c41_81b4]
signal ldr_uxn_opcodes_h_l3375_c41_81b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3375_c41_81b4_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3375_c41_81b4_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3375_c41_81b4_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3375_c41_81b4_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3375_c41_81b4_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3375_c41_81b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3376_c11_c9e7]
signal BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3376_c1_81f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3377_c7_a59e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3376_c7_ac60]
signal opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3376_c41_7cba]
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3377_c11_f68d]
signal BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3377_c1_5d00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3378_c7_8e25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3377_c7_a59e]
signal opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3377_c41_92a5]
signal str1_uxn_opcodes_h_l3377_c41_92a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3377_c41_92a5_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3377_c41_92a5_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3377_c41_92a5_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3377_c41_92a5_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3377_c41_92a5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3378_c11_8d7d]
signal BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3378_c1_29d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3379_c7_c196]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3378_c7_8e25]
signal opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3378_c41_8eb6]
signal str2_uxn_opcodes_h_l3378_c41_8eb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3378_c41_8eb6_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3378_c41_8eb6_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3378_c41_8eb6_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3378_c41_8eb6_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3378_c41_8eb6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3379_c11_ecef]
signal BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3379_c1_d12c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3380_c7_6d84]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3379_c7_c196]
signal opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3379_c41_e7d6]
signal lda_uxn_opcodes_h_l3379_c41_e7d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3379_c41_e7d6_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3379_c41_e7d6_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3379_c41_e7d6_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3379_c41_e7d6_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3379_c41_e7d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3380_c11_a9c9]
signal BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3380_c1_0fc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3381_c7_e017]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3380_c7_6d84]
signal opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3380_c41_442b]
signal lda2_uxn_opcodes_h_l3380_c41_442b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3380_c41_442b_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3380_c41_442b_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3380_c41_442b_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3380_c41_442b_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3380_c41_442b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3381_c11_c8b6]
signal BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3381_c1_f05d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3382_c7_48cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3381_c7_e017]
signal opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3381_c41_3660]
signal sta_uxn_opcodes_h_l3381_c41_3660_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3381_c41_3660_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3381_c41_3660_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3381_c41_3660_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3381_c41_3660_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3382_c11_2cac]
signal BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3382_c1_8208]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3383_c7_7e69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3382_c7_48cf]
signal opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3382_c41_0032]
signal sta2_uxn_opcodes_h_l3382_c41_0032_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3382_c41_0032_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3382_c41_0032_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3382_c41_0032_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3382_c41_0032_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3383_c11_ff3c]
signal BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3383_c1_b087]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3384_c7_c41b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3383_c7_7e69]
signal opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3383_c41_5e52]
signal dei_uxn_opcodes_h_l3383_c41_5e52_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3383_c41_5e52_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3383_c41_5e52_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3383_c41_5e52_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3383_c41_5e52_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3383_c41_5e52_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3384_c11_e5d0]
signal BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3384_c1_5d16]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3385_c7_1e36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3384_c7_c41b]
signal opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3384_c41_4929]
signal dei2_uxn_opcodes_h_l3384_c41_4929_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3384_c41_4929_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3384_c41_4929_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3384_c41_4929_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3384_c41_4929_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3384_c41_4929_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3385_c11_9ea8]
signal BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3385_c1_fe49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3386_c7_780c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3385_c7_1e36]
signal opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3385_c41_90b5]
signal deo_uxn_opcodes_h_l3385_c41_90b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3385_c41_90b5_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3385_c41_90b5_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3385_c41_90b5_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3385_c41_90b5_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3385_c41_90b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3386_c11_4575]
signal BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3386_c1_6253]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3387_c7_3a9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3386_c7_780c]
signal opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3386_c41_04d1]
signal deo2_uxn_opcodes_h_l3386_c41_04d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3386_c41_04d1_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3386_c41_04d1_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3386_c41_04d1_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3386_c41_04d1_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3386_c41_04d1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3387_c11_209a]
signal BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3387_c1_cfaf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3388_c7_3294]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3387_c7_3a9c]
signal opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3387_c41_7e0f]
signal add_uxn_opcodes_h_l3387_c41_7e0f_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3387_c41_7e0f_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3387_c41_7e0f_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3387_c41_7e0f_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3387_c41_7e0f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3388_c11_0fec]
signal BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3388_c1_8b08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3389_c7_609f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3388_c7_3294]
signal opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3388_c41_5db5]
signal add2_uxn_opcodes_h_l3388_c41_5db5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3388_c41_5db5_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3388_c41_5db5_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3388_c41_5db5_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3388_c41_5db5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3389_c11_1756]
signal BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3389_c1_6d5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3390_c7_4004]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3389_c7_609f]
signal opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3389_c41_5f15]
signal sub_uxn_opcodes_h_l3389_c41_5f15_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3389_c41_5f15_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3389_c41_5f15_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3389_c41_5f15_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3389_c41_5f15_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3390_c11_86b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3390_c1_f4a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3391_c7_3a6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3390_c7_4004]
signal opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3390_c41_ebe4]
signal sub2_uxn_opcodes_h_l3390_c41_ebe4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3390_c41_ebe4_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3390_c41_ebe4_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3390_c41_ebe4_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3391_c11_2b35]
signal BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3391_c1_992c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3392_c7_5500]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3391_c7_3a6a]
signal opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3391_c41_5337]
signal mul_uxn_opcodes_h_l3391_c41_5337_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3391_c41_5337_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3391_c41_5337_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3391_c41_5337_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3391_c41_5337_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3392_c11_fcc0]
signal BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3392_c1_0184]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3393_c7_0ffc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3392_c7_5500]
signal opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3392_c41_7c7b]
signal mul2_uxn_opcodes_h_l3392_c41_7c7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3392_c41_7c7b_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3392_c41_7c7b_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3392_c41_7c7b_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3393_c11_c37d]
signal BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3393_c1_d459]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3394_c7_f296]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3393_c7_0ffc]
signal opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3393_c41_e4ad]
signal div_uxn_opcodes_h_l3393_c41_e4ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3393_c41_e4ad_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3393_c41_e4ad_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3393_c41_e4ad_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3393_c41_e4ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3394_c11_9f5e]
signal BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3394_c1_1e52]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3395_c7_b33f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3394_c7_f296]
signal opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3394_c41_1ac6]
signal div2_uxn_opcodes_h_l3394_c41_1ac6_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3394_c41_1ac6_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3394_c41_1ac6_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3394_c41_1ac6_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3394_c41_1ac6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3395_c11_a595]
signal BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3395_c1_c4e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3396_c7_2231]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3395_c7_b33f]
signal opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3395_c41_d132]
signal and_uxn_opcodes_h_l3395_c41_d132_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3395_c41_d132_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3395_c41_d132_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3395_c41_d132_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3395_c41_d132_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3396_c11_604f]
signal BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3396_c1_b4ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3397_c7_06c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3396_c7_2231]
signal opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3396_c41_3895]
signal and2_uxn_opcodes_h_l3396_c41_3895_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3396_c41_3895_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3396_c41_3895_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3396_c41_3895_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3396_c41_3895_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3397_c11_777a]
signal BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3397_c1_1d76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3398_c7_d14f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3397_c7_06c9]
signal opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3397_c41_a1a1]
signal ora_uxn_opcodes_h_l3397_c41_a1a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3397_c41_a1a1_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3397_c41_a1a1_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3397_c41_a1a1_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3397_c41_a1a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3398_c11_aa3a]
signal BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3398_c1_4e1e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3399_c7_b46e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3398_c7_d14f]
signal opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3398_c41_39d9]
signal ora2_uxn_opcodes_h_l3398_c41_39d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3398_c41_39d9_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3398_c41_39d9_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3398_c41_39d9_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3398_c41_39d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3399_c11_cafa]
signal BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3399_c1_c21e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3400_c7_0788]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3399_c7_b46e]
signal opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3399_c41_933e]
signal eor_uxn_opcodes_h_l3399_c41_933e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3399_c41_933e_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3399_c41_933e_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3399_c41_933e_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3399_c41_933e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3400_c11_eeb3]
signal BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3400_c1_9886]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3401_c7_fe31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3400_c7_0788]
signal opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3400_c41_1adb]
signal eor2_uxn_opcodes_h_l3400_c41_1adb_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3400_c41_1adb_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3400_c41_1adb_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3400_c41_1adb_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3400_c41_1adb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3401_c11_b0b8]
signal BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3401_c1_0f83]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3402_c7_8990]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3401_c7_fe31]
signal opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3401_c41_6ea8]
signal sft_uxn_opcodes_h_l3401_c41_6ea8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3401_c41_6ea8_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3401_c41_6ea8_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3401_c41_6ea8_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3401_c41_6ea8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3402_c11_2ebd]
signal BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3402_c1_e54d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3403_c1_a9b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3402_c7_8990]
signal opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3402_c41_b730]
signal sft2_uxn_opcodes_h_l3402_c41_b730_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3402_c41_b730_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3402_c41_b730_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3402_c41_b730_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3402_c41_b730_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3403_c9_e078[uxn_opcodes_h_l3403_c9_e078]
signal printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3405_c2_8e6c]
signal sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3405_c2_8e6c]
signal sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3406_c3_770b]
signal sp0_MUX_uxn_opcodes_h_l3406_c3_770b_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3406_c3_770b]
signal sp1_MUX_uxn_opcodes_h_l3406_c3_770b_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3407_c4_309b]
signal BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3409_c4_5c85]
signal BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3415_c19_712f]
signal MUX_uxn_opcodes_h_l3415_c19_712f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3415_c19_712f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3415_c19_712f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3415_c19_712f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3415_c19_b70c]
signal BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3418_c1_2f03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3427_c1_baf2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l3418_c2_13ea]
signal stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l3419_c22_cfd9]
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l3428_c22_d9bb]
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l3438_c26_64a9]
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56
BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_left,
BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_right,
BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9
BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_left,
BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_right,
BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027
BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_left,
BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_right,
BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98
CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_x,
CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output);

-- MUX_uxn_opcodes_h_l3328_c10_cbb9
MUX_uxn_opcodes_h_l3328_c10_cbb9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3328_c10_cbb9_cond,
MUX_uxn_opcodes_h_l3328_c10_cbb9_iftrue,
MUX_uxn_opcodes_h_l3328_c10_cbb9_iffalse,
MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d
BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_left,
BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_right,
BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092
BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_left,
BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_right,
BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output);

-- MUX_uxn_opcodes_h_l3329_c18_ec96
MUX_uxn_opcodes_h_l3329_c18_ec96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3329_c18_ec96_cond,
MUX_uxn_opcodes_h_l3329_c18_ec96_iftrue,
MUX_uxn_opcodes_h_l3329_c18_ec96_iffalse,
MUX_uxn_opcodes_h_l3329_c18_ec96_return_output);

-- printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8
printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8 : entity work.printf_uxn_opcodes_h_l3331_c2_e6b8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg0,
printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg1,
printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa
BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_left,
BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_right,
BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6
opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_cond,
opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_left,
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_right,
BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3334_c7_d569
opc_result_MUX_uxn_opcodes_h_l3334_c7_d569 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_cond,
opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue,
opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse,
opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output);

-- jci_uxn_opcodes_h_l3334_c41_255d
jci_uxn_opcodes_h_l3334_c41_255d : entity work.jci_0CLK_bbbe252c port map (
clk,
jci_uxn_opcodes_h_l3334_c41_255d_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3334_c41_255d_phase,
jci_uxn_opcodes_h_l3334_c41_255d_pc,
jci_uxn_opcodes_h_l3334_c41_255d_previous_stack_read,
jci_uxn_opcodes_h_l3334_c41_255d_previous_ram_read,
jci_uxn_opcodes_h_l3334_c41_255d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_left,
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_right,
BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6
opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond,
opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output);

-- jmi_uxn_opcodes_h_l3335_c41_2244
jmi_uxn_opcodes_h_l3335_c41_2244 : entity work.jmi_0CLK_b30fc8f1 port map (
clk,
jmi_uxn_opcodes_h_l3335_c41_2244_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3335_c41_2244_phase,
jmi_uxn_opcodes_h_l3335_c41_2244_pc,
jmi_uxn_opcodes_h_l3335_c41_2244_previous_ram_read,
jmi_uxn_opcodes_h_l3335_c41_2244_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_left,
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_right,
BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3336_c7_b567
opc_result_MUX_uxn_opcodes_h_l3336_c7_b567 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_cond,
opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue,
opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse,
opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output);

-- jsi_uxn_opcodes_h_l3336_c41_d14a
jsi_uxn_opcodes_h_l3336_c41_d14a : entity work.jsi_0CLK_a05d6369 port map (
clk,
jsi_uxn_opcodes_h_l3336_c41_d14a_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3336_c41_d14a_phase,
jsi_uxn_opcodes_h_l3336_c41_d14a_pc,
jsi_uxn_opcodes_h_l3336_c41_d14a_previous_ram_read,
jsi_uxn_opcodes_h_l3336_c41_d14a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_left,
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_right,
BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c
opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_cond,
opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output);

-- lit_uxn_opcodes_h_l3337_c41_1a1c
lit_uxn_opcodes_h_l3337_c41_1a1c : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l3337_c41_1a1c_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3337_c41_1a1c_phase,
lit_uxn_opcodes_h_l3337_c41_1a1c_pc,
lit_uxn_opcodes_h_l3337_c41_1a1c_previous_ram_read,
lit_uxn_opcodes_h_l3337_c41_1a1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_left,
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_right,
BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc
opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_cond,
opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output);

-- lit2_uxn_opcodes_h_l3338_c41_e8ad
lit2_uxn_opcodes_h_l3338_c41_e8ad : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l3338_c41_e8ad_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3338_c41_e8ad_phase,
lit2_uxn_opcodes_h_l3338_c41_e8ad_pc,
lit2_uxn_opcodes_h_l3338_c41_e8ad_previous_ram_read,
lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_left,
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_right,
BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1
opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_cond,
opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output);

-- lit_uxn_opcodes_h_l3339_c41_8576
lit_uxn_opcodes_h_l3339_c41_8576 : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l3339_c41_8576_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3339_c41_8576_phase,
lit_uxn_opcodes_h_l3339_c41_8576_pc,
lit_uxn_opcodes_h_l3339_c41_8576_previous_ram_read,
lit_uxn_opcodes_h_l3339_c41_8576_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_left,
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_right,
BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e
opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond,
opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output);

-- lit2_uxn_opcodes_h_l3340_c41_a236
lit2_uxn_opcodes_h_l3340_c41_a236 : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l3340_c41_a236_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3340_c41_a236_phase,
lit2_uxn_opcodes_h_l3340_c41_a236_pc,
lit2_uxn_opcodes_h_l3340_c41_a236_previous_ram_read,
lit2_uxn_opcodes_h_l3340_c41_a236_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_left,
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_right,
BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56
opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_cond,
opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue,
opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse,
opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output);

-- inc_uxn_opcodes_h_l3341_c41_3785
inc_uxn_opcodes_h_l3341_c41_3785 : entity work.inc_0CLK_66ba3dc0 port map (
clk,
inc_uxn_opcodes_h_l3341_c41_3785_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3341_c41_3785_phase,
inc_uxn_opcodes_h_l3341_c41_3785_ins,
inc_uxn_opcodes_h_l3341_c41_3785_previous_stack_read,
inc_uxn_opcodes_h_l3341_c41_3785_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_left,
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_right,
BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3342_c7_2284
opc_result_MUX_uxn_opcodes_h_l3342_c7_2284 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_cond,
opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue,
opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse,
opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output);

-- inc2_uxn_opcodes_h_l3342_c41_b664
inc2_uxn_opcodes_h_l3342_c41_b664 : entity work.inc2_0CLK_26f67814 port map (
clk,
inc2_uxn_opcodes_h_l3342_c41_b664_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3342_c41_b664_phase,
inc2_uxn_opcodes_h_l3342_c41_b664_ins,
inc2_uxn_opcodes_h_l3342_c41_b664_previous_stack_read,
inc2_uxn_opcodes_h_l3342_c41_b664_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_left,
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_right,
BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b
opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond,
opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output);

-- pop_uxn_opcodes_h_l3343_c41_e5d2
pop_uxn_opcodes_h_l3343_c41_e5d2 : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l3343_c41_e5d2_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3343_c41_e5d2_phase,
pop_uxn_opcodes_h_l3343_c41_e5d2_ins,
pop_uxn_opcodes_h_l3343_c41_e5d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_left,
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_right,
BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4
opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_cond,
opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output);

-- pop2_uxn_opcodes_h_l3344_c41_9c27
pop2_uxn_opcodes_h_l3344_c41_9c27 : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l3344_c41_9c27_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3344_c41_9c27_phase,
pop2_uxn_opcodes_h_l3344_c41_9c27_ins,
pop2_uxn_opcodes_h_l3344_c41_9c27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_left,
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_right,
BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1
opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_cond,
opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output);

-- nip_uxn_opcodes_h_l3345_c41_c95c
nip_uxn_opcodes_h_l3345_c41_c95c : entity work.nip_0CLK_6481cb28 port map (
clk,
nip_uxn_opcodes_h_l3345_c41_c95c_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3345_c41_c95c_phase,
nip_uxn_opcodes_h_l3345_c41_c95c_ins,
nip_uxn_opcodes_h_l3345_c41_c95c_previous_stack_read,
nip_uxn_opcodes_h_l3345_c41_c95c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_left,
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_right,
BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0
opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_cond,
opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output);

-- nip2_uxn_opcodes_h_l3346_c41_4464
nip2_uxn_opcodes_h_l3346_c41_4464 : entity work.nip2_0CLK_50a1b8d0 port map (
clk,
nip2_uxn_opcodes_h_l3346_c41_4464_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3346_c41_4464_phase,
nip2_uxn_opcodes_h_l3346_c41_4464_ins,
nip2_uxn_opcodes_h_l3346_c41_4464_previous_stack_read,
nip2_uxn_opcodes_h_l3346_c41_4464_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_left,
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_right,
BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3347_c7_489e
opc_result_MUX_uxn_opcodes_h_l3347_c7_489e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_cond,
opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output);

-- swp_uxn_opcodes_h_l3347_c41_d898
swp_uxn_opcodes_h_l3347_c41_d898 : entity work.swp_0CLK_90fc2573 port map (
clk,
swp_uxn_opcodes_h_l3347_c41_d898_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3347_c41_d898_phase,
swp_uxn_opcodes_h_l3347_c41_d898_ins,
swp_uxn_opcodes_h_l3347_c41_d898_previous_stack_read,
swp_uxn_opcodes_h_l3347_c41_d898_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_left,
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_right,
BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e
opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_cond,
opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output);

-- swp2_uxn_opcodes_h_l3348_c41_4296
swp2_uxn_opcodes_h_l3348_c41_4296 : entity work.swp2_0CLK_04f7be23 port map (
clk,
swp2_uxn_opcodes_h_l3348_c41_4296_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3348_c41_4296_phase,
swp2_uxn_opcodes_h_l3348_c41_4296_ins,
swp2_uxn_opcodes_h_l3348_c41_4296_previous_stack_read,
swp2_uxn_opcodes_h_l3348_c41_4296_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_left,
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_right,
BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3349_c7_291c
opc_result_MUX_uxn_opcodes_h_l3349_c7_291c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_cond,
opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output);

-- rot_uxn_opcodes_h_l3349_c41_720d
rot_uxn_opcodes_h_l3349_c41_720d : entity work.rot_0CLK_9c3c4e32 port map (
clk,
rot_uxn_opcodes_h_l3349_c41_720d_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3349_c41_720d_phase,
rot_uxn_opcodes_h_l3349_c41_720d_ins,
rot_uxn_opcodes_h_l3349_c41_720d_previous_stack_read,
rot_uxn_opcodes_h_l3349_c41_720d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_left,
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_right,
BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8
opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_cond,
opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output);

-- rot2_uxn_opcodes_h_l3350_c41_56ae
rot2_uxn_opcodes_h_l3350_c41_56ae : entity work.rot2_0CLK_79985188 port map (
clk,
rot2_uxn_opcodes_h_l3350_c41_56ae_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3350_c41_56ae_phase,
rot2_uxn_opcodes_h_l3350_c41_56ae_ins,
rot2_uxn_opcodes_h_l3350_c41_56ae_previous_stack_read,
rot2_uxn_opcodes_h_l3350_c41_56ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_left,
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_right,
BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65
opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_cond,
opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue,
opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse,
opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output);

-- dup_uxn_opcodes_h_l3351_c41_f088
dup_uxn_opcodes_h_l3351_c41_f088 : entity work.dup_0CLK_a148083c port map (
clk,
dup_uxn_opcodes_h_l3351_c41_f088_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3351_c41_f088_phase,
dup_uxn_opcodes_h_l3351_c41_f088_ins,
dup_uxn_opcodes_h_l3351_c41_f088_previous_stack_read,
dup_uxn_opcodes_h_l3351_c41_f088_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_left,
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_right,
BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3352_c7_0056
opc_result_MUX_uxn_opcodes_h_l3352_c7_0056 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_cond,
opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue,
opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse,
opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output);

-- dup2_uxn_opcodes_h_l3352_c41_6f4f
dup2_uxn_opcodes_h_l3352_c41_6f4f : entity work.dup2_0CLK_8f02dccf port map (
clk,
dup2_uxn_opcodes_h_l3352_c41_6f4f_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3352_c41_6f4f_phase,
dup2_uxn_opcodes_h_l3352_c41_6f4f_ins,
dup2_uxn_opcodes_h_l3352_c41_6f4f_previous_stack_read,
dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_left,
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_right,
BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3353_c7_1955
opc_result_MUX_uxn_opcodes_h_l3353_c7_1955 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_cond,
opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue,
opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse,
opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output);

-- ovr_uxn_opcodes_h_l3353_c41_7f51
ovr_uxn_opcodes_h_l3353_c41_7f51 : entity work.ovr_0CLK_cf70ec0f port map (
clk,
ovr_uxn_opcodes_h_l3353_c41_7f51_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3353_c41_7f51_phase,
ovr_uxn_opcodes_h_l3353_c41_7f51_ins,
ovr_uxn_opcodes_h_l3353_c41_7f51_previous_stack_read,
ovr_uxn_opcodes_h_l3353_c41_7f51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_left,
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_right,
BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3354_c7_7591
opc_result_MUX_uxn_opcodes_h_l3354_c7_7591 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_cond,
opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue,
opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse,
opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output);

-- ovr2_uxn_opcodes_h_l3354_c41_3006
ovr2_uxn_opcodes_h_l3354_c41_3006 : entity work.ovr2_0CLK_084aa6da port map (
clk,
ovr2_uxn_opcodes_h_l3354_c41_3006_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3354_c41_3006_phase,
ovr2_uxn_opcodes_h_l3354_c41_3006_ins,
ovr2_uxn_opcodes_h_l3354_c41_3006_previous_stack_read,
ovr2_uxn_opcodes_h_l3354_c41_3006_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e
BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_left,
BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_right,
BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3355_c7_f840
opc_result_MUX_uxn_opcodes_h_l3355_c7_f840 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_cond,
opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue,
opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse,
opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output);

-- equ_uxn_opcodes_h_l3355_c41_d0da
equ_uxn_opcodes_h_l3355_c41_d0da : entity work.equ_0CLK_7c2e709f port map (
clk,
equ_uxn_opcodes_h_l3355_c41_d0da_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3355_c41_d0da_phase,
equ_uxn_opcodes_h_l3355_c41_d0da_ins,
equ_uxn_opcodes_h_l3355_c41_d0da_previous_stack_read,
equ_uxn_opcodes_h_l3355_c41_d0da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1
BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_left,
BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_right,
BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e
opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_cond,
opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output);

-- equ2_uxn_opcodes_h_l3356_c41_52fa
equ2_uxn_opcodes_h_l3356_c41_52fa : entity work.equ2_0CLK_3a9c1537 port map (
clk,
equ2_uxn_opcodes_h_l3356_c41_52fa_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3356_c41_52fa_phase,
equ2_uxn_opcodes_h_l3356_c41_52fa_ins,
equ2_uxn_opcodes_h_l3356_c41_52fa_previous_stack_read,
equ2_uxn_opcodes_h_l3356_c41_52fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e
BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_left,
BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_right,
BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3357_c7_775e
opc_result_MUX_uxn_opcodes_h_l3357_c7_775e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_cond,
opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output);

-- neq_uxn_opcodes_h_l3357_c41_ca08
neq_uxn_opcodes_h_l3357_c41_ca08 : entity work.neq_0CLK_7c2e709f port map (
clk,
neq_uxn_opcodes_h_l3357_c41_ca08_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3357_c41_ca08_phase,
neq_uxn_opcodes_h_l3357_c41_ca08_ins,
neq_uxn_opcodes_h_l3357_c41_ca08_previous_stack_read,
neq_uxn_opcodes_h_l3357_c41_ca08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292
BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_left,
BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_right,
BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3358_c7_467d
opc_result_MUX_uxn_opcodes_h_l3358_c7_467d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_cond,
opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output);

-- neq2_uxn_opcodes_h_l3358_c41_7fc2
neq2_uxn_opcodes_h_l3358_c41_7fc2 : entity work.neq2_0CLK_3a9c1537 port map (
clk,
neq2_uxn_opcodes_h_l3358_c41_7fc2_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3358_c41_7fc2_phase,
neq2_uxn_opcodes_h_l3358_c41_7fc2_ins,
neq2_uxn_opcodes_h_l3358_c41_7fc2_previous_stack_read,
neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063
BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_left,
BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_right,
BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3359_c7_a139
opc_result_MUX_uxn_opcodes_h_l3359_c7_a139 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_cond,
opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue,
opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse,
opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output);

-- gth_uxn_opcodes_h_l3359_c41_65f1
gth_uxn_opcodes_h_l3359_c41_65f1 : entity work.gth_0CLK_7c2e709f port map (
clk,
gth_uxn_opcodes_h_l3359_c41_65f1_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3359_c41_65f1_phase,
gth_uxn_opcodes_h_l3359_c41_65f1_ins,
gth_uxn_opcodes_h_l3359_c41_65f1_previous_stack_read,
gth_uxn_opcodes_h_l3359_c41_65f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075
BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_left,
BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_right,
BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68
opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_cond,
opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue,
opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse,
opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output);

-- gth2_uxn_opcodes_h_l3360_c41_9f17
gth2_uxn_opcodes_h_l3360_c41_9f17 : entity work.gth2_0CLK_3a9c1537 port map (
clk,
gth2_uxn_opcodes_h_l3360_c41_9f17_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3360_c41_9f17_phase,
gth2_uxn_opcodes_h_l3360_c41_9f17_ins,
gth2_uxn_opcodes_h_l3360_c41_9f17_previous_stack_read,
gth2_uxn_opcodes_h_l3360_c41_9f17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3
BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_left,
BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_right,
BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3361_c7_446d
opc_result_MUX_uxn_opcodes_h_l3361_c7_446d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_cond,
opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output);

-- lth_uxn_opcodes_h_l3361_c41_715d
lth_uxn_opcodes_h_l3361_c41_715d : entity work.lth_0CLK_7c2e709f port map (
clk,
lth_uxn_opcodes_h_l3361_c41_715d_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3361_c41_715d_phase,
lth_uxn_opcodes_h_l3361_c41_715d_ins,
lth_uxn_opcodes_h_l3361_c41_715d_previous_stack_read,
lth_uxn_opcodes_h_l3361_c41_715d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2
BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_left,
BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_right,
BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3362_c7_0421
opc_result_MUX_uxn_opcodes_h_l3362_c7_0421 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_cond,
opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue,
opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse,
opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output);

-- lth2_uxn_opcodes_h_l3362_c41_b16e
lth2_uxn_opcodes_h_l3362_c41_b16e : entity work.lth2_0CLK_3a9c1537 port map (
clk,
lth2_uxn_opcodes_h_l3362_c41_b16e_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3362_c41_b16e_phase,
lth2_uxn_opcodes_h_l3362_c41_b16e_ins,
lth2_uxn_opcodes_h_l3362_c41_b16e_previous_stack_read,
lth2_uxn_opcodes_h_l3362_c41_b16e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202
BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_left,
BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_right,
BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac
opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_cond,
opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output);

-- jmp_uxn_opcodes_h_l3363_c41_ead6
jmp_uxn_opcodes_h_l3363_c41_ead6 : entity work.jmp_0CLK_6481cb28 port map (
clk,
jmp_uxn_opcodes_h_l3363_c41_ead6_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3363_c41_ead6_phase,
jmp_uxn_opcodes_h_l3363_c41_ead6_ins,
jmp_uxn_opcodes_h_l3363_c41_ead6_pc,
jmp_uxn_opcodes_h_l3363_c41_ead6_previous_stack_read,
jmp_uxn_opcodes_h_l3363_c41_ead6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822
BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_left,
BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_right,
BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c
opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond,
opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output);

-- jmp2_uxn_opcodes_h_l3364_c41_78bc
jmp2_uxn_opcodes_h_l3364_c41_78bc : entity work.jmp2_0CLK_f7466064 port map (
clk,
jmp2_uxn_opcodes_h_l3364_c41_78bc_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3364_c41_78bc_phase,
jmp2_uxn_opcodes_h_l3364_c41_78bc_ins,
jmp2_uxn_opcodes_h_l3364_c41_78bc_previous_stack_read,
jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787
BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_left,
BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_right,
BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf
opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond,
opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output);

-- jcn_uxn_opcodes_h_l3365_c41_f3b5
jcn_uxn_opcodes_h_l3365_c41_f3b5 : entity work.jcn_0CLK_7c2e709f port map (
clk,
jcn_uxn_opcodes_h_l3365_c41_f3b5_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3365_c41_f3b5_phase,
jcn_uxn_opcodes_h_l3365_c41_f3b5_ins,
jcn_uxn_opcodes_h_l3365_c41_f3b5_pc,
jcn_uxn_opcodes_h_l3365_c41_f3b5_previous_stack_read,
jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924
BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_left,
BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_right,
BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3366_c7_0418
opc_result_MUX_uxn_opcodes_h_l3366_c7_0418 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_cond,
opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue,
opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse,
opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output);

-- jcn2_uxn_opcodes_h_l3366_c41_35c4
jcn2_uxn_opcodes_h_l3366_c41_35c4 : entity work.jcn2_0CLK_bbbe252c port map (
clk,
jcn2_uxn_opcodes_h_l3366_c41_35c4_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3366_c41_35c4_phase,
jcn2_uxn_opcodes_h_l3366_c41_35c4_ins,
jcn2_uxn_opcodes_h_l3366_c41_35c4_previous_stack_read,
jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447
BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_left,
BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_right,
BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72
opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_cond,
opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue,
opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse,
opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output);

-- jsr_uxn_opcodes_h_l3367_c41_fbc2
jsr_uxn_opcodes_h_l3367_c41_fbc2 : entity work.jsr_0CLK_86d21d89 port map (
clk,
jsr_uxn_opcodes_h_l3367_c41_fbc2_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3367_c41_fbc2_phase,
jsr_uxn_opcodes_h_l3367_c41_fbc2_ins,
jsr_uxn_opcodes_h_l3367_c41_fbc2_pc,
jsr_uxn_opcodes_h_l3367_c41_fbc2_previous_stack_read,
jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383
BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_left,
BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_right,
BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a
opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond,
opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output);

-- jsr2_uxn_opcodes_h_l3368_c41_2ee2
jsr2_uxn_opcodes_h_l3368_c41_2ee2 : entity work.jsr2_0CLK_a538d920 port map (
clk,
jsr2_uxn_opcodes_h_l3368_c41_2ee2_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3368_c41_2ee2_phase,
jsr2_uxn_opcodes_h_l3368_c41_2ee2_ins,
jsr2_uxn_opcodes_h_l3368_c41_2ee2_pc,
jsr2_uxn_opcodes_h_l3368_c41_2ee2_previous_stack_read,
jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3
BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_left,
BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_right,
BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3369_c7_8412
opc_result_MUX_uxn_opcodes_h_l3369_c7_8412 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_cond,
opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue,
opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse,
opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output);

-- sth_uxn_opcodes_h_l3369_c41_d1d5
sth_uxn_opcodes_h_l3369_c41_d1d5 : entity work.sth_0CLK_edc09f97 port map (
clk,
sth_uxn_opcodes_h_l3369_c41_d1d5_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3369_c41_d1d5_phase,
sth_uxn_opcodes_h_l3369_c41_d1d5_ins,
sth_uxn_opcodes_h_l3369_c41_d1d5_previous_stack_read,
sth_uxn_opcodes_h_l3369_c41_d1d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb
BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_left,
BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_right,
BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71
opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_cond,
opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue,
opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse,
opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output);

-- sth2_uxn_opcodes_h_l3370_c41_4a6b
sth2_uxn_opcodes_h_l3370_c41_4a6b : entity work.sth2_0CLK_bbbe252c port map (
clk,
sth2_uxn_opcodes_h_l3370_c41_4a6b_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3370_c41_4a6b_phase,
sth2_uxn_opcodes_h_l3370_c41_4a6b_ins,
sth2_uxn_opcodes_h_l3370_c41_4a6b_previous_stack_read,
sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200
BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_left,
BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_right,
BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4
opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond,
opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output);

-- ldz_uxn_opcodes_h_l3371_c41_bb2f
ldz_uxn_opcodes_h_l3371_c41_bb2f : entity work.ldz_0CLK_5b8ec7cf port map (
clk,
ldz_uxn_opcodes_h_l3371_c41_bb2f_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3371_c41_bb2f_phase,
ldz_uxn_opcodes_h_l3371_c41_bb2f_ins,
ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_stack_read,
ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_ram_read,
ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864
BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_left,
BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_right,
BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a
opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond,
opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output);

-- ldz2_uxn_opcodes_h_l3372_c41_da99
ldz2_uxn_opcodes_h_l3372_c41_da99 : entity work.ldz2_0CLK_2b0015ee port map (
clk,
ldz2_uxn_opcodes_h_l3372_c41_da99_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3372_c41_da99_phase,
ldz2_uxn_opcodes_h_l3372_c41_da99_ins,
ldz2_uxn_opcodes_h_l3372_c41_da99_previous_stack_read,
ldz2_uxn_opcodes_h_l3372_c41_da99_previous_ram_read,
ldz2_uxn_opcodes_h_l3372_c41_da99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06
BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_left,
BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_right,
BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5
opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond,
opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output);

-- stz_uxn_opcodes_h_l3373_c41_818b
stz_uxn_opcodes_h_l3373_c41_818b : entity work.stz_0CLK_5110df32 port map (
clk,
stz_uxn_opcodes_h_l3373_c41_818b_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3373_c41_818b_phase,
stz_uxn_opcodes_h_l3373_c41_818b_ins,
stz_uxn_opcodes_h_l3373_c41_818b_previous_stack_read,
stz_uxn_opcodes_h_l3373_c41_818b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0
BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_left,
BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_right,
BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3374_c7_2840
opc_result_MUX_uxn_opcodes_h_l3374_c7_2840 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_cond,
opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue,
opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse,
opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output);

-- stz2_uxn_opcodes_h_l3374_c41_73fa
stz2_uxn_opcodes_h_l3374_c41_73fa : entity work.stz2_0CLK_05af43a3 port map (
clk,
stz2_uxn_opcodes_h_l3374_c41_73fa_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3374_c41_73fa_phase,
stz2_uxn_opcodes_h_l3374_c41_73fa_ins,
stz2_uxn_opcodes_h_l3374_c41_73fa_previous_stack_read,
stz2_uxn_opcodes_h_l3374_c41_73fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a
BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_left,
BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_right,
BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3375_c7_8894
opc_result_MUX_uxn_opcodes_h_l3375_c7_8894 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_cond,
opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue,
opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse,
opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output);

-- ldr_uxn_opcodes_h_l3375_c41_81b4
ldr_uxn_opcodes_h_l3375_c41_81b4 : entity work.ldr_0CLK_cf70ec0f port map (
clk,
ldr_uxn_opcodes_h_l3375_c41_81b4_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3375_c41_81b4_phase,
ldr_uxn_opcodes_h_l3375_c41_81b4_ins,
ldr_uxn_opcodes_h_l3375_c41_81b4_pc,
ldr_uxn_opcodes_h_l3375_c41_81b4_previous_stack_read,
ldr_uxn_opcodes_h_l3375_c41_81b4_previous_ram_read,
ldr_uxn_opcodes_h_l3375_c41_81b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7
BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_left,
BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_right,
BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60
opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_cond,
opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue,
opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse,
opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output);

-- ldr2_uxn_opcodes_h_l3376_c41_7cba
ldr2_uxn_opcodes_h_l3376_c41_7cba : entity work.ldr2_0CLK_05af43a3 port map (
clk,
ldr2_uxn_opcodes_h_l3376_c41_7cba_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3376_c41_7cba_phase,
ldr2_uxn_opcodes_h_l3376_c41_7cba_ins,
ldr2_uxn_opcodes_h_l3376_c41_7cba_pc,
ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_stack_read,
ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_ram_read,
ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d
BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_left,
BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_right,
BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e
opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_cond,
opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output);

-- str1_uxn_opcodes_h_l3377_c41_92a5
str1_uxn_opcodes_h_l3377_c41_92a5 : entity work.str1_0CLK_a45e5d62 port map (
clk,
str1_uxn_opcodes_h_l3377_c41_92a5_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3377_c41_92a5_phase,
str1_uxn_opcodes_h_l3377_c41_92a5_ins,
str1_uxn_opcodes_h_l3377_c41_92a5_pc,
str1_uxn_opcodes_h_l3377_c41_92a5_previous_stack_read,
str1_uxn_opcodes_h_l3377_c41_92a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d
BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_left,
BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_right,
BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25
opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_cond,
opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue,
opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse,
opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output);

-- str2_uxn_opcodes_h_l3378_c41_8eb6
str2_uxn_opcodes_h_l3378_c41_8eb6 : entity work.str2_0CLK_05af43a3 port map (
clk,
str2_uxn_opcodes_h_l3378_c41_8eb6_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3378_c41_8eb6_phase,
str2_uxn_opcodes_h_l3378_c41_8eb6_ins,
str2_uxn_opcodes_h_l3378_c41_8eb6_pc,
str2_uxn_opcodes_h_l3378_c41_8eb6_previous_stack_read,
str2_uxn_opcodes_h_l3378_c41_8eb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef
BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_left,
BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_right,
BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3379_c7_c196
opc_result_MUX_uxn_opcodes_h_l3379_c7_c196 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_cond,
opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue,
opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse,
opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output);

-- lda_uxn_opcodes_h_l3379_c41_e7d6
lda_uxn_opcodes_h_l3379_c41_e7d6 : entity work.lda_0CLK_d853ed1b port map (
clk,
lda_uxn_opcodes_h_l3379_c41_e7d6_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3379_c41_e7d6_phase,
lda_uxn_opcodes_h_l3379_c41_e7d6_ins,
lda_uxn_opcodes_h_l3379_c41_e7d6_previous_stack_read,
lda_uxn_opcodes_h_l3379_c41_e7d6_previous_ram_read,
lda_uxn_opcodes_h_l3379_c41_e7d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9
BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_left,
BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_right,
BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84
opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_cond,
opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue,
opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse,
opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output);

-- lda2_uxn_opcodes_h_l3380_c41_442b
lda2_uxn_opcodes_h_l3380_c41_442b : entity work.lda2_0CLK_9347d63d port map (
clk,
lda2_uxn_opcodes_h_l3380_c41_442b_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3380_c41_442b_phase,
lda2_uxn_opcodes_h_l3380_c41_442b_ins,
lda2_uxn_opcodes_h_l3380_c41_442b_previous_stack_read,
lda2_uxn_opcodes_h_l3380_c41_442b_previous_ram_read,
lda2_uxn_opcodes_h_l3380_c41_442b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6
BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_left,
BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_right,
BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3381_c7_e017
opc_result_MUX_uxn_opcodes_h_l3381_c7_e017 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_cond,
opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue,
opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse,
opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output);

-- sta_uxn_opcodes_h_l3381_c41_3660
sta_uxn_opcodes_h_l3381_c41_3660 : entity work.sta_0CLK_5e923a6a port map (
clk,
sta_uxn_opcodes_h_l3381_c41_3660_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3381_c41_3660_phase,
sta_uxn_opcodes_h_l3381_c41_3660_ins,
sta_uxn_opcodes_h_l3381_c41_3660_previous_stack_read,
sta_uxn_opcodes_h_l3381_c41_3660_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac
BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_left,
BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_right,
BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf
opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_cond,
opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output);

-- sta2_uxn_opcodes_h_l3382_c41_0032
sta2_uxn_opcodes_h_l3382_c41_0032 : entity work.sta2_0CLK_201aeef3 port map (
clk,
sta2_uxn_opcodes_h_l3382_c41_0032_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3382_c41_0032_phase,
sta2_uxn_opcodes_h_l3382_c41_0032_ins,
sta2_uxn_opcodes_h_l3382_c41_0032_previous_stack_read,
sta2_uxn_opcodes_h_l3382_c41_0032_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c
BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_left,
BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_right,
BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69
opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_cond,
opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue,
opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse,
opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output);

-- dei_uxn_opcodes_h_l3383_c41_5e52
dei_uxn_opcodes_h_l3383_c41_5e52 : entity work.dei_0CLK_622ac75f port map (
clk,
dei_uxn_opcodes_h_l3383_c41_5e52_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3383_c41_5e52_phase,
dei_uxn_opcodes_h_l3383_c41_5e52_ins,
dei_uxn_opcodes_h_l3383_c41_5e52_previous_stack_read,
dei_uxn_opcodes_h_l3383_c41_5e52_previous_device_ram_read,
dei_uxn_opcodes_h_l3383_c41_5e52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0
BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_left,
BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_right,
BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b
opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_cond,
opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output);

-- dei2_uxn_opcodes_h_l3384_c41_4929
dei2_uxn_opcodes_h_l3384_c41_4929 : entity work.dei2_0CLK_14a12093 port map (
clk,
dei2_uxn_opcodes_h_l3384_c41_4929_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3384_c41_4929_phase,
dei2_uxn_opcodes_h_l3384_c41_4929_ins,
dei2_uxn_opcodes_h_l3384_c41_4929_previous_stack_read,
dei2_uxn_opcodes_h_l3384_c41_4929_previous_device_ram_read,
dei2_uxn_opcodes_h_l3384_c41_4929_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8
BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_left,
BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_right,
BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36
opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_cond,
opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue,
opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse,
opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output);

-- deo_uxn_opcodes_h_l3385_c41_90b5
deo_uxn_opcodes_h_l3385_c41_90b5 : entity work.deo_0CLK_52d54777 port map (
clk,
deo_uxn_opcodes_h_l3385_c41_90b5_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3385_c41_90b5_phase,
deo_uxn_opcodes_h_l3385_c41_90b5_ins,
deo_uxn_opcodes_h_l3385_c41_90b5_previous_stack_read,
deo_uxn_opcodes_h_l3385_c41_90b5_previous_device_ram_read,
deo_uxn_opcodes_h_l3385_c41_90b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575
BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_left,
BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_right,
BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3386_c7_780c
opc_result_MUX_uxn_opcodes_h_l3386_c7_780c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_cond,
opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output);

-- deo2_uxn_opcodes_h_l3386_c41_04d1
deo2_uxn_opcodes_h_l3386_c41_04d1 : entity work.deo2_0CLK_3ae8bf4a port map (
clk,
deo2_uxn_opcodes_h_l3386_c41_04d1_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3386_c41_04d1_phase,
deo2_uxn_opcodes_h_l3386_c41_04d1_ins,
deo2_uxn_opcodes_h_l3386_c41_04d1_previous_stack_read,
deo2_uxn_opcodes_h_l3386_c41_04d1_previous_device_ram_read,
deo2_uxn_opcodes_h_l3386_c41_04d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a
BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_left,
BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_right,
BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c
opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond,
opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output);

-- add_uxn_opcodes_h_l3387_c41_7e0f
add_uxn_opcodes_h_l3387_c41_7e0f : entity work.add_0CLK_fd2391e7 port map (
clk,
add_uxn_opcodes_h_l3387_c41_7e0f_CLOCK_ENABLE,
add_uxn_opcodes_h_l3387_c41_7e0f_phase,
add_uxn_opcodes_h_l3387_c41_7e0f_ins,
add_uxn_opcodes_h_l3387_c41_7e0f_previous_stack_read,
add_uxn_opcodes_h_l3387_c41_7e0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec
BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_left,
BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_right,
BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3388_c7_3294
opc_result_MUX_uxn_opcodes_h_l3388_c7_3294 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_cond,
opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue,
opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse,
opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output);

-- add2_uxn_opcodes_h_l3388_c41_5db5
add2_uxn_opcodes_h_l3388_c41_5db5 : entity work.add2_0CLK_201aeef3 port map (
clk,
add2_uxn_opcodes_h_l3388_c41_5db5_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3388_c41_5db5_phase,
add2_uxn_opcodes_h_l3388_c41_5db5_ins,
add2_uxn_opcodes_h_l3388_c41_5db5_previous_stack_read,
add2_uxn_opcodes_h_l3388_c41_5db5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756
BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_left,
BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_right,
BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3389_c7_609f
opc_result_MUX_uxn_opcodes_h_l3389_c7_609f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_cond,
opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output);

-- sub_uxn_opcodes_h_l3389_c41_5f15
sub_uxn_opcodes_h_l3389_c41_5f15 : entity work.sub_0CLK_fd2391e7 port map (
clk,
sub_uxn_opcodes_h_l3389_c41_5f15_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3389_c41_5f15_phase,
sub_uxn_opcodes_h_l3389_c41_5f15_ins,
sub_uxn_opcodes_h_l3389_c41_5f15_previous_stack_read,
sub_uxn_opcodes_h_l3389_c41_5f15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2
BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3390_c7_4004
opc_result_MUX_uxn_opcodes_h_l3390_c7_4004 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_cond,
opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue,
opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse,
opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output);

-- sub2_uxn_opcodes_h_l3390_c41_ebe4
sub2_uxn_opcodes_h_l3390_c41_ebe4 : entity work.sub2_0CLK_201aeef3 port map (
clk,
sub2_uxn_opcodes_h_l3390_c41_ebe4_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3390_c41_ebe4_phase,
sub2_uxn_opcodes_h_l3390_c41_ebe4_ins,
sub2_uxn_opcodes_h_l3390_c41_ebe4_previous_stack_read,
sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35
BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_left,
BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_right,
BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a
opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond,
opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output);

-- mul_uxn_opcodes_h_l3391_c41_5337
mul_uxn_opcodes_h_l3391_c41_5337 : entity work.mul_0CLK_fd2391e7 port map (
clk,
mul_uxn_opcodes_h_l3391_c41_5337_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3391_c41_5337_phase,
mul_uxn_opcodes_h_l3391_c41_5337_ins,
mul_uxn_opcodes_h_l3391_c41_5337_previous_stack_read,
mul_uxn_opcodes_h_l3391_c41_5337_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0
BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_left,
BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_right,
BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3392_c7_5500
opc_result_MUX_uxn_opcodes_h_l3392_c7_5500 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_cond,
opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue,
opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse,
opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output);

-- mul2_uxn_opcodes_h_l3392_c41_7c7b
mul2_uxn_opcodes_h_l3392_c41_7c7b : entity work.mul2_0CLK_201aeef3 port map (
clk,
mul2_uxn_opcodes_h_l3392_c41_7c7b_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3392_c41_7c7b_phase,
mul2_uxn_opcodes_h_l3392_c41_7c7b_ins,
mul2_uxn_opcodes_h_l3392_c41_7c7b_previous_stack_read,
mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d
BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_left,
BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_right,
BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc
opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond,
opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output);

-- div_uxn_opcodes_h_l3393_c41_e4ad
div_uxn_opcodes_h_l3393_c41_e4ad : entity work.div_0CLK_f6fa2c7d port map (
clk,
div_uxn_opcodes_h_l3393_c41_e4ad_CLOCK_ENABLE,
div_uxn_opcodes_h_l3393_c41_e4ad_phase,
div_uxn_opcodes_h_l3393_c41_e4ad_ins,
div_uxn_opcodes_h_l3393_c41_e4ad_previous_stack_read,
div_uxn_opcodes_h_l3393_c41_e4ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e
BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_left,
BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_right,
BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3394_c7_f296
opc_result_MUX_uxn_opcodes_h_l3394_c7_f296 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_cond,
opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue,
opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse,
opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output);

-- div2_uxn_opcodes_h_l3394_c41_1ac6
div2_uxn_opcodes_h_l3394_c41_1ac6 : entity work.div2_0CLK_444c40b9 port map (
clk,
div2_uxn_opcodes_h_l3394_c41_1ac6_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3394_c41_1ac6_phase,
div2_uxn_opcodes_h_l3394_c41_1ac6_ins,
div2_uxn_opcodes_h_l3394_c41_1ac6_previous_stack_read,
div2_uxn_opcodes_h_l3394_c41_1ac6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595
BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_left,
BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_right,
BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f
opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_cond,
opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output);

-- and_uxn_opcodes_h_l3395_c41_d132
and_uxn_opcodes_h_l3395_c41_d132 : entity work.and_0CLK_fd2391e7 port map (
clk,
and_uxn_opcodes_h_l3395_c41_d132_CLOCK_ENABLE,
and_uxn_opcodes_h_l3395_c41_d132_phase,
and_uxn_opcodes_h_l3395_c41_d132_ins,
and_uxn_opcodes_h_l3395_c41_d132_previous_stack_read,
and_uxn_opcodes_h_l3395_c41_d132_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f
BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_left,
BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_right,
BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3396_c7_2231
opc_result_MUX_uxn_opcodes_h_l3396_c7_2231 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_cond,
opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue,
opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse,
opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output);

-- and2_uxn_opcodes_h_l3396_c41_3895
and2_uxn_opcodes_h_l3396_c41_3895 : entity work.and2_0CLK_201aeef3 port map (
clk,
and2_uxn_opcodes_h_l3396_c41_3895_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3396_c41_3895_phase,
and2_uxn_opcodes_h_l3396_c41_3895_ins,
and2_uxn_opcodes_h_l3396_c41_3895_previous_stack_read,
and2_uxn_opcodes_h_l3396_c41_3895_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a
BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_left,
BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_right,
BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9
opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_cond,
opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output);

-- ora_uxn_opcodes_h_l3397_c41_a1a1
ora_uxn_opcodes_h_l3397_c41_a1a1 : entity work.ora_0CLK_fd2391e7 port map (
clk,
ora_uxn_opcodes_h_l3397_c41_a1a1_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3397_c41_a1a1_phase,
ora_uxn_opcodes_h_l3397_c41_a1a1_ins,
ora_uxn_opcodes_h_l3397_c41_a1a1_previous_stack_read,
ora_uxn_opcodes_h_l3397_c41_a1a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a
BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_left,
BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_right,
BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f
opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_cond,
opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output);

-- ora2_uxn_opcodes_h_l3398_c41_39d9
ora2_uxn_opcodes_h_l3398_c41_39d9 : entity work.ora2_0CLK_201aeef3 port map (
clk,
ora2_uxn_opcodes_h_l3398_c41_39d9_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3398_c41_39d9_phase,
ora2_uxn_opcodes_h_l3398_c41_39d9_ins,
ora2_uxn_opcodes_h_l3398_c41_39d9_previous_stack_read,
ora2_uxn_opcodes_h_l3398_c41_39d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa
BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_left,
BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_right,
BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e
opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_cond,
opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output);

-- eor_uxn_opcodes_h_l3399_c41_933e
eor_uxn_opcodes_h_l3399_c41_933e : entity work.eor_0CLK_fd2391e7 port map (
clk,
eor_uxn_opcodes_h_l3399_c41_933e_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3399_c41_933e_phase,
eor_uxn_opcodes_h_l3399_c41_933e_ins,
eor_uxn_opcodes_h_l3399_c41_933e_previous_stack_read,
eor_uxn_opcodes_h_l3399_c41_933e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3
BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_left,
BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_right,
BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3400_c7_0788
opc_result_MUX_uxn_opcodes_h_l3400_c7_0788 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_cond,
opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue,
opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse,
opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output);

-- eor2_uxn_opcodes_h_l3400_c41_1adb
eor2_uxn_opcodes_h_l3400_c41_1adb : entity work.eor2_0CLK_201aeef3 port map (
clk,
eor2_uxn_opcodes_h_l3400_c41_1adb_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3400_c41_1adb_phase,
eor2_uxn_opcodes_h_l3400_c41_1adb_ins,
eor2_uxn_opcodes_h_l3400_c41_1adb_previous_stack_read,
eor2_uxn_opcodes_h_l3400_c41_1adb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8
BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_left,
BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_right,
BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31
opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_cond,
opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue,
opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse,
opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output);

-- sft_uxn_opcodes_h_l3401_c41_6ea8
sft_uxn_opcodes_h_l3401_c41_6ea8 : entity work.sft_0CLK_f7a3ea45 port map (
clk,
sft_uxn_opcodes_h_l3401_c41_6ea8_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3401_c41_6ea8_phase,
sft_uxn_opcodes_h_l3401_c41_6ea8_ins,
sft_uxn_opcodes_h_l3401_c41_6ea8_previous_stack_read,
sft_uxn_opcodes_h_l3401_c41_6ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd
BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_left,
BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_right,
BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3402_c7_8990
opc_result_MUX_uxn_opcodes_h_l3402_c7_8990 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_cond,
opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue,
opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse,
opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output);

-- sft2_uxn_opcodes_h_l3402_c41_b730
sft2_uxn_opcodes_h_l3402_c41_b730 : entity work.sft2_0CLK_d29b8e2d port map (
clk,
sft2_uxn_opcodes_h_l3402_c41_b730_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3402_c41_b730_phase,
sft2_uxn_opcodes_h_l3402_c41_b730_ins,
sft2_uxn_opcodes_h_l3402_c41_b730_previous_stack_read,
sft2_uxn_opcodes_h_l3402_c41_b730_return_output);

-- printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078
printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078 : entity work.printf_uxn_opcodes_h_l3403_c9_e078_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_arg0);

-- sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c
sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond,
sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue,
sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse,
sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output);

-- sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c
sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond,
sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue,
sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse,
sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output);

-- sp0_MUX_uxn_opcodes_h_l3406_c3_770b
sp0_MUX_uxn_opcodes_h_l3406_c3_770b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3406_c3_770b_cond,
sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue,
sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse,
sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output);

-- sp1_MUX_uxn_opcodes_h_l3406_c3_770b
sp1_MUX_uxn_opcodes_h_l3406_c3_770b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3406_c3_770b_cond,
sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue,
sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse,
sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b
BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_left,
BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_right,
BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85
BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_left,
BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_right,
BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output);

-- MUX_uxn_opcodes_h_l3415_c19_712f
MUX_uxn_opcodes_h_l3415_c19_712f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3415_c19_712f_cond,
MUX_uxn_opcodes_h_l3415_c19_712f_iftrue,
MUX_uxn_opcodes_h_l3415_c19_712f_iffalse,
MUX_uxn_opcodes_h_l3415_c19_712f_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c
BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_left,
BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_right,
BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea
stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_cond,
stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9 : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address0,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_value,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address1,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address0,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_value,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address1,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output);

-- device_ram_update_uxn_opcodes_h_l3438_c26_64a9
device_ram_update_uxn_opcodes_h_l3438_c26_64a9 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address0,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_value,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_enable,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read0_enable,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address1,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read1_enable,
device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output,
 CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output,
 MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output,
 MUX_uxn_opcodes_h_l3329_c18_ec96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output,
 opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output,
 jci_uxn_opcodes_h_l3334_c41_255d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output,
 opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output,
 jmi_uxn_opcodes_h_l3335_c41_2244_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output,
 jsi_uxn_opcodes_h_l3336_c41_d14a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output,
 lit_uxn_opcodes_h_l3337_c41_1a1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output,
 lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output,
 lit_uxn_opcodes_h_l3339_c41_8576_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output,
 opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output,
 lit2_uxn_opcodes_h_l3340_c41_a236_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output,
 opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output,
 inc_uxn_opcodes_h_l3341_c41_3785_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output,
 inc2_uxn_opcodes_h_l3342_c41_b664_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output,
 pop_uxn_opcodes_h_l3343_c41_e5d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output,
 pop2_uxn_opcodes_h_l3344_c41_9c27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output,
 nip_uxn_opcodes_h_l3345_c41_c95c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output,
 nip2_uxn_opcodes_h_l3346_c41_4464_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output,
 swp_uxn_opcodes_h_l3347_c41_d898_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output,
 swp2_uxn_opcodes_h_l3348_c41_4296_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output,
 rot_uxn_opcodes_h_l3349_c41_720d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output,
 opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output,
 rot2_uxn_opcodes_h_l3350_c41_56ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output,
 opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output,
 dup_uxn_opcodes_h_l3351_c41_f088_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output,
 opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output,
 dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output,
 opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output,
 ovr_uxn_opcodes_h_l3353_c41_7f51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output,
 opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output,
 ovr2_uxn_opcodes_h_l3354_c41_3006_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output,
 equ_uxn_opcodes_h_l3355_c41_d0da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output,
 equ2_uxn_opcodes_h_l3356_c41_52fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output,
 neq_uxn_opcodes_h_l3357_c41_ca08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output,
 opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output,
 neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output,
 opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output,
 gth_uxn_opcodes_h_l3359_c41_65f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output,
 gth2_uxn_opcodes_h_l3360_c41_9f17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output,
 opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output,
 lth_uxn_opcodes_h_l3361_c41_715d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output,
 lth2_uxn_opcodes_h_l3362_c41_b16e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output,
 jmp_uxn_opcodes_h_l3363_c41_ead6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output,
 jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output,
 opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output,
 jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output,
 opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output,
 jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output,
 jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output,
 opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output,
 jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output,
 opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output,
 sth_uxn_opcodes_h_l3369_c41_d1d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output,
 sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output,
 ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output,
 ldz2_uxn_opcodes_h_l3372_c41_da99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output,
 opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output,
 stz_uxn_opcodes_h_l3373_c41_818b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output,
 opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output,
 stz2_uxn_opcodes_h_l3374_c41_73fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output,
 opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output,
 ldr_uxn_opcodes_h_l3375_c41_81b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output,
 ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output,
 opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output,
 str1_uxn_opcodes_h_l3377_c41_92a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output,
 opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output,
 str2_uxn_opcodes_h_l3378_c41_8eb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output,
 opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output,
 lda_uxn_opcodes_h_l3379_c41_e7d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output,
 opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output,
 lda2_uxn_opcodes_h_l3380_c41_442b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output,
 sta_uxn_opcodes_h_l3381_c41_3660_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output,
 opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output,
 sta2_uxn_opcodes_h_l3382_c41_0032_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output,
 dei_uxn_opcodes_h_l3383_c41_5e52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output,
 opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output,
 dei2_uxn_opcodes_h_l3384_c41_4929_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output,
 deo_uxn_opcodes_h_l3385_c41_90b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output,
 deo2_uxn_opcodes_h_l3386_c41_04d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output,
 opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output,
 add_uxn_opcodes_h_l3387_c41_7e0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output,
 add2_uxn_opcodes_h_l3388_c41_5db5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output,
 opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output,
 sub_uxn_opcodes_h_l3389_c41_5f15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output,
 sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output,
 opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output,
 mul_uxn_opcodes_h_l3391_c41_5337_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output,
 mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output,
 opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output,
 div_uxn_opcodes_h_l3393_c41_e4ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output,
 div2_uxn_opcodes_h_l3394_c41_1ac6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output,
 opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output,
 and_uxn_opcodes_h_l3395_c41_d132_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output,
 and2_uxn_opcodes_h_l3396_c41_3895_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output,
 ora_uxn_opcodes_h_l3397_c41_a1a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output,
 ora2_uxn_opcodes_h_l3398_c41_39d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output,
 opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output,
 eor_uxn_opcodes_h_l3399_c41_933e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output,
 opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output,
 eor2_uxn_opcodes_h_l3400_c41_1adb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output,
 opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output,
 sft_uxn_opcodes_h_l3401_c41_6ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output,
 sft2_uxn_opcodes_h_l3402_c41_b730_return_output,
 sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output,
 sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output,
 sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output,
 sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output,
 MUX_uxn_opcodes_h_l3415_c19_712f_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output,
 stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output,
 stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output,
 device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3328_c2_87b5 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3328_c30_aace_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3328_c57_3aef_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3333_c2_e1e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3334_c41_255d_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3334_c41_255d_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3334_c41_255d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3334_c41_255d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3334_c41_255d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3334_c41_255d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3335_c41_2244_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3335_c41_2244_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3335_c41_2244_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3335_c41_2244_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3335_c41_2244_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3339_c41_8576_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3339_c41_8576_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3339_c41_8576_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3339_c41_8576_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3339_c41_8576_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3340_c41_a236_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3340_c41_a236_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3340_c41_a236_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3340_c41_a236_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3340_c41_a236_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3341_c41_3785_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3341_c41_3785_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3341_c41_3785_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3341_c41_3785_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3341_c41_3785_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3342_c41_b664_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3342_c41_b664_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3342_c41_b664_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3342_c41_b664_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3342_c41_b664_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3345_c41_c95c_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3345_c41_c95c_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3345_c41_c95c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3345_c41_c95c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3345_c41_c95c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3346_c41_4464_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3346_c41_4464_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3346_c41_4464_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3346_c41_4464_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3346_c41_4464_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3347_c41_d898_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3347_c41_d898_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3347_c41_d898_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3347_c41_d898_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3347_c41_d898_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3348_c41_4296_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3348_c41_4296_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3348_c41_4296_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3348_c41_4296_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3348_c41_4296_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3349_c41_720d_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3349_c41_720d_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3349_c41_720d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3349_c41_720d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3349_c41_720d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3351_c41_f088_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3351_c41_f088_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3351_c41_f088_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3351_c41_f088_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3351_c41_f088_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3355_c41_d0da_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3355_c41_d0da_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3355_c41_d0da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3355_c41_d0da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3355_c41_d0da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3357_c41_ca08_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3357_c41_ca08_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3357_c41_ca08_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3357_c41_ca08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3357_c41_ca08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3359_c41_65f1_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3359_c41_65f1_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3359_c41_65f1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3359_c41_65f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3359_c41_65f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3361_c41_715d_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3361_c41_715d_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3361_c41_715d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3361_c41_715d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3361_c41_715d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3373_c41_818b_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3373_c41_818b_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3373_c41_818b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3373_c41_818b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3373_c41_818b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3377_c41_92a5_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3377_c41_92a5_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3377_c41_92a5_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3377_c41_92a5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3377_c41_92a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3377_c41_92a5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3380_c41_442b_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3380_c41_442b_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3380_c41_442b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3380_c41_442b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3380_c41_442b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3380_c41_442b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3381_c41_3660_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3381_c41_3660_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3381_c41_3660_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3381_c41_3660_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3381_c41_3660_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3382_c41_0032_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3382_c41_0032_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3382_c41_0032_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3382_c41_0032_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3382_c41_0032_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3383_c41_5e52_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3383_c41_5e52_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3383_c41_5e52_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3383_c41_5e52_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3383_c41_5e52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3383_c41_5e52_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3384_c41_4929_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3384_c41_4929_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3384_c41_4929_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3384_c41_4929_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3384_c41_4929_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3384_c41_4929_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3385_c41_90b5_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3385_c41_90b5_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3385_c41_90b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3385_c41_90b5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3385_c41_90b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3385_c41_90b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3387_c41_7e0f_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3387_c41_7e0f_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3387_c41_7e0f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3387_c41_7e0f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3387_c41_7e0f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3388_c41_5db5_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3388_c41_5db5_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3388_c41_5db5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3388_c41_5db5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3388_c41_5db5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3389_c41_5f15_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3389_c41_5f15_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3389_c41_5f15_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3389_c41_5f15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3389_c41_5f15_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3391_c41_5337_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3391_c41_5337_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3391_c41_5337_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3391_c41_5337_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3391_c41_5337_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3393_c41_e4ad_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3393_c41_e4ad_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3393_c41_e4ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3393_c41_e4ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3393_c41_e4ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3395_c41_d132_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3395_c41_d132_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3395_c41_d132_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3395_c41_d132_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3395_c41_d132_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3396_c41_3895_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3396_c41_3895_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3396_c41_3895_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3396_c41_3895_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3396_c41_3895_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3399_c41_933e_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3399_c41_933e_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3399_c41_933e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3399_c41_933e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3399_c41_933e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3402_c41_b730_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3402_c41_b730_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3402_c41_b730_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3402_c41_b730_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3402_c41_b730_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3405_c6_9176_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3409_c4_b212 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3407_c4_3204 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3413_c18_b507_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3414_c19_0985_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3415_c19_712f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3415_c19_712f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3415_c19_712f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3415_c19_712f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3415_c82_f1a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3416_c22_8fe4_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l3419_c3_4676 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l3428_c3_8957 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l3438_c2_7caf : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3440_c3_98d4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3441_c3_3796_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3444_c3_c0f1_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3447_c34_d4fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3448_c23_8f60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l3449_c32_39f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3450_c33_7d0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3451_c29_2d9b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3452_c30_7796_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3453_c34_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3454_c33_8eaa_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3455_c31_1072_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3456_c32_03a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3406_l3418_l3415_DUPLICATE_11c4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3409_l3407_DUPLICATE_e5c1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3439_l3443_DUPLICATE_e09d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3458_l3311_DUPLICATE_4f7c_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue := to_unsigned(0, 1);
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read0_enable := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_right := to_unsigned(52, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_right := to_unsigned(1536, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_right := to_unsigned(29, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_right := to_unsigned(2048, 12);
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_right := to_unsigned(57, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_right := to_unsigned(18, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_right := to_unsigned(41, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_right := to_unsigned(19, 5);
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_right := to_unsigned(56, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_right := to_unsigned(58, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_right := to_unsigned(2560, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_right := to_unsigned(31, 5);
     VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_right := to_unsigned(15, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3384_c41_4929_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3383_c41_5e52_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3385_c41_90b5_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3388_c41_5db5_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3387_c41_7e0f_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3396_c41_3895_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3395_c41_d132_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3384_c41_4929_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3383_c41_5e52_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3385_c41_90b5_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3393_c41_e4ad_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3351_c41_f088_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3399_c41_933e_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3355_c41_d0da_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3359_c41_65f1_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3342_c41_b664_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3341_c41_3785_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3380_c41_442b_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3361_c41_715d_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3391_c41_5337_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3357_c41_ca08_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3346_c41_4464_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3345_c41_c95c_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3349_c41_720d_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3402_c41_b730_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3382_c41_0032_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3381_c41_3660_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3377_c41_92a5_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3373_c41_818b_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3389_c41_5f15_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3348_c41_4296_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3347_c41_d898_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3334_c41_255d_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3335_c41_2244_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3340_c41_a236_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3339_c41_8576_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3377_c41_92a5_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3388_c41_5db5_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3387_c41_7e0f_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3396_c41_3895_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3395_c41_d132_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3384_c41_4929_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3383_c41_5e52_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3385_c41_90b5_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3393_c41_e4ad_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3351_c41_f088_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3399_c41_933e_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3355_c41_d0da_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3359_c41_65f1_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3342_c41_b664_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3341_c41_3785_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3334_c41_255d_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3335_c41_2244_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3380_c41_442b_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3340_c41_a236_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3339_c41_8576_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3361_c41_715d_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3391_c41_5337_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3357_c41_ca08_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3346_c41_4464_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3345_c41_c95c_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3349_c41_720d_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3402_c41_b730_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3382_c41_0032_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3381_c41_3660_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3377_c41_92a5_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3373_c41_818b_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3389_c41_5f15_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3348_c41_4296_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3347_c41_d898_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3334_c41_255d_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3335_c41_2244_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3380_c41_442b_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3340_c41_a236_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3339_c41_8576_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3388_c41_5db5_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3387_c41_7e0f_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3396_c41_3895_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3395_c41_d132_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3384_c41_4929_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3383_c41_5e52_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3385_c41_90b5_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3393_c41_e4ad_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3351_c41_f088_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3399_c41_933e_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3355_c41_d0da_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3359_c41_65f1_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3342_c41_b664_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3341_c41_3785_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3334_c41_255d_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3380_c41_442b_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3361_c41_715d_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3391_c41_5337_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3357_c41_ca08_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3346_c41_4464_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3345_c41_c95c_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3349_c41_720d_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3402_c41_b730_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3382_c41_0032_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3381_c41_3660_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3377_c41_92a5_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3373_c41_818b_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3389_c41_5f15_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3348_c41_4296_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3347_c41_d898_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l3328_c41_d027] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_left;
     BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output := BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3328_c10_5a56] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_left;
     BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output := BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3333_c2_e1e6] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3333_c2_e1e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3328_c57_3aef] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3328_c57_3aef_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3329_c18_b84d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_left;
     BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output := BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c10_5a56_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3329_c18_b84d_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3328_c57_3aef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3333_c2_e1e6_return_output;
     -- CONST_SL_4[uxn_opcodes_h_l3328_c57_8c98] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output := CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3328_c30_aace] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3328_c30_aace_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3328_c41_d027_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3328_c10_31e9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_left;
     BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output := BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3329_c18_3092] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_left;
     BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output := BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3328_c10_31e9_return_output;
     VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3329_c18_3092_return_output;
     VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3328_c30_aace_return_output;
     VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3328_c57_8c98_return_output;
     -- MUX[uxn_opcodes_h_l3328_c10_cbb9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3328_c10_cbb9_cond <= VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_cond;
     MUX_uxn_opcodes_h_l3328_c10_cbb9_iftrue <= VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_iftrue;
     MUX_uxn_opcodes_h_l3328_c10_cbb9_iffalse <= VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output := MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output;

     -- MUX[uxn_opcodes_h_l3329_c18_ec96] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3329_c18_ec96_cond <= VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_cond;
     MUX_uxn_opcodes_h_l3329_c18_ec96_iftrue <= VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_iftrue;
     MUX_uxn_opcodes_h_l3329_c18_ec96_iffalse <= VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_return_output := MUX_uxn_opcodes_h_l3329_c18_ec96_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3328_c2_87b5 := VAR_MUX_uxn_opcodes_h_l3328_c10_cbb9_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_left := VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l3329_c18_ec96_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_left := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3328_c2_87b5;
     VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg1 := resize(VAR_opc_uxn_opcodes_h_l3328_c2_87b5, 32);
     VAR_printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_arg0 := resize(VAR_opc_uxn_opcodes_h_l3328_c2_87b5, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3333_c6_1ffa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3397_c11_777a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3368_c11_f383] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_left;
     BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output := BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3402_c11_2ebd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3353_c11_75ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3334_c11_e511] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_left;
     BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output := BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3364_c11_1822] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_left;
     BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output := BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3344_c11_bced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_left;
     BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output := BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3375_c11_af7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3380_c11_a9c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3338_c11_b1eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3392_c11_fcc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3376_c11_c9e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3343_c11_043d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3346_c11_04c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3371_c11_b200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_left;
     BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output := BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3393_c11_c37d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3352_c11_ef8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3369_c11_33a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3337_c11_1dc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3362_c11_f9d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3367_c11_3447] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_left;
     BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output := BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3347_c11_3f7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3351_c11_fba3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3398_c11_aa3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3391_c11_2b35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_left;
     BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output := BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3373_c11_bf06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_left;
     BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output := BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3365_c11_1787] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_left;
     BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output := BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3386_c11_4575] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_left;
     BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output := BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3370_c11_4bcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3359_c11_a063] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_left;
     BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output := BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3387_c11_209a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3335_c11_51f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3395_c11_a595] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_left;
     BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output := BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3394_c11_9f5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3363_c11_0202] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_left;
     BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output := BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3381_c11_c8b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3350_c11_65be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_left;
     BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output := BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3388_c11_0fec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_left;
     BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output := BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output;

     -- printf_uxn_opcodes_h_l3331_c2_e6b8[uxn_opcodes_h_l3331_c2_e6b8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg0 <= VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg0;
     printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg1 <= VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg1;
     printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg2 <= VAR_printf_uxn_opcodes_h_l3331_c2_e6b8_uxn_opcodes_h_l3331_c2_e6b8_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3339_c11_9565] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_left;
     BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output := BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3358_c11_9292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_left;
     BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output := BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3379_c11_ecef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_left;
     BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output := BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3361_c11_60f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3389_c11_1756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_left;
     BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output := BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3366_c11_b924] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_left;
     BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output := BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3385_c11_9ea8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3390_c11_86b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3355_c11_635e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3378_c11_8d7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3342_c11_1bbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3399_c11_cafa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3400_c11_eeb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3383_c11_ff3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3401_c11_b0b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3384_c11_e5d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3345_c11_d435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_left;
     BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output := BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3357_c11_db4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3348_c11_6c9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3341_c11_096c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3374_c11_13f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3356_c11_e0f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3372_c11_d864] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_left;
     BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output := BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3354_c11_a6cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3349_c11_058d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3336_c11_4d96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_left;
     BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output := BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3340_c11_e489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_left;
     BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output := BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3382_c11_2cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_left;
     BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output := BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3396_c11_604f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3360_c11_a075] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_left;
     BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output := BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3377_c11_f68d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3333_c6_1ffa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3334_c11_e511_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3335_c11_51f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3336_c11_4d96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3337_c11_1dc6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3338_c11_b1eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3339_c11_9565_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3340_c11_e489_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3341_c11_096c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3342_c11_1bbf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3343_c11_043d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3344_c11_bced_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3345_c11_d435_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3346_c11_04c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3347_c11_3f7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3348_c11_6c9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3349_c11_058d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3350_c11_65be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3351_c11_fba3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3352_c11_ef8c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3353_c11_75ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3354_c11_a6cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3355_c11_635e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3356_c11_e0f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3357_c11_db4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3358_c11_9292_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3359_c11_a063_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3360_c11_a075_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3361_c11_60f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3362_c11_f9d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3363_c11_0202_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3364_c11_1822_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3365_c11_1787_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3366_c11_b924_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3367_c11_3447_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3368_c11_f383_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3369_c11_33a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3370_c11_4bcb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3371_c11_b200_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3372_c11_d864_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3373_c11_bf06_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3374_c11_13f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3375_c11_af7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3376_c11_c9e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3377_c11_f68d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3378_c11_8d7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3379_c11_ecef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3380_c11_a9c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3381_c11_c8b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3382_c11_2cac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3383_c11_ff3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3384_c11_e5d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3385_c11_9ea8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3386_c11_4575_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3387_c11_209a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3388_c11_0fec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3389_c11_1756_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3390_c11_86b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3391_c11_2b35_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3392_c11_fcc0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3393_c11_c37d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3394_c11_9f5e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3395_c11_a595_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3396_c11_604f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3397_c11_777a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3398_c11_aa3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3399_c11_cafa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3400_c11_eeb3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3401_c11_b0b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3402_c11_2ebd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c7_d569] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c7_d569_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c7_7ad6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3334_c1_cc49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output;
     VAR_jci_uxn_opcodes_h_l3334_c41_255d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3334_c1_cc49_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3335_c1_0016] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c7_b567] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output;

     -- jci[uxn_opcodes_h_l3334_c41_255d] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3334_c41_255d_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3334_c41_255d_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3334_c41_255d_phase <= VAR_jci_uxn_opcodes_h_l3334_c41_255d_phase;
     jci_uxn_opcodes_h_l3334_c41_255d_pc <= VAR_jci_uxn_opcodes_h_l3334_c41_255d_pc;
     jci_uxn_opcodes_h_l3334_c41_255d_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3334_c41_255d_previous_stack_read;
     jci_uxn_opcodes_h_l3334_c41_255d_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3334_c41_255d_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3334_c41_255d_return_output := jci_uxn_opcodes_h_l3334_c41_255d_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c7_b567_return_output;
     VAR_jmi_uxn_opcodes_h_l3335_c41_2244_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3335_c1_0016_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue := VAR_jci_uxn_opcodes_h_l3334_c41_255d_return_output;
     -- jmi[uxn_opcodes_h_l3335_c41_2244] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3335_c41_2244_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3335_c41_2244_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3335_c41_2244_phase <= VAR_jmi_uxn_opcodes_h_l3335_c41_2244_phase;
     jmi_uxn_opcodes_h_l3335_c41_2244_pc <= VAR_jmi_uxn_opcodes_h_l3335_c41_2244_pc;
     jmi_uxn_opcodes_h_l3335_c41_2244_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3335_c41_2244_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3335_c41_2244_return_output := jmi_uxn_opcodes_h_l3335_c41_2244_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3336_c1_c77f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c7_e43c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output;
     VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3336_c1_c77f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue := VAR_jmi_uxn_opcodes_h_l3335_c41_2244_return_output;
     -- jsi[uxn_opcodes_h_l3336_c41_d14a] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3336_c41_d14a_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3336_c41_d14a_phase <= VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_phase;
     jsi_uxn_opcodes_h_l3336_c41_d14a_pc <= VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_pc;
     jsi_uxn_opcodes_h_l3336_c41_d14a_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_return_output := jsi_uxn_opcodes_h_l3336_c41_d14a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3337_c1_98c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c7_07cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output;
     VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3337_c1_98c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue := VAR_jsi_uxn_opcodes_h_l3336_c41_d14a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3338_c1_ef7f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output;

     -- lit[uxn_opcodes_h_l3337_c41_1a1c] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3337_c41_1a1c_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3337_c41_1a1c_phase <= VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_phase;
     lit_uxn_opcodes_h_l3337_c41_1a1c_pc <= VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_pc;
     lit_uxn_opcodes_h_l3337_c41_1a1c_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_return_output := lit_uxn_opcodes_h_l3337_c41_1a1c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c7_21d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output;
     VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3338_c1_ef7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue := VAR_lit_uxn_opcodes_h_l3337_c41_1a1c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3339_c1_aef0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output;

     -- lit2[uxn_opcodes_h_l3338_c41_e8ad] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3338_c41_e8ad_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3338_c41_e8ad_phase <= VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_phase;
     lit2_uxn_opcodes_h_l3338_c41_e8ad_pc <= VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_pc;
     lit2_uxn_opcodes_h_l3338_c41_e8ad_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output := lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c7_ef2e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output;
     VAR_lit_uxn_opcodes_h_l3339_c41_8576_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3339_c1_aef0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue := VAR_lit2_uxn_opcodes_h_l3338_c41_e8ad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3340_c1_3696] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c7_3b56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output;

     -- lit[uxn_opcodes_h_l3339_c41_8576] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3339_c41_8576_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3339_c41_8576_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3339_c41_8576_phase <= VAR_lit_uxn_opcodes_h_l3339_c41_8576_phase;
     lit_uxn_opcodes_h_l3339_c41_8576_pc <= VAR_lit_uxn_opcodes_h_l3339_c41_8576_pc;
     lit_uxn_opcodes_h_l3339_c41_8576_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3339_c41_8576_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3339_c41_8576_return_output := lit_uxn_opcodes_h_l3339_c41_8576_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output;
     VAR_lit2_uxn_opcodes_h_l3340_c41_a236_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3340_c1_3696_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue := VAR_lit_uxn_opcodes_h_l3339_c41_8576_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c7_2284] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output;

     -- lit2[uxn_opcodes_h_l3340_c41_a236] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3340_c41_a236_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3340_c41_a236_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3340_c41_a236_phase <= VAR_lit2_uxn_opcodes_h_l3340_c41_a236_phase;
     lit2_uxn_opcodes_h_l3340_c41_a236_pc <= VAR_lit2_uxn_opcodes_h_l3340_c41_a236_pc;
     lit2_uxn_opcodes_h_l3340_c41_a236_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3340_c41_a236_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3340_c41_a236_return_output := lit2_uxn_opcodes_h_l3340_c41_a236_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3341_c1_c3e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c7_2284_return_output;
     VAR_inc_uxn_opcodes_h_l3341_c41_3785_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3341_c1_c3e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue := VAR_lit2_uxn_opcodes_h_l3340_c41_a236_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c7_0a0b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3342_c1_99c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output;

     -- inc[uxn_opcodes_h_l3341_c41_3785] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3341_c41_3785_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3341_c41_3785_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3341_c41_3785_phase <= VAR_inc_uxn_opcodes_h_l3341_c41_3785_phase;
     inc_uxn_opcodes_h_l3341_c41_3785_ins <= VAR_inc_uxn_opcodes_h_l3341_c41_3785_ins;
     inc_uxn_opcodes_h_l3341_c41_3785_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3341_c41_3785_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3341_c41_3785_return_output := inc_uxn_opcodes_h_l3341_c41_3785_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output;
     VAR_inc2_uxn_opcodes_h_l3342_c41_b664_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3342_c1_99c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue := VAR_inc_uxn_opcodes_h_l3341_c41_3785_return_output;
     -- inc2[uxn_opcodes_h_l3342_c41_b664] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3342_c41_b664_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3342_c41_b664_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3342_c41_b664_phase <= VAR_inc2_uxn_opcodes_h_l3342_c41_b664_phase;
     inc2_uxn_opcodes_h_l3342_c41_b664_ins <= VAR_inc2_uxn_opcodes_h_l3342_c41_b664_ins;
     inc2_uxn_opcodes_h_l3342_c41_b664_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3342_c41_b664_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3342_c41_b664_return_output := inc2_uxn_opcodes_h_l3342_c41_b664_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c7_56d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3343_c1_4a3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output;
     VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3343_c1_4a3d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue := VAR_inc2_uxn_opcodes_h_l3342_c41_b664_return_output;
     -- pop[uxn_opcodes_h_l3343_c41_e5d2] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3343_c41_e5d2_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3343_c41_e5d2_phase <= VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_phase;
     pop_uxn_opcodes_h_l3343_c41_e5d2_ins <= VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_return_output := pop_uxn_opcodes_h_l3343_c41_e5d2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3344_c1_dd8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c7_91d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output;
     VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3344_c1_dd8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue := VAR_pop_uxn_opcodes_h_l3343_c41_e5d2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c7_baf0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output;

     -- pop2[uxn_opcodes_h_l3344_c41_9c27] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3344_c41_9c27_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3344_c41_9c27_phase <= VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_phase;
     pop2_uxn_opcodes_h_l3344_c41_9c27_ins <= VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_return_output := pop2_uxn_opcodes_h_l3344_c41_9c27_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3345_c1_34a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output;
     VAR_nip_uxn_opcodes_h_l3345_c41_c95c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3345_c1_34a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue := VAR_pop2_uxn_opcodes_h_l3344_c41_9c27_return_output;
     -- nip[uxn_opcodes_h_l3345_c41_c95c] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3345_c41_c95c_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3345_c41_c95c_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3345_c41_c95c_phase <= VAR_nip_uxn_opcodes_h_l3345_c41_c95c_phase;
     nip_uxn_opcodes_h_l3345_c41_c95c_ins <= VAR_nip_uxn_opcodes_h_l3345_c41_c95c_ins;
     nip_uxn_opcodes_h_l3345_c41_c95c_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3345_c41_c95c_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3345_c41_c95c_return_output := nip_uxn_opcodes_h_l3345_c41_c95c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c7_489e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3346_c1_4a03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c7_489e_return_output;
     VAR_nip2_uxn_opcodes_h_l3346_c41_4464_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3346_c1_4a03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue := VAR_nip_uxn_opcodes_h_l3345_c41_c95c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c7_c22e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output;

     -- nip2[uxn_opcodes_h_l3346_c41_4464] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3346_c41_4464_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3346_c41_4464_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3346_c41_4464_phase <= VAR_nip2_uxn_opcodes_h_l3346_c41_4464_phase;
     nip2_uxn_opcodes_h_l3346_c41_4464_ins <= VAR_nip2_uxn_opcodes_h_l3346_c41_4464_ins;
     nip2_uxn_opcodes_h_l3346_c41_4464_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3346_c41_4464_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3346_c41_4464_return_output := nip2_uxn_opcodes_h_l3346_c41_4464_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3347_c1_d2fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output;
     VAR_swp_uxn_opcodes_h_l3347_c41_d898_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3347_c1_d2fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue := VAR_nip2_uxn_opcodes_h_l3346_c41_4464_return_output;
     -- swp[uxn_opcodes_h_l3347_c41_d898] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3347_c41_d898_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3347_c41_d898_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3347_c41_d898_phase <= VAR_swp_uxn_opcodes_h_l3347_c41_d898_phase;
     swp_uxn_opcodes_h_l3347_c41_d898_ins <= VAR_swp_uxn_opcodes_h_l3347_c41_d898_ins;
     swp_uxn_opcodes_h_l3347_c41_d898_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3347_c41_d898_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3347_c41_d898_return_output := swp_uxn_opcodes_h_l3347_c41_d898_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c7_291c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3348_c1_e940] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c7_291c_return_output;
     VAR_swp2_uxn_opcodes_h_l3348_c41_4296_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3348_c1_e940_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue := VAR_swp_uxn_opcodes_h_l3347_c41_d898_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3349_c1_9251] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output;

     -- swp2[uxn_opcodes_h_l3348_c41_4296] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3348_c41_4296_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3348_c41_4296_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3348_c41_4296_phase <= VAR_swp2_uxn_opcodes_h_l3348_c41_4296_phase;
     swp2_uxn_opcodes_h_l3348_c41_4296_ins <= VAR_swp2_uxn_opcodes_h_l3348_c41_4296_ins;
     swp2_uxn_opcodes_h_l3348_c41_4296_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3348_c41_4296_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3348_c41_4296_return_output := swp2_uxn_opcodes_h_l3348_c41_4296_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c7_04e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output;
     VAR_rot_uxn_opcodes_h_l3349_c41_720d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3349_c1_9251_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue := VAR_swp2_uxn_opcodes_h_l3348_c41_4296_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3350_c1_c94b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c7_4d65] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output;

     -- rot[uxn_opcodes_h_l3349_c41_720d] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3349_c41_720d_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3349_c41_720d_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3349_c41_720d_phase <= VAR_rot_uxn_opcodes_h_l3349_c41_720d_phase;
     rot_uxn_opcodes_h_l3349_c41_720d_ins <= VAR_rot_uxn_opcodes_h_l3349_c41_720d_ins;
     rot_uxn_opcodes_h_l3349_c41_720d_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3349_c41_720d_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3349_c41_720d_return_output := rot_uxn_opcodes_h_l3349_c41_720d_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output;
     VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3350_c1_c94b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue := VAR_rot_uxn_opcodes_h_l3349_c41_720d_return_output;
     -- rot2[uxn_opcodes_h_l3350_c41_56ae] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3350_c41_56ae_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3350_c41_56ae_phase <= VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_phase;
     rot2_uxn_opcodes_h_l3350_c41_56ae_ins <= VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_ins;
     rot2_uxn_opcodes_h_l3350_c41_56ae_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_return_output := rot2_uxn_opcodes_h_l3350_c41_56ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c7_0056] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3351_c1_d844] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c7_0056_return_output;
     VAR_dup_uxn_opcodes_h_l3351_c41_f088_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3351_c1_d844_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue := VAR_rot2_uxn_opcodes_h_l3350_c41_56ae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c7_1955] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3352_c1_6635] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output;

     -- dup[uxn_opcodes_h_l3351_c41_f088] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3351_c41_f088_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3351_c41_f088_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3351_c41_f088_phase <= VAR_dup_uxn_opcodes_h_l3351_c41_f088_phase;
     dup_uxn_opcodes_h_l3351_c41_f088_ins <= VAR_dup_uxn_opcodes_h_l3351_c41_f088_ins;
     dup_uxn_opcodes_h_l3351_c41_f088_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3351_c41_f088_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3351_c41_f088_return_output := dup_uxn_opcodes_h_l3351_c41_f088_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c7_1955_return_output;
     VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3352_c1_6635_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue := VAR_dup_uxn_opcodes_h_l3351_c41_f088_return_output;
     -- dup2[uxn_opcodes_h_l3352_c41_6f4f] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3352_c41_6f4f_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3352_c41_6f4f_phase <= VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_phase;
     dup2_uxn_opcodes_h_l3352_c41_6f4f_ins <= VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_ins;
     dup2_uxn_opcodes_h_l3352_c41_6f4f_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output := dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3353_c1_89db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c7_7591] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c7_7591_return_output;
     VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3353_c1_89db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue := VAR_dup2_uxn_opcodes_h_l3352_c41_6f4f_return_output;
     -- ovr[uxn_opcodes_h_l3353_c41_7f51] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3353_c41_7f51_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3353_c41_7f51_phase <= VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_phase;
     ovr_uxn_opcodes_h_l3353_c41_7f51_ins <= VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_ins;
     ovr_uxn_opcodes_h_l3353_c41_7f51_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_return_output := ovr_uxn_opcodes_h_l3353_c41_7f51_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3355_c7_f840] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3354_c1_506b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c7_f840_return_output;
     VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3354_c1_506b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue := VAR_ovr_uxn_opcodes_h_l3353_c41_7f51_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3356_c7_e29e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output;

     -- ovr2[uxn_opcodes_h_l3354_c41_3006] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3354_c41_3006_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3354_c41_3006_phase <= VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_phase;
     ovr2_uxn_opcodes_h_l3354_c41_3006_ins <= VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_ins;
     ovr2_uxn_opcodes_h_l3354_c41_3006_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_return_output := ovr2_uxn_opcodes_h_l3354_c41_3006_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3355_c1_1a53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output;
     VAR_equ_uxn_opcodes_h_l3355_c41_d0da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3355_c1_1a53_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue := VAR_ovr2_uxn_opcodes_h_l3354_c41_3006_return_output;
     -- equ[uxn_opcodes_h_l3355_c41_d0da] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3355_c41_d0da_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3355_c41_d0da_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3355_c41_d0da_phase <= VAR_equ_uxn_opcodes_h_l3355_c41_d0da_phase;
     equ_uxn_opcodes_h_l3355_c41_d0da_ins <= VAR_equ_uxn_opcodes_h_l3355_c41_d0da_ins;
     equ_uxn_opcodes_h_l3355_c41_d0da_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3355_c41_d0da_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3355_c41_d0da_return_output := equ_uxn_opcodes_h_l3355_c41_d0da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3357_c7_775e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3356_c1_c710] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c7_775e_return_output;
     VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3356_c1_c710_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue := VAR_equ_uxn_opcodes_h_l3355_c41_d0da_return_output;
     -- equ2[uxn_opcodes_h_l3356_c41_52fa] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3356_c41_52fa_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3356_c41_52fa_phase <= VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_phase;
     equ2_uxn_opcodes_h_l3356_c41_52fa_ins <= VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_ins;
     equ2_uxn_opcodes_h_l3356_c41_52fa_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_return_output := equ2_uxn_opcodes_h_l3356_c41_52fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3357_c1_48ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3358_c7_467d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c7_467d_return_output;
     VAR_neq_uxn_opcodes_h_l3357_c41_ca08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3357_c1_48ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue := VAR_equ2_uxn_opcodes_h_l3356_c41_52fa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3359_c7_a139] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output;

     -- neq[uxn_opcodes_h_l3357_c41_ca08] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3357_c41_ca08_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3357_c41_ca08_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3357_c41_ca08_phase <= VAR_neq_uxn_opcodes_h_l3357_c41_ca08_phase;
     neq_uxn_opcodes_h_l3357_c41_ca08_ins <= VAR_neq_uxn_opcodes_h_l3357_c41_ca08_ins;
     neq_uxn_opcodes_h_l3357_c41_ca08_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3357_c41_ca08_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3357_c41_ca08_return_output := neq_uxn_opcodes_h_l3357_c41_ca08_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3358_c1_55d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c7_a139_return_output;
     VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3358_c1_55d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue := VAR_neq_uxn_opcodes_h_l3357_c41_ca08_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3359_c1_19e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output;

     -- neq2[uxn_opcodes_h_l3358_c41_7fc2] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3358_c41_7fc2_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3358_c41_7fc2_phase <= VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_phase;
     neq2_uxn_opcodes_h_l3358_c41_7fc2_ins <= VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_ins;
     neq2_uxn_opcodes_h_l3358_c41_7fc2_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output := neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3360_c7_fa68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output;
     VAR_gth_uxn_opcodes_h_l3359_c41_65f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3359_c1_19e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue := VAR_neq2_uxn_opcodes_h_l3358_c41_7fc2_return_output;
     -- gth[uxn_opcodes_h_l3359_c41_65f1] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3359_c41_65f1_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3359_c41_65f1_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3359_c41_65f1_phase <= VAR_gth_uxn_opcodes_h_l3359_c41_65f1_phase;
     gth_uxn_opcodes_h_l3359_c41_65f1_ins <= VAR_gth_uxn_opcodes_h_l3359_c41_65f1_ins;
     gth_uxn_opcodes_h_l3359_c41_65f1_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3359_c41_65f1_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3359_c41_65f1_return_output := gth_uxn_opcodes_h_l3359_c41_65f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3360_c1_f8da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3361_c7_446d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c7_446d_return_output;
     VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3360_c1_f8da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue := VAR_gth_uxn_opcodes_h_l3359_c41_65f1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3361_c1_ee8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3362_c7_0421] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output;

     -- gth2[uxn_opcodes_h_l3360_c41_9f17] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3360_c41_9f17_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3360_c41_9f17_phase <= VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_phase;
     gth2_uxn_opcodes_h_l3360_c41_9f17_ins <= VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_ins;
     gth2_uxn_opcodes_h_l3360_c41_9f17_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_return_output := gth2_uxn_opcodes_h_l3360_c41_9f17_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c7_0421_return_output;
     VAR_lth_uxn_opcodes_h_l3361_c41_715d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3361_c1_ee8f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue := VAR_gth2_uxn_opcodes_h_l3360_c41_9f17_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3363_c7_93ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3362_c1_da07] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output;

     -- lth[uxn_opcodes_h_l3361_c41_715d] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3361_c41_715d_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3361_c41_715d_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3361_c41_715d_phase <= VAR_lth_uxn_opcodes_h_l3361_c41_715d_phase;
     lth_uxn_opcodes_h_l3361_c41_715d_ins <= VAR_lth_uxn_opcodes_h_l3361_c41_715d_ins;
     lth_uxn_opcodes_h_l3361_c41_715d_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3361_c41_715d_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3361_c41_715d_return_output := lth_uxn_opcodes_h_l3361_c41_715d_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output;
     VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3362_c1_da07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue := VAR_lth_uxn_opcodes_h_l3361_c41_715d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3363_c1_e0e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3364_c7_cd4c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output;

     -- lth2[uxn_opcodes_h_l3362_c41_b16e] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3362_c41_b16e_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3362_c41_b16e_phase <= VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_phase;
     lth2_uxn_opcodes_h_l3362_c41_b16e_ins <= VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_ins;
     lth2_uxn_opcodes_h_l3362_c41_b16e_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_return_output := lth2_uxn_opcodes_h_l3362_c41_b16e_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output;
     VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3363_c1_e0e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue := VAR_lth2_uxn_opcodes_h_l3362_c41_b16e_return_output;
     -- jmp[uxn_opcodes_h_l3363_c41_ead6] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3363_c41_ead6_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3363_c41_ead6_phase <= VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_phase;
     jmp_uxn_opcodes_h_l3363_c41_ead6_ins <= VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_ins;
     jmp_uxn_opcodes_h_l3363_c41_ead6_pc <= VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_pc;
     jmp_uxn_opcodes_h_l3363_c41_ead6_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_return_output := jmp_uxn_opcodes_h_l3363_c41_ead6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3365_c7_2ebf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3364_c1_75b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output;
     VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3364_c1_75b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue := VAR_jmp_uxn_opcodes_h_l3363_c41_ead6_return_output;
     -- jmp2[uxn_opcodes_h_l3364_c41_78bc] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3364_c41_78bc_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3364_c41_78bc_phase <= VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_phase;
     jmp2_uxn_opcodes_h_l3364_c41_78bc_ins <= VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_ins;
     jmp2_uxn_opcodes_h_l3364_c41_78bc_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output := jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3366_c7_0418] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3365_c1_bf1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c7_0418_return_output;
     VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3365_c1_bf1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue := VAR_jmp2_uxn_opcodes_h_l3364_c41_78bc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3367_c7_bc72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output;

     -- jcn[uxn_opcodes_h_l3365_c41_f3b5] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3365_c41_f3b5_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3365_c41_f3b5_phase <= VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_phase;
     jcn_uxn_opcodes_h_l3365_c41_f3b5_ins <= VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_ins;
     jcn_uxn_opcodes_h_l3365_c41_f3b5_pc <= VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_pc;
     jcn_uxn_opcodes_h_l3365_c41_f3b5_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output := jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3366_c1_1145] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output;
     VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3366_c1_1145_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue := VAR_jcn_uxn_opcodes_h_l3365_c41_f3b5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3367_c1_c449] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3368_c7_ac1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output;

     -- jcn2[uxn_opcodes_h_l3366_c41_35c4] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3366_c41_35c4_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3366_c41_35c4_phase <= VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_phase;
     jcn2_uxn_opcodes_h_l3366_c41_35c4_ins <= VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_ins;
     jcn2_uxn_opcodes_h_l3366_c41_35c4_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output := jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output;
     VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3367_c1_c449_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue := VAR_jcn2_uxn_opcodes_h_l3366_c41_35c4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3368_c1_1516] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3369_c7_8412] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output;

     -- jsr[uxn_opcodes_h_l3367_c41_fbc2] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3367_c41_fbc2_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3367_c41_fbc2_phase <= VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_phase;
     jsr_uxn_opcodes_h_l3367_c41_fbc2_ins <= VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_ins;
     jsr_uxn_opcodes_h_l3367_c41_fbc2_pc <= VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_pc;
     jsr_uxn_opcodes_h_l3367_c41_fbc2_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output := jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c7_8412_return_output;
     VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3368_c1_1516_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue := VAR_jsr_uxn_opcodes_h_l3367_c41_fbc2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3369_c1_e38f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3370_c7_2c71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output;

     -- jsr2[uxn_opcodes_h_l3368_c41_2ee2] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3368_c41_2ee2_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3368_c41_2ee2_phase <= VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_phase;
     jsr2_uxn_opcodes_h_l3368_c41_2ee2_ins <= VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_ins;
     jsr2_uxn_opcodes_h_l3368_c41_2ee2_pc <= VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_pc;
     jsr2_uxn_opcodes_h_l3368_c41_2ee2_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output := jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output;
     VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3369_c1_e38f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue := VAR_jsr2_uxn_opcodes_h_l3368_c41_2ee2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3371_c7_7fa4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output;

     -- sth[uxn_opcodes_h_l3369_c41_d1d5] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3369_c41_d1d5_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3369_c41_d1d5_phase <= VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_phase;
     sth_uxn_opcodes_h_l3369_c41_d1d5_ins <= VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_ins;
     sth_uxn_opcodes_h_l3369_c41_d1d5_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_return_output := sth_uxn_opcodes_h_l3369_c41_d1d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3370_c1_ffbc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output;
     VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3370_c1_ffbc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue := VAR_sth_uxn_opcodes_h_l3369_c41_d1d5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3372_c7_0d4a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output;

     -- sth2[uxn_opcodes_h_l3370_c41_4a6b] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3370_c41_4a6b_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3370_c41_4a6b_phase <= VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_phase;
     sth2_uxn_opcodes_h_l3370_c41_4a6b_ins <= VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_ins;
     sth2_uxn_opcodes_h_l3370_c41_4a6b_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output := sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3371_c1_1d2c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output;
     VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3371_c1_1d2c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue := VAR_sth2_uxn_opcodes_h_l3370_c41_4a6b_return_output;
     -- ldz[uxn_opcodes_h_l3371_c41_bb2f] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3371_c41_bb2f_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3371_c41_bb2f_phase <= VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_phase;
     ldz_uxn_opcodes_h_l3371_c41_bb2f_ins <= VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_ins;
     ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_stack_read;
     ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output := ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3372_c1_a313] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3373_c7_7bf5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output;
     VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3372_c1_a313_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue := VAR_ldz_uxn_opcodes_h_l3371_c41_bb2f_return_output;
     -- ldz2[uxn_opcodes_h_l3372_c41_da99] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3372_c41_da99_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3372_c41_da99_phase <= VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_phase;
     ldz2_uxn_opcodes_h_l3372_c41_da99_ins <= VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_ins;
     ldz2_uxn_opcodes_h_l3372_c41_da99_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_previous_stack_read;
     ldz2_uxn_opcodes_h_l3372_c41_da99_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_return_output := ldz2_uxn_opcodes_h_l3372_c41_da99_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3374_c7_2840] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3373_c1_52a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c7_2840_return_output;
     VAR_stz_uxn_opcodes_h_l3373_c41_818b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3373_c1_52a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue := VAR_ldz2_uxn_opcodes_h_l3372_c41_da99_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3374_c1_4d38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output;

     -- stz[uxn_opcodes_h_l3373_c41_818b] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3373_c41_818b_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3373_c41_818b_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3373_c41_818b_phase <= VAR_stz_uxn_opcodes_h_l3373_c41_818b_phase;
     stz_uxn_opcodes_h_l3373_c41_818b_ins <= VAR_stz_uxn_opcodes_h_l3373_c41_818b_ins;
     stz_uxn_opcodes_h_l3373_c41_818b_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3373_c41_818b_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3373_c41_818b_return_output := stz_uxn_opcodes_h_l3373_c41_818b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3375_c7_8894] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c7_8894_return_output;
     VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3374_c1_4d38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue := VAR_stz_uxn_opcodes_h_l3373_c41_818b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3375_c1_504b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3376_c7_ac60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output;

     -- stz2[uxn_opcodes_h_l3374_c41_73fa] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3374_c41_73fa_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3374_c41_73fa_phase <= VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_phase;
     stz2_uxn_opcodes_h_l3374_c41_73fa_ins <= VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_ins;
     stz2_uxn_opcodes_h_l3374_c41_73fa_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_return_output := stz2_uxn_opcodes_h_l3374_c41_73fa_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output;
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3375_c1_504b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue := VAR_stz2_uxn_opcodes_h_l3374_c41_73fa_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3376_c1_81f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output;

     -- ldr[uxn_opcodes_h_l3375_c41_81b4] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3375_c41_81b4_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3375_c41_81b4_phase <= VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_phase;
     ldr_uxn_opcodes_h_l3375_c41_81b4_ins <= VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_ins;
     ldr_uxn_opcodes_h_l3375_c41_81b4_pc <= VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_pc;
     ldr_uxn_opcodes_h_l3375_c41_81b4_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_previous_stack_read;
     ldr_uxn_opcodes_h_l3375_c41_81b4_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_return_output := ldr_uxn_opcodes_h_l3375_c41_81b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3377_c7_a59e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output;
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3376_c1_81f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue := VAR_ldr_uxn_opcodes_h_l3375_c41_81b4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3377_c1_5d00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output;

     -- ldr2[uxn_opcodes_h_l3376_c41_7cba] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3376_c41_7cba_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3376_c41_7cba_phase <= VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_phase;
     ldr2_uxn_opcodes_h_l3376_c41_7cba_ins <= VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_ins;
     ldr2_uxn_opcodes_h_l3376_c41_7cba_pc <= VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_pc;
     ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_stack_read;
     ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output := ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3378_c7_8e25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output;
     VAR_str1_uxn_opcodes_h_l3377_c41_92a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3377_c1_5d00_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue := VAR_ldr2_uxn_opcodes_h_l3376_c41_7cba_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3378_c1_29d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output;

     -- str1[uxn_opcodes_h_l3377_c41_92a5] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3377_c41_92a5_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3377_c41_92a5_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3377_c41_92a5_phase <= VAR_str1_uxn_opcodes_h_l3377_c41_92a5_phase;
     str1_uxn_opcodes_h_l3377_c41_92a5_ins <= VAR_str1_uxn_opcodes_h_l3377_c41_92a5_ins;
     str1_uxn_opcodes_h_l3377_c41_92a5_pc <= VAR_str1_uxn_opcodes_h_l3377_c41_92a5_pc;
     str1_uxn_opcodes_h_l3377_c41_92a5_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3377_c41_92a5_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3377_c41_92a5_return_output := str1_uxn_opcodes_h_l3377_c41_92a5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3379_c7_c196] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c7_c196_return_output;
     VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3378_c1_29d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue := VAR_str1_uxn_opcodes_h_l3377_c41_92a5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3380_c7_6d84] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output;

     -- str2[uxn_opcodes_h_l3378_c41_8eb6] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3378_c41_8eb6_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3378_c41_8eb6_phase <= VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_phase;
     str2_uxn_opcodes_h_l3378_c41_8eb6_ins <= VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_ins;
     str2_uxn_opcodes_h_l3378_c41_8eb6_pc <= VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_pc;
     str2_uxn_opcodes_h_l3378_c41_8eb6_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_return_output := str2_uxn_opcodes_h_l3378_c41_8eb6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3379_c1_d12c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output;
     VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3379_c1_d12c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue := VAR_str2_uxn_opcodes_h_l3378_c41_8eb6_return_output;
     -- lda[uxn_opcodes_h_l3379_c41_e7d6] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3379_c41_e7d6_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3379_c41_e7d6_phase <= VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_phase;
     lda_uxn_opcodes_h_l3379_c41_e7d6_ins <= VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_ins;
     lda_uxn_opcodes_h_l3379_c41_e7d6_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_previous_stack_read;
     lda_uxn_opcodes_h_l3379_c41_e7d6_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_return_output := lda_uxn_opcodes_h_l3379_c41_e7d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3381_c7_e017] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3380_c1_0fc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c7_e017_return_output;
     VAR_lda2_uxn_opcodes_h_l3380_c41_442b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3380_c1_0fc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue := VAR_lda_uxn_opcodes_h_l3379_c41_e7d6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3382_c7_48cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output;

     -- lda2[uxn_opcodes_h_l3380_c41_442b] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3380_c41_442b_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3380_c41_442b_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3380_c41_442b_phase <= VAR_lda2_uxn_opcodes_h_l3380_c41_442b_phase;
     lda2_uxn_opcodes_h_l3380_c41_442b_ins <= VAR_lda2_uxn_opcodes_h_l3380_c41_442b_ins;
     lda2_uxn_opcodes_h_l3380_c41_442b_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3380_c41_442b_previous_stack_read;
     lda2_uxn_opcodes_h_l3380_c41_442b_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3380_c41_442b_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3380_c41_442b_return_output := lda2_uxn_opcodes_h_l3380_c41_442b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3381_c1_f05d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output;
     VAR_sta_uxn_opcodes_h_l3381_c41_3660_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3381_c1_f05d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue := VAR_lda2_uxn_opcodes_h_l3380_c41_442b_return_output;
     -- sta[uxn_opcodes_h_l3381_c41_3660] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3381_c41_3660_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3381_c41_3660_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3381_c41_3660_phase <= VAR_sta_uxn_opcodes_h_l3381_c41_3660_phase;
     sta_uxn_opcodes_h_l3381_c41_3660_ins <= VAR_sta_uxn_opcodes_h_l3381_c41_3660_ins;
     sta_uxn_opcodes_h_l3381_c41_3660_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3381_c41_3660_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3381_c41_3660_return_output := sta_uxn_opcodes_h_l3381_c41_3660_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3383_c7_7e69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3382_c1_8208] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output;
     VAR_sta2_uxn_opcodes_h_l3382_c41_0032_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3382_c1_8208_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue := VAR_sta_uxn_opcodes_h_l3381_c41_3660_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3383_c1_b087] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output;

     -- sta2[uxn_opcodes_h_l3382_c41_0032] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3382_c41_0032_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3382_c41_0032_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3382_c41_0032_phase <= VAR_sta2_uxn_opcodes_h_l3382_c41_0032_phase;
     sta2_uxn_opcodes_h_l3382_c41_0032_ins <= VAR_sta2_uxn_opcodes_h_l3382_c41_0032_ins;
     sta2_uxn_opcodes_h_l3382_c41_0032_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3382_c41_0032_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3382_c41_0032_return_output := sta2_uxn_opcodes_h_l3382_c41_0032_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3384_c7_c41b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output;
     VAR_dei_uxn_opcodes_h_l3383_c41_5e52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3383_c1_b087_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue := VAR_sta2_uxn_opcodes_h_l3382_c41_0032_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3384_c1_5d16] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3385_c7_1e36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output;

     -- dei[uxn_opcodes_h_l3383_c41_5e52] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3383_c41_5e52_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3383_c41_5e52_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3383_c41_5e52_phase <= VAR_dei_uxn_opcodes_h_l3383_c41_5e52_phase;
     dei_uxn_opcodes_h_l3383_c41_5e52_ins <= VAR_dei_uxn_opcodes_h_l3383_c41_5e52_ins;
     dei_uxn_opcodes_h_l3383_c41_5e52_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3383_c41_5e52_previous_stack_read;
     dei_uxn_opcodes_h_l3383_c41_5e52_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3383_c41_5e52_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3383_c41_5e52_return_output := dei_uxn_opcodes_h_l3383_c41_5e52_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output;
     VAR_dei2_uxn_opcodes_h_l3384_c41_4929_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3384_c1_5d16_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue := VAR_dei_uxn_opcodes_h_l3383_c41_5e52_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3386_c7_780c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3385_c1_fe49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output;

     -- dei2[uxn_opcodes_h_l3384_c41_4929] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3384_c41_4929_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3384_c41_4929_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3384_c41_4929_phase <= VAR_dei2_uxn_opcodes_h_l3384_c41_4929_phase;
     dei2_uxn_opcodes_h_l3384_c41_4929_ins <= VAR_dei2_uxn_opcodes_h_l3384_c41_4929_ins;
     dei2_uxn_opcodes_h_l3384_c41_4929_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3384_c41_4929_previous_stack_read;
     dei2_uxn_opcodes_h_l3384_c41_4929_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3384_c41_4929_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3384_c41_4929_return_output := dei2_uxn_opcodes_h_l3384_c41_4929_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c7_780c_return_output;
     VAR_deo_uxn_opcodes_h_l3385_c41_90b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3385_c1_fe49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue := VAR_dei2_uxn_opcodes_h_l3384_c41_4929_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3387_c7_3a9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output;

     -- deo[uxn_opcodes_h_l3385_c41_90b5] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3385_c41_90b5_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3385_c41_90b5_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3385_c41_90b5_phase <= VAR_deo_uxn_opcodes_h_l3385_c41_90b5_phase;
     deo_uxn_opcodes_h_l3385_c41_90b5_ins <= VAR_deo_uxn_opcodes_h_l3385_c41_90b5_ins;
     deo_uxn_opcodes_h_l3385_c41_90b5_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3385_c41_90b5_previous_stack_read;
     deo_uxn_opcodes_h_l3385_c41_90b5_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3385_c41_90b5_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3385_c41_90b5_return_output := deo_uxn_opcodes_h_l3385_c41_90b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3386_c1_6253] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output;
     VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3386_c1_6253_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue := VAR_deo_uxn_opcodes_h_l3385_c41_90b5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3387_c1_cfaf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3388_c7_3294] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output;

     -- deo2[uxn_opcodes_h_l3386_c41_04d1] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3386_c41_04d1_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3386_c41_04d1_phase <= VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_phase;
     deo2_uxn_opcodes_h_l3386_c41_04d1_ins <= VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_ins;
     deo2_uxn_opcodes_h_l3386_c41_04d1_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_previous_stack_read;
     deo2_uxn_opcodes_h_l3386_c41_04d1_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_return_output := deo2_uxn_opcodes_h_l3386_c41_04d1_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c7_3294_return_output;
     VAR_add_uxn_opcodes_h_l3387_c41_7e0f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3387_c1_cfaf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue := VAR_deo2_uxn_opcodes_h_l3386_c41_04d1_return_output;
     -- add[uxn_opcodes_h_l3387_c41_7e0f] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3387_c41_7e0f_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3387_c41_7e0f_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3387_c41_7e0f_phase <= VAR_add_uxn_opcodes_h_l3387_c41_7e0f_phase;
     add_uxn_opcodes_h_l3387_c41_7e0f_ins <= VAR_add_uxn_opcodes_h_l3387_c41_7e0f_ins;
     add_uxn_opcodes_h_l3387_c41_7e0f_previous_stack_read <= VAR_add_uxn_opcodes_h_l3387_c41_7e0f_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3387_c41_7e0f_return_output := add_uxn_opcodes_h_l3387_c41_7e0f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3388_c1_8b08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3389_c7_609f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c7_609f_return_output;
     VAR_add2_uxn_opcodes_h_l3388_c41_5db5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3388_c1_8b08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue := VAR_add_uxn_opcodes_h_l3387_c41_7e0f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3390_c7_4004] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output;

     -- add2[uxn_opcodes_h_l3388_c41_5db5] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3388_c41_5db5_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3388_c41_5db5_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3388_c41_5db5_phase <= VAR_add2_uxn_opcodes_h_l3388_c41_5db5_phase;
     add2_uxn_opcodes_h_l3388_c41_5db5_ins <= VAR_add2_uxn_opcodes_h_l3388_c41_5db5_ins;
     add2_uxn_opcodes_h_l3388_c41_5db5_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3388_c41_5db5_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3388_c41_5db5_return_output := add2_uxn_opcodes_h_l3388_c41_5db5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3389_c1_6d5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c7_4004_return_output;
     VAR_sub_uxn_opcodes_h_l3389_c41_5f15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3389_c1_6d5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue := VAR_add2_uxn_opcodes_h_l3388_c41_5db5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3390_c1_f4a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3391_c7_3a6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output;

     -- sub[uxn_opcodes_h_l3389_c41_5f15] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3389_c41_5f15_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3389_c41_5f15_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3389_c41_5f15_phase <= VAR_sub_uxn_opcodes_h_l3389_c41_5f15_phase;
     sub_uxn_opcodes_h_l3389_c41_5f15_ins <= VAR_sub_uxn_opcodes_h_l3389_c41_5f15_ins;
     sub_uxn_opcodes_h_l3389_c41_5f15_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3389_c41_5f15_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3389_c41_5f15_return_output := sub_uxn_opcodes_h_l3389_c41_5f15_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output;
     VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3390_c1_f4a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue := VAR_sub_uxn_opcodes_h_l3389_c41_5f15_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3391_c1_992c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3392_c7_5500] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output;

     -- sub2[uxn_opcodes_h_l3390_c41_ebe4] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3390_c41_ebe4_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3390_c41_ebe4_phase <= VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_phase;
     sub2_uxn_opcodes_h_l3390_c41_ebe4_ins <= VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_ins;
     sub2_uxn_opcodes_h_l3390_c41_ebe4_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output := sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c7_5500_return_output;
     VAR_mul_uxn_opcodes_h_l3391_c41_5337_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3391_c1_992c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue := VAR_sub2_uxn_opcodes_h_l3390_c41_ebe4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3393_c7_0ffc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3392_c1_0184] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output;

     -- mul[uxn_opcodes_h_l3391_c41_5337] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3391_c41_5337_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3391_c41_5337_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3391_c41_5337_phase <= VAR_mul_uxn_opcodes_h_l3391_c41_5337_phase;
     mul_uxn_opcodes_h_l3391_c41_5337_ins <= VAR_mul_uxn_opcodes_h_l3391_c41_5337_ins;
     mul_uxn_opcodes_h_l3391_c41_5337_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3391_c41_5337_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3391_c41_5337_return_output := mul_uxn_opcodes_h_l3391_c41_5337_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output;
     VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3392_c1_0184_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue := VAR_mul_uxn_opcodes_h_l3391_c41_5337_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3394_c7_f296] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3393_c1_d459] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output;

     -- mul2[uxn_opcodes_h_l3392_c41_7c7b] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3392_c41_7c7b_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3392_c41_7c7b_phase <= VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_phase;
     mul2_uxn_opcodes_h_l3392_c41_7c7b_ins <= VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_ins;
     mul2_uxn_opcodes_h_l3392_c41_7c7b_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output := mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c7_f296_return_output;
     VAR_div_uxn_opcodes_h_l3393_c41_e4ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3393_c1_d459_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue := VAR_mul2_uxn_opcodes_h_l3392_c41_7c7b_return_output;
     -- div[uxn_opcodes_h_l3393_c41_e4ad] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3393_c41_e4ad_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3393_c41_e4ad_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3393_c41_e4ad_phase <= VAR_div_uxn_opcodes_h_l3393_c41_e4ad_phase;
     div_uxn_opcodes_h_l3393_c41_e4ad_ins <= VAR_div_uxn_opcodes_h_l3393_c41_e4ad_ins;
     div_uxn_opcodes_h_l3393_c41_e4ad_previous_stack_read <= VAR_div_uxn_opcodes_h_l3393_c41_e4ad_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3393_c41_e4ad_return_output := div_uxn_opcodes_h_l3393_c41_e4ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3395_c7_b33f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3394_c1_1e52] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output;
     VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3394_c1_1e52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue := VAR_div_uxn_opcodes_h_l3393_c41_e4ad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3395_c1_c4e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3396_c7_2231] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output;

     -- div2[uxn_opcodes_h_l3394_c41_1ac6] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3394_c41_1ac6_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3394_c41_1ac6_phase <= VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_phase;
     div2_uxn_opcodes_h_l3394_c41_1ac6_ins <= VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_ins;
     div2_uxn_opcodes_h_l3394_c41_1ac6_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_return_output := div2_uxn_opcodes_h_l3394_c41_1ac6_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c7_2231_return_output;
     VAR_and_uxn_opcodes_h_l3395_c41_d132_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3395_c1_c4e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue := VAR_div2_uxn_opcodes_h_l3394_c41_1ac6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3396_c1_b4ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output;

     -- and[uxn_opcodes_h_l3395_c41_d132] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3395_c41_d132_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3395_c41_d132_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3395_c41_d132_phase <= VAR_and_uxn_opcodes_h_l3395_c41_d132_phase;
     and_uxn_opcodes_h_l3395_c41_d132_ins <= VAR_and_uxn_opcodes_h_l3395_c41_d132_ins;
     and_uxn_opcodes_h_l3395_c41_d132_previous_stack_read <= VAR_and_uxn_opcodes_h_l3395_c41_d132_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3395_c41_d132_return_output := and_uxn_opcodes_h_l3395_c41_d132_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3397_c7_06c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output;
     VAR_and2_uxn_opcodes_h_l3396_c41_3895_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3396_c1_b4ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue := VAR_and_uxn_opcodes_h_l3395_c41_d132_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3397_c1_1d76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3398_c7_d14f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output;

     -- and2[uxn_opcodes_h_l3396_c41_3895] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3396_c41_3895_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3396_c41_3895_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3396_c41_3895_phase <= VAR_and2_uxn_opcodes_h_l3396_c41_3895_phase;
     and2_uxn_opcodes_h_l3396_c41_3895_ins <= VAR_and2_uxn_opcodes_h_l3396_c41_3895_ins;
     and2_uxn_opcodes_h_l3396_c41_3895_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3396_c41_3895_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3396_c41_3895_return_output := and2_uxn_opcodes_h_l3396_c41_3895_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output;
     VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3397_c1_1d76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue := VAR_and2_uxn_opcodes_h_l3396_c41_3895_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3399_c7_b46e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3398_c1_4e1e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output;

     -- ora[uxn_opcodes_h_l3397_c41_a1a1] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3397_c41_a1a1_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3397_c41_a1a1_phase <= VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_phase;
     ora_uxn_opcodes_h_l3397_c41_a1a1_ins <= VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_ins;
     ora_uxn_opcodes_h_l3397_c41_a1a1_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_return_output := ora_uxn_opcodes_h_l3397_c41_a1a1_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output;
     VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3398_c1_4e1e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue := VAR_ora_uxn_opcodes_h_l3397_c41_a1a1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3400_c7_0788] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3399_c1_c21e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output;

     -- ora2[uxn_opcodes_h_l3398_c41_39d9] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3398_c41_39d9_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3398_c41_39d9_phase <= VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_phase;
     ora2_uxn_opcodes_h_l3398_c41_39d9_ins <= VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_ins;
     ora2_uxn_opcodes_h_l3398_c41_39d9_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_return_output := ora2_uxn_opcodes_h_l3398_c41_39d9_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c7_0788_return_output;
     VAR_eor_uxn_opcodes_h_l3399_c41_933e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3399_c1_c21e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue := VAR_ora2_uxn_opcodes_h_l3398_c41_39d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3400_c1_9886] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3401_c7_fe31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output;

     -- eor[uxn_opcodes_h_l3399_c41_933e] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3399_c41_933e_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3399_c41_933e_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3399_c41_933e_phase <= VAR_eor_uxn_opcodes_h_l3399_c41_933e_phase;
     eor_uxn_opcodes_h_l3399_c41_933e_ins <= VAR_eor_uxn_opcodes_h_l3399_c41_933e_ins;
     eor_uxn_opcodes_h_l3399_c41_933e_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3399_c41_933e_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3399_c41_933e_return_output := eor_uxn_opcodes_h_l3399_c41_933e_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output;
     VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3400_c1_9886_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue := VAR_eor_uxn_opcodes_h_l3399_c41_933e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3401_c1_0f83] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output;

     -- eor2[uxn_opcodes_h_l3400_c41_1adb] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3400_c41_1adb_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3400_c41_1adb_phase <= VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_phase;
     eor2_uxn_opcodes_h_l3400_c41_1adb_ins <= VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_ins;
     eor2_uxn_opcodes_h_l3400_c41_1adb_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_return_output := eor2_uxn_opcodes_h_l3400_c41_1adb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3402_c7_8990] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c7_8990_return_output;
     VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3401_c1_0f83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue := VAR_eor2_uxn_opcodes_h_l3400_c41_1adb_return_output;
     -- sft[uxn_opcodes_h_l3401_c41_6ea8] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3401_c41_6ea8_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3401_c41_6ea8_phase <= VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_phase;
     sft_uxn_opcodes_h_l3401_c41_6ea8_ins <= VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_ins;
     sft_uxn_opcodes_h_l3401_c41_6ea8_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_return_output := sft_uxn_opcodes_h_l3401_c41_6ea8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3403_c1_a9b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3402_c1_e54d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3403_c1_a9b1_return_output;
     VAR_sft2_uxn_opcodes_h_l3402_c41_b730_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3402_c1_e54d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue := VAR_sft_uxn_opcodes_h_l3401_c41_6ea8_return_output;
     -- printf_uxn_opcodes_h_l3403_c9_e078[uxn_opcodes_h_l3403_c9_e078] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_arg0 <= VAR_printf_uxn_opcodes_h_l3403_c9_e078_uxn_opcodes_h_l3403_c9_e078_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l3402_c41_b730] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3402_c41_b730_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3402_c41_b730_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3402_c41_b730_phase <= VAR_sft2_uxn_opcodes_h_l3402_c41_b730_phase;
     sft2_uxn_opcodes_h_l3402_c41_b730_ins <= VAR_sft2_uxn_opcodes_h_l3402_c41_b730_ins;
     sft2_uxn_opcodes_h_l3402_c41_b730_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3402_c41_b730_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3402_c41_b730_return_output := sft2_uxn_opcodes_h_l3402_c41_b730_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue := VAR_sft2_uxn_opcodes_h_l3402_c41_b730_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3402_c7_8990] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_cond;
     opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output := opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3402_c7_8990_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3401_c7_fe31] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_cond;
     opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output := opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3401_c7_fe31_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3400_c7_0788] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_cond;
     opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output := opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3400_c7_0788_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3399_c7_b46e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_cond;
     opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output := opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3399_c7_b46e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3398_c7_d14f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_cond;
     opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output := opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3398_c7_d14f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3397_c7_06c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_cond;
     opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output := opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3397_c7_06c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3396_c7_2231] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_cond;
     opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output := opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3396_c7_2231_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3395_c7_b33f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_cond;
     opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output := opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3395_c7_b33f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3394_c7_f296] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_cond;
     opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output := opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3394_c7_f296_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3393_c7_0ffc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_cond;
     opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output := opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3393_c7_0ffc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3392_c7_5500] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_cond;
     opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output := opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3392_c7_5500_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3391_c7_3a6a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_cond;
     opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output := opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3391_c7_3a6a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3390_c7_4004] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_cond;
     opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output := opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3390_c7_4004_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3389_c7_609f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_cond;
     opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output := opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3389_c7_609f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3388_c7_3294] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_cond;
     opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output := opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3388_c7_3294_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3387_c7_3a9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_cond;
     opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output := opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3387_c7_3a9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3386_c7_780c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_cond;
     opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output := opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3386_c7_780c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3385_c7_1e36] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_cond;
     opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output := opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3385_c7_1e36_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3384_c7_c41b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_cond;
     opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output := opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3384_c7_c41b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3383_c7_7e69] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_cond;
     opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output := opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3383_c7_7e69_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3382_c7_48cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_cond;
     opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output := opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3382_c7_48cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3381_c7_e017] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_cond;
     opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output := opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3381_c7_e017_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3380_c7_6d84] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_cond;
     opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output := opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3380_c7_6d84_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3379_c7_c196] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_cond;
     opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output := opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3379_c7_c196_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3378_c7_8e25] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_cond;
     opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output := opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3378_c7_8e25_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3377_c7_a59e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_cond;
     opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output := opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3377_c7_a59e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3376_c7_ac60] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_cond;
     opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output := opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3376_c7_ac60_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3375_c7_8894] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_cond;
     opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output := opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3375_c7_8894_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3374_c7_2840] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_cond;
     opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output := opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3374_c7_2840_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3373_c7_7bf5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_cond;
     opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output := opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3373_c7_7bf5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3372_c7_0d4a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_cond;
     opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output := opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3372_c7_0d4a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3371_c7_7fa4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_cond;
     opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output := opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3371_c7_7fa4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3370_c7_2c71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_cond;
     opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output := opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3370_c7_2c71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3369_c7_8412] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_cond;
     opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output := opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3369_c7_8412_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3368_c7_ac1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_cond;
     opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output := opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3368_c7_ac1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3367_c7_bc72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_cond;
     opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output := opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3367_c7_bc72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3366_c7_0418] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_cond;
     opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output := opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3366_c7_0418_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3365_c7_2ebf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_cond;
     opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output := opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3365_c7_2ebf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3364_c7_cd4c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_cond;
     opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output := opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3364_c7_cd4c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3363_c7_93ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_cond;
     opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output := opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3363_c7_93ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3362_c7_0421] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_cond;
     opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output := opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3362_c7_0421_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3361_c7_446d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_cond;
     opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output := opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3361_c7_446d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3360_c7_fa68] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_cond;
     opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output := opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3360_c7_fa68_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3359_c7_a139] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_cond;
     opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output := opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3359_c7_a139_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3358_c7_467d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_cond;
     opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output := opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3358_c7_467d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3357_c7_775e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_cond;
     opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output := opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3357_c7_775e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3356_c7_e29e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_cond;
     opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output := opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3356_c7_e29e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3355_c7_f840] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_cond;
     opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output := opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3355_c7_f840_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3354_c7_7591] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_cond;
     opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output := opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3354_c7_7591_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3353_c7_1955] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_cond;
     opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output := opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3353_c7_1955_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3352_c7_0056] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_cond;
     opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output := opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3352_c7_0056_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3351_c7_4d65] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_cond;
     opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output := opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3351_c7_4d65_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3350_c7_04e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_cond;
     opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output := opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3350_c7_04e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3349_c7_291c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_cond;
     opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output := opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3349_c7_291c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3348_c7_c22e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_cond;
     opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output := opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3348_c7_c22e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3347_c7_489e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_cond;
     opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output := opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3347_c7_489e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3346_c7_baf0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_cond;
     opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output := opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3346_c7_baf0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3345_c7_91d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_cond;
     opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output := opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3345_c7_91d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3344_c7_56d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_cond;
     opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output := opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3344_c7_56d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3343_c7_0a0b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_cond;
     opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output := opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3343_c7_0a0b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3342_c7_2284] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_cond;
     opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output := opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3342_c7_2284_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3341_c7_3b56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_cond;
     opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output := opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3341_c7_3b56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3340_c7_ef2e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_cond;
     opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output := opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3340_c7_ef2e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3339_c7_21d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_cond;
     opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output := opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3339_c7_21d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3338_c7_07cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_cond;
     opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output := opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3338_c7_07cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3337_c7_e43c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_cond;
     opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output := opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3337_c7_e43c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3336_c7_b567] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_cond;
     opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output := opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3336_c7_b567_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3335_c7_7ad6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_cond;
     opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output := opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3335_c7_7ad6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3334_c7_d569] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_cond;
     opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output := opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3334_c7_d569_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3333_c2_e1e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_cond;
     opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output := opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3405_c6_9176] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3405_c6_9176_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3456_c32_03a8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3456_c32_03a8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3439_l3443_DUPLICATE_e09d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3439_l3443_DUPLICATE_e09d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l3451_c29_2d9b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3451_c29_2d9b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.ram_addr;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3454_c33_8eaa] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3454_c33_8eaa_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l3452_c30_7796] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3452_c30_7796_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.ram_value;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l3455_c31_1072] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3455_c31_1072_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3453_c34_dbdc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3453_c34_dbdc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3414_c19_0985] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3414_c19_0985_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l3444_c3_c0f1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3444_c3_c0f1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l3440_c3_98d4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3440_c3_98d4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3406_l3418_l3415_DUPLICATE_11c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3406_l3418_l3415_DUPLICATE_11c4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3415_c82_f1a2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3415_c82_f1a2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3450_c33_7d0c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3450_c33_7d0c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l3449_c32_39f1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l3449_c32_39f1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_ram_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3409_l3407_DUPLICATE_e5c1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3409_l3407_DUPLICATE_e5c1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3447_c34_d4fe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3447_c34_d4fe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l3413_c18_b507] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3413_c18_b507_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l3416_c22_8fe4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3416_c22_8fe4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l3448_c23_8f60] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3448_c23_8f60_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3441_c3_3796] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3441_c3_3796_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3333_c2_e1e6_return_output.is_device_ram_write;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3409_l3407_DUPLICATE_e5c1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3409_l3407_DUPLICATE_e5c1_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3444_c3_c0f1_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3441_c3_3796_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3405_c6_9176_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3405_c6_9176_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3406_l3418_l3415_DUPLICATE_11c4_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3413_c18_b507_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3413_c18_b507_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3413_c18_b507_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3414_c19_0985_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3414_c19_0985_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3414_c19_0985_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3439_l3443_DUPLICATE_e09d_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3439_l3443_DUPLICATE_e09d_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3440_c3_98d4_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3415_c82_f1a2_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3416_c22_8fe4_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3416_c22_8fe4_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3416_c22_8fe4_return_output;
     -- device_ram_update[uxn_opcodes_h_l3438_c26_64a9] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address0 <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address0;
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_value;
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_write0_enable;
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read0_enable;
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address1 <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_address1;
     device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output := device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3409_c4_5c85] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output;

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3458_l3311_DUPLICATE_4f7c LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3458_l3311_DUPLICATE_4f7c_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3447_c34_d4fe_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3448_c23_8f60_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l3449_c32_39f1_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3450_c33_7d0c_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3451_c29_2d9b_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3452_c30_7796_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3453_c34_dbdc_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3454_c33_8eaa_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3455_c31_1072_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3456_c32_03a8_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l3407_c4_309b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l3407_c4_3204 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3407_c4_309b_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3409_c4_b212 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3409_c4_5c85_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;
     VAR_MUX_uxn_opcodes_h_l3415_c19_712f_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3415_l3418_l3406_DUPLICATE_b4d5_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3458_l3311_DUPLICATE_4f7c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l3458_l3311_DUPLICATE_4f7c_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l3438_c2_7caf := resize(VAR_device_ram_update_uxn_opcodes_h_l3438_c26_64a9_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l3438_c2_7caf;
     VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse := VAR_sp0_uxn_opcodes_h_l3409_c4_b212;
     VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue := VAR_sp1_uxn_opcodes_h_l3407_c4_3204;
     -- sp0_MUX[uxn_opcodes_h_l3406_c3_770b] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3406_c3_770b_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_cond;
     sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue;
     sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output := sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3427_c1_baf2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3418_c1_2f03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3406_c3_770b] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3406_c3_770b_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_cond;
     sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iftrue;
     sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output := sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3427_c1_baf2_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3418_c1_2f03_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3406_c3_770b_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3406_c3_770b_return_output;
     -- sp0_MUX[uxn_opcodes_h_l3405_c2_8e6c] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond;
     sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue;
     sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output := sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3405_c2_8e6c] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_cond;
     sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iftrue;
     sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output := sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l3415_c19_712f_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output;
     VAR_MUX_uxn_opcodes_h_l3415_c19_712f_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3405_c2_8e6c_return_output;
     -- MUX[uxn_opcodes_h_l3415_c19_712f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3415_c19_712f_cond <= VAR_MUX_uxn_opcodes_h_l3415_c19_712f_cond;
     MUX_uxn_opcodes_h_l3415_c19_712f_iftrue <= VAR_MUX_uxn_opcodes_h_l3415_c19_712f_iftrue;
     MUX_uxn_opcodes_h_l3415_c19_712f_iffalse <= VAR_MUX_uxn_opcodes_h_l3415_c19_712f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3415_c19_712f_return_output := MUX_uxn_opcodes_h_l3415_c19_712f_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_left := VAR_MUX_uxn_opcodes_h_l3415_c19_712f_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3415_c19_b70c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l3415_c19_b70c_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e;
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address0 := resize(VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address1 := resize(VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address0 := resize(VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address1 := resize(VAR_stack_address_uxn_opcodes_h_l3415_c2_e52e, 8);
     -- stack_r_ram_update[uxn_opcodes_h_l3419_c22_cfd9] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address0;
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_address1;
     stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output := stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output;

     -- stack_w_ram_update[uxn_opcodes_h_l3428_c22_d9bb] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address0;
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_address1;
     stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output := stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l3419_c3_4676 := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l3419_c22_cfd9_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l3428_c3_8957 := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l3428_c22_d9bb_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iftrue := VAR_stack_read_value_uxn_opcodes_h_l3419_c3_4676;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iffalse := VAR_stack_read_value_uxn_opcodes_h_l3428_c3_8957;
     -- stack_read_value_MUX[uxn_opcodes_h_l3418_c2_13ea] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_cond;
     stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output := stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l3418_c2_13ea_return_output;
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
