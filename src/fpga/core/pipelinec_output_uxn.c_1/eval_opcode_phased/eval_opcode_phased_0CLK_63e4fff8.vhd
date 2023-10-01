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
-- Submodules: 414
entity eval_opcode_phased_0CLK_63e4fff8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_63e4fff8;
architecture arch of eval_opcode_phased_0CLK_63e4fff8 is
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
-- BIN_OP_AND[uxn_opcodes_h_l1830_c10_fc62]
signal BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1830_c10_2825]
signal BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1830_c41_664d]
signal BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l1830_c57_6c80]
signal CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l1830_c10_9171]
signal MUX_uxn_opcodes_h_l1830_c10_9171_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1830_c10_9171_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l1830_c10_9171_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l1830_c10_9171_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1831_c18_6a62]
signal BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1831_c18_dfe4]
signal BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1831_c18_1b02]
signal MUX_uxn_opcodes_h_l1831_c18_1b02_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1831_c18_1b02_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1831_c18_1b02_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1831_c18_1b02_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1833_c2_42b7[uxn_opcodes_h_l1833_c2_42b7]
signal printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c6_6b6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1836_c7_c774]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1835_c2_0836]
signal opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_31f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1836_c1_ce74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1837_c7_85e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1836_c7_c774]
signal opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l1836_c41_0124]
signal jci_uxn_opcodes_h_l1836_c41_0124_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l1836_c41_0124_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l1836_c41_0124_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l1836_c41_0124_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l1836_c41_0124_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l1836_c41_0124_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_cec1]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1837_c1_8eea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1838_c7_90ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1837_c7_85e2]
signal opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l1837_c41_76d2]
signal jmi_uxn_opcodes_h_l1837_c41_76d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l1837_c41_76d2_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l1837_c41_76d2_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l1837_c41_76d2_previous_stack_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l1837_c41_76d2_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l1837_c41_76d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1838_c11_2da9]
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1838_c1_9c1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1839_c7_0a76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1838_c7_90ff]
signal opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l1838_c41_41d7]
signal jsi_uxn_opcodes_h_l1838_c41_41d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l1838_c41_41d7_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l1838_c41_41d7_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l1838_c41_41d7_previous_stack_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l1838_c41_41d7_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l1838_c41_41d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_9f0a]
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1839_c1_6a50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1840_c7_d559]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1839_c7_0a76]
signal opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l1839_c41_fda5]
signal lit_uxn_opcodes_h_l1839_c41_fda5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l1839_c41_fda5_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l1839_c41_fda5_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l1839_c41_fda5_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l1839_c41_fda5_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l1839_c41_fda5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_bab7]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1840_c1_dfb7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1841_c7_d41e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1840_c7_d559]
signal opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l1840_c41_3dd1]
signal lit2_uxn_opcodes_h_l1840_c41_3dd1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l1840_c41_3dd1_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l1840_c41_3dd1_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_4080]
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1841_c1_40a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1842_c7_0089]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1841_c7_d41e]
signal opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l1841_c41_10ba]
signal lit_uxn_opcodes_h_l1841_c41_10ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l1841_c41_10ba_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l1841_c41_10ba_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l1841_c41_10ba_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l1841_c41_10ba_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l1841_c41_10ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1842_c11_50ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1842_c1_9b94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1843_c7_7095]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1842_c7_0089]
signal opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l1842_c41_777e]
signal lit2_uxn_opcodes_h_l1842_c41_777e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l1842_c41_777e_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l1842_c41_777e_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l1842_c41_777e_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l1842_c41_777e_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l1842_c41_777e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_41b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1843_c1_0f96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1844_c7_fa41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1843_c7_7095]
signal opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1843_c28_df86[uxn_opcodes_h_l1843_c28_df86]
signal printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1844_c11_68e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1844_c1_78af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1845_c7_142d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1844_c7_fa41]
signal opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l1844_c41_f2dc]
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_pc : unsigned(15 downto 0);
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_ram_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_a3ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1845_c1_b207]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1846_c7_d8d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1845_c7_142d]
signal opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l1845_c41_49f4]
signal pop_uxn_opcodes_h_l1845_c41_49f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l1845_c41_49f4_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l1845_c41_49f4_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l1845_c41_49f4_pc : unsigned(15 downto 0);
signal pop_uxn_opcodes_h_l1845_c41_49f4_previous_stack_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l1845_c41_49f4_previous_ram_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l1845_c41_49f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1846_c11_af98]
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1846_c1_2e70]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1847_c7_3be0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1846_c7_d8d3]
signal opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l1846_c41_7dee]
signal pop2_uxn_opcodes_h_l1846_c41_7dee_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l1846_c41_7dee_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l1846_c41_7dee_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l1846_c41_7dee_pc : unsigned(15 downto 0);
signal pop2_uxn_opcodes_h_l1846_c41_7dee_previous_stack_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l1846_c41_7dee_previous_ram_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l1846_c41_7dee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1847_c11_03c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1847_c1_763a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1848_c7_eab7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1847_c7_3be0]
signal opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l1847_c41_363f]
signal nip_uxn_opcodes_h_l1847_c41_363f_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l1847_c41_363f_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l1847_c41_363f_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l1847_c41_363f_pc : unsigned(15 downto 0);
signal nip_uxn_opcodes_h_l1847_c41_363f_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l1847_c41_363f_previous_ram_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l1847_c41_363f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_5d76]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1848_c1_39ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1849_c7_17f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1848_c7_eab7]
signal opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1848_c28_0514[uxn_opcodes_h_l1848_c28_0514]
signal printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_5a3d]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1849_c1_4e54]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1850_c7_dc7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1849_c7_17f3]
signal opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l1849_c41_e6d7]
signal swp_uxn_opcodes_h_l1849_c41_e6d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l1849_c41_e6d7_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l1849_c41_e6d7_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l1849_c41_e6d7_pc : unsigned(15 downto 0);
signal swp_uxn_opcodes_h_l1849_c41_e6d7_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l1849_c41_e6d7_previous_ram_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l1849_c41_e6d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1850_c11_6d8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1850_c1_f22c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1851_c7_a2c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1850_c7_dc7d]
signal opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l1850_c41_8d46]
signal swp2_uxn_opcodes_h_l1850_c41_8d46_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l1850_c41_8d46_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l1850_c41_8d46_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l1850_c41_8d46_pc : unsigned(15 downto 0);
signal swp2_uxn_opcodes_h_l1850_c41_8d46_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l1850_c41_8d46_previous_ram_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l1850_c41_8d46_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1851_c11_4447]
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1851_c1_62a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1852_c7_38d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1851_c7_a2c2]
signal opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1851_c28_2bdf[uxn_opcodes_h_l1851_c28_2bdf]
signal printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1852_c11_a933]
signal BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1852_c1_a4b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c7_c33a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1852_c7_38d5]
signal opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1852_c28_edf9[uxn_opcodes_h_l1852_c28_edf9]
signal printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_14c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c1_8610]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1854_c7_baf5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1853_c7_c33a]
signal opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1853_c28_1e59[uxn_opcodes_h_l1853_c28_1e59]
signal printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_65cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1854_c1_2290]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1855_c7_c1d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1854_c7_baf5]
signal opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1854_c28_9073[uxn_opcodes_h_l1854_c28_9073]
signal printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1855_c11_761f]
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1855_c1_1b35]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1856_c7_6010]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1855_c7_c1d7]
signal opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1855_c28_b81d[uxn_opcodes_h_l1855_c28_b81d]
signal printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1856_c11_75ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1856_c1_077e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1857_c7_c20f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1856_c7_6010]
signal opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l1856_c41_1700]
signal ovr2_uxn_opcodes_h_l1856_c41_1700_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l1856_c41_1700_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l1856_c41_1700_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l1856_c41_1700_pc : unsigned(15 downto 0);
signal ovr2_uxn_opcodes_h_l1856_c41_1700_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l1856_c41_1700_previous_ram_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l1856_c41_1700_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_76e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1857_c1_e06d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1858_c7_139d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1857_c7_c20f]
signal opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l1857_c41_ab4f]
signal equ_uxn_opcodes_h_l1857_c41_ab4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l1857_c41_ab4f_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l1857_c41_ab4f_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l1857_c41_ab4f_pc : unsigned(15 downto 0);
signal equ_uxn_opcodes_h_l1857_c41_ab4f_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l1857_c41_ab4f_previous_ram_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l1857_c41_ab4f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_d979]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1858_c1_55cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1859_c7_7b81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1858_c7_139d]
signal opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l1858_c41_e1c6]
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_pc : unsigned(15 downto 0);
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_ram_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_7fc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1859_c1_5839]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c7_2134]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1859_c7_7b81]
signal opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1859_c28_1e46[uxn_opcodes_h_l1859_c28_1e46]
signal printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_5fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c1_cf38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1861_c7_4d7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1860_c7_2134]
signal opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1860_c28_7500[uxn_opcodes_h_l1860_c28_7500]
signal printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_27c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1861_c1_8f9f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1862_c7_be4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1861_c7_4d7f]
signal opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1861_c28_97cf[uxn_opcodes_h_l1861_c28_97cf]
signal printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_ae55]
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1862_c1_ca76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1863_c7_7288]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1862_c7_be4e]
signal opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l1862_c41_3ba2]
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_pc : unsigned(15 downto 0);
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_ram_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_8c28]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1863_c1_3c94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1864_c7_c41f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1863_c7_7288]
signal opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1863_c28_f257[uxn_opcodes_h_l1863_c28_f257]
signal printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1864_c11_e5e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1864_c1_7e62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1865_c7_7371]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1864_c7_c41f]
signal opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l1864_c41_da70]
signal lth2_uxn_opcodes_h_l1864_c41_da70_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l1864_c41_da70_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l1864_c41_da70_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l1864_c41_da70_pc : unsigned(15 downto 0);
signal lth2_uxn_opcodes_h_l1864_c41_da70_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l1864_c41_da70_previous_ram_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l1864_c41_da70_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_9f68]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1865_c1_5f36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1866_c7_d4f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1865_c7_7371]
signal opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1865_c28_1a12[uxn_opcodes_h_l1865_c28_1a12]
signal printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_bc6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1866_c1_3f17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1867_c7_da06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1866_c7_d4f1]
signal opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l1866_c41_5aa8]
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_pc : unsigned(15 downto 0);
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_ram_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_51ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1867_c1_0161]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1868_c7_7d64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1867_c7_da06]
signal opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1867_c28_53e6[uxn_opcodes_h_l1867_c28_53e6]
signal printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_467b]
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1868_c1_9706]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1869_c7_8e5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1868_c7_7d64]
signal opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1868_c28_daa7[uxn_opcodes_h_l1868_c28_daa7]
signal printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_cd97]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1869_c1_65b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1870_c7_dc75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1869_c7_8e5f]
signal opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1869_c28_00d0[uxn_opcodes_h_l1869_c28_00d0]
signal printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_3924]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1870_c1_c61d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1871_c7_03df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1870_c7_dc75]
signal opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1870_c28_f71c[uxn_opcodes_h_l1870_c28_f71c]
signal printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_2fe3]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1871_c1_85a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1872_c7_1ba1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1871_c7_03df]
signal opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1871_c28_27c7[uxn_opcodes_h_l1871_c28_27c7]
signal printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1872_c11_f0e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1872_c1_fe04]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1873_c7_0aea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1872_c7_1ba1]
signal opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l1872_c41_cd43]
signal sth2_uxn_opcodes_h_l1872_c41_cd43_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l1872_c41_cd43_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l1872_c41_cd43_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l1872_c41_cd43_pc : unsigned(15 downto 0);
signal sth2_uxn_opcodes_h_l1872_c41_cd43_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l1872_c41_cd43_previous_ram_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l1872_c41_cd43_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_262f]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1873_c1_f793]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1874_c7_cda2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1873_c7_0aea]
signal opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1873_c28_cbe9[uxn_opcodes_h_l1873_c28_cbe9]
signal printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_1d76]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1874_c1_aea0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1875_c7_cf77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1874_c7_cda2]
signal opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1874_c28_b625[uxn_opcodes_h_l1874_c28_b625]
signal printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1875_c11_3760]
signal BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1875_c1_23be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1876_c7_6150]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1875_c7_cf77]
signal opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1875_c28_2b4a[uxn_opcodes_h_l1875_c28_2b4a]
signal printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_9a3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1876_c1_0752]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1877_c7_9d86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1876_c7_6150]
signal opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1876_c28_fc06[uxn_opcodes_h_l1876_c28_fc06]
signal printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_0267]
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1877_c1_205f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1878_c7_b143]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1877_c7_9d86]
signal opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1877_c28_06df[uxn_opcodes_h_l1877_c28_06df]
signal printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_af3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1878_c1_45bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1879_c7_750b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1878_c7_b143]
signal opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1878_c28_0eb1[uxn_opcodes_h_l1878_c28_0eb1]
signal printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1879_c11_5731]
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1879_c1_3875]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1880_c7_d9b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1879_c7_750b]
signal opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1879_c28_2a4d[uxn_opcodes_h_l1879_c28_2a4d]
signal printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1880_c11_e010]
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1880_c1_ce78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1881_c7_9fd7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1880_c7_d9b5]
signal opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1880_c28_f84a[uxn_opcodes_h_l1880_c28_f84a]
signal printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1881_c11_89d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1881_c1_ff32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1882_c7_40e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1881_c7_9fd7]
signal opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1881_c28_4fde[uxn_opcodes_h_l1881_c28_4fde]
signal printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_eb89]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1882_c1_d12f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1883_c7_436d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1882_c7_40e6]
signal opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l1882_c41_ad35]
signal lda2_uxn_opcodes_h_l1882_c41_ad35_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l1882_c41_ad35_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l1882_c41_ad35_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l1882_c41_ad35_pc : unsigned(15 downto 0);
signal lda2_uxn_opcodes_h_l1882_c41_ad35_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l1882_c41_ad35_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l1882_c41_ad35_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_81fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1883_c1_0e9c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1884_c7_ea42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1883_c7_436d]
signal opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1883_c28_1498[uxn_opcodes_h_l1883_c28_1498]
signal printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1884_c11_a1aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1884_c1_d57b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1885_c7_e21e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1884_c7_ea42]
signal opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l1884_c41_5c42]
signal sta2_uxn_opcodes_h_l1884_c41_5c42_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l1884_c41_5c42_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l1884_c41_5c42_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l1884_c41_5c42_pc : unsigned(15 downto 0);
signal sta2_uxn_opcodes_h_l1884_c41_5c42_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l1884_c41_5c42_previous_ram_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l1884_c41_5c42_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1885_c11_054b]
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1885_c1_12bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1886_c7_2e10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1885_c7_e21e]
signal opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1885_c28_caba[uxn_opcodes_h_l1885_c28_caba]
signal printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_118d]
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1886_c1_f2cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1887_c7_0e1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1886_c7_2e10]
signal opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1886_c28_a0f0[uxn_opcodes_h_l1886_c28_a0f0]
signal printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_8290]
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1887_c1_3272]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1888_c7_3fda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1887_c7_0e1d]
signal opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l1887_c41_bc2b]
signal deo_uxn_opcodes_h_l1887_c41_bc2b_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_pc : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l1887_c41_bc2b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_3e82]
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1888_c1_6331]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1889_c7_f587]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1888_c7_3fda]
signal opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l1888_c41_84ce]
signal deo2_uxn_opcodes_h_l1888_c41_84ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_pc : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l1888_c41_84ce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_c61e]
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1889_c1_0614]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1890_c7_6bc0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1889_c7_f587]
signal opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1889_c28_9d37[uxn_opcodes_h_l1889_c28_9d37]
signal printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1890_c11_8e4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1890_c1_0763]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1891_c7_e6ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1890_c7_6bc0]
signal opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l1890_c41_0d4d]
signal add2_uxn_opcodes_h_l1890_c41_0d4d_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l1890_c41_0d4d_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l1890_c41_0d4d_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l1890_c41_0d4d_pc : unsigned(15 downto 0);
signal add2_uxn_opcodes_h_l1890_c41_0d4d_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l1890_c41_0d4d_previous_ram_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l1890_c41_0d4d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_c938]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1891_c1_d99d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1892_c7_78b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1891_c7_e6ff]
signal opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1891_c28_f569[uxn_opcodes_h_l1891_c28_f569]
signal printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_7617]
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1892_c1_683c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1893_c7_1198]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1892_c7_78b5]
signal opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l1892_c41_a79f]
signal sub2_uxn_opcodes_h_l1892_c41_a79f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l1892_c41_a79f_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l1892_c41_a79f_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l1892_c41_a79f_pc : unsigned(15 downto 0);
signal sub2_uxn_opcodes_h_l1892_c41_a79f_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l1892_c41_a79f_previous_ram_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l1892_c41_a79f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1893_c11_2160]
signal BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1893_c1_9915]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1894_c7_f967]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1893_c7_1198]
signal opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1893_c28_1cf4[uxn_opcodes_h_l1893_c28_1cf4]
signal printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_4013]
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1894_c1_185d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1895_c7_1bd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1894_c7_f967]
signal opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l1894_c41_c141]
signal mul2_uxn_opcodes_h_l1894_c41_c141_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l1894_c41_c141_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l1894_c41_c141_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l1894_c41_c141_pc : unsigned(15 downto 0);
signal mul2_uxn_opcodes_h_l1894_c41_c141_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l1894_c41_c141_previous_ram_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l1894_c41_c141_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1895_c11_d484]
signal BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1895_c1_9e4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1896_c7_aaa6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1895_c7_1bd0]
signal opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1895_c28_aafe[uxn_opcodes_h_l1895_c28_aafe]
signal printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_9d78]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1896_c1_ed14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1897_c7_948c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1896_c7_aaa6]
signal opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1896_c28_1446[uxn_opcodes_h_l1896_c28_1446]
signal printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1897_c11_55a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1897_c1_b02d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1898_c7_e27c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1897_c7_948c]
signal opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1897_c28_b944[uxn_opcodes_h_l1897_c28_b944]
signal printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1898_c11_3e0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1898_c1_6063]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1899_c7_66e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1898_c7_e27c]
signal opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l1898_c41_0a13]
signal and2_uxn_opcodes_h_l1898_c41_0a13_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l1898_c41_0a13_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l1898_c41_0a13_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l1898_c41_0a13_pc : unsigned(15 downto 0);
signal and2_uxn_opcodes_h_l1898_c41_0a13_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l1898_c41_0a13_previous_ram_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l1898_c41_0a13_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_d035]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1899_c1_2947]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1900_c7_c264]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1899_c7_66e8]
signal opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1899_c28_6404[uxn_opcodes_h_l1899_c28_6404]
signal printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_e16b]
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1900_c1_ae4d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1901_c7_b46e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1900_c7_c264]
signal opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1900_c28_ea64[uxn_opcodes_h_l1900_c28_ea64]
signal printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1901_c11_426a]
signal BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1901_c1_8dd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1902_c7_7cf7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1901_c7_b46e]
signal opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l1901_c41_82b4]
signal eor_uxn_opcodes_h_l1901_c41_82b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l1901_c41_82b4_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l1901_c41_82b4_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l1901_c41_82b4_pc : unsigned(15 downto 0);
signal eor_uxn_opcodes_h_l1901_c41_82b4_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l1901_c41_82b4_previous_ram_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l1901_c41_82b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1902_c11_ca4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1902_c1_b690]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1903_c7_6efd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1902_c7_7cf7]
signal opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l1902_c41_297b]
signal eor2_uxn_opcodes_h_l1902_c41_297b_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l1902_c41_297b_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l1902_c41_297b_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l1902_c41_297b_pc : unsigned(15 downto 0);
signal eor2_uxn_opcodes_h_l1902_c41_297b_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l1902_c41_297b_previous_ram_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l1902_c41_297b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_1120]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1903_c1_1aea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1904_c7_1c99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1903_c7_6efd]
signal opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l1903_c41_3e60]
signal sft_uxn_opcodes_h_l1903_c41_3e60_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l1903_c41_3e60_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l1903_c41_3e60_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l1903_c41_3e60_pc : unsigned(15 downto 0);
signal sft_uxn_opcodes_h_l1903_c41_3e60_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l1903_c41_3e60_previous_ram_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l1903_c41_3e60_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_9ca6]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1904_c1_1040]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1905_c1_1b40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l1904_c7_1c99]
signal opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l1904_c41_05ba]
signal sft2_uxn_opcodes_h_l1904_c41_05ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l1904_c41_05ba_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l1904_c41_05ba_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l1904_c41_05ba_pc : unsigned(15 downto 0);
signal sft2_uxn_opcodes_h_l1904_c41_05ba_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l1904_c41_05ba_previous_ram_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l1904_c41_05ba_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l1905_c9_924f[uxn_opcodes_h_l1905_c9_924f]
signal printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l1907_c2_c73e]
signal sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l1907_c2_c73e]
signal sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l1908_c3_305c]
signal sp0_MUX_uxn_opcodes_h_l1908_c3_305c_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l1908_c3_305c]
signal sp1_MUX_uxn_opcodes_h_l1908_c3_305c_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1909_c4_53bb]
signal BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1911_c4_ca0a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l1917_c19_dbbf]
signal MUX_uxn_opcodes_h_l1917_c19_dbbf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1917_c19_dbbf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1917_c19_dbbf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l1917_c19_0050]
signal BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1920_c1_8cc7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1929_c1_cf80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l1920_c2_3a31]
signal stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l1921_c22_1405]
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l1930_c22_b1c9]
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l1940_c26_04fc]
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62
BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_left,
BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_right,
BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825
BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_left,
BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_right,
BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d
BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_left,
BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_right,
BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output);

-- CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80
CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_x,
CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output);

-- MUX_uxn_opcodes_h_l1830_c10_9171
MUX_uxn_opcodes_h_l1830_c10_9171 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1830_c10_9171_cond,
MUX_uxn_opcodes_h_l1830_c10_9171_iftrue,
MUX_uxn_opcodes_h_l1830_c10_9171_iffalse,
MUX_uxn_opcodes_h_l1830_c10_9171_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62
BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_left,
BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_right,
BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4
BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_left,
BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_right,
BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output);

-- MUX_uxn_opcodes_h_l1831_c18_1b02
MUX_uxn_opcodes_h_l1831_c18_1b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1831_c18_1b02_cond,
MUX_uxn_opcodes_h_l1831_c18_1b02_iftrue,
MUX_uxn_opcodes_h_l1831_c18_1b02_iffalse,
MUX_uxn_opcodes_h_l1831_c18_1b02_return_output);

-- printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7
printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7 : entity work.printf_uxn_opcodes_h_l1833_c2_42b7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg0,
printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg1,
printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b
BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1835_c2_0836
opc_result_MUX_uxn_opcodes_h_l1835_c2_0836 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_cond,
opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iftrue,
opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iffalse,
opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1836_c7_c774
opc_result_MUX_uxn_opcodes_h_l1836_c7_c774 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_cond,
opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue,
opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse,
opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output);

-- jci_uxn_opcodes_h_l1836_c41_0124
jci_uxn_opcodes_h_l1836_c41_0124 : entity work.jci_0CLK_a538d920 port map (
clk,
jci_uxn_opcodes_h_l1836_c41_0124_CLOCK_ENABLE,
jci_uxn_opcodes_h_l1836_c41_0124_phase,
jci_uxn_opcodes_h_l1836_c41_0124_pc,
jci_uxn_opcodes_h_l1836_c41_0124_previous_stack_read,
jci_uxn_opcodes_h_l1836_c41_0124_previous_ram_read,
jci_uxn_opcodes_h_l1836_c41_0124_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2
opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_cond,
opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output);

-- jmi_uxn_opcodes_h_l1837_c41_76d2
jmi_uxn_opcodes_h_l1837_c41_76d2 : entity work.jmi_0CLK_d14e7b0e port map (
clk,
jmi_uxn_opcodes_h_l1837_c41_76d2_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l1837_c41_76d2_phase,
jmi_uxn_opcodes_h_l1837_c41_76d2_pc,
jmi_uxn_opcodes_h_l1837_c41_76d2_previous_stack_read,
jmi_uxn_opcodes_h_l1837_c41_76d2_previous_ram_read,
jmi_uxn_opcodes_h_l1837_c41_76d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_left,
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_right,
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff
opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_cond,
opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output);

-- jsi_uxn_opcodes_h_l1838_c41_41d7
jsi_uxn_opcodes_h_l1838_c41_41d7 : entity work.jsi_0CLK_85c87c86 port map (
clk,
jsi_uxn_opcodes_h_l1838_c41_41d7_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l1838_c41_41d7_phase,
jsi_uxn_opcodes_h_l1838_c41_41d7_pc,
jsi_uxn_opcodes_h_l1838_c41_41d7_previous_stack_read,
jsi_uxn_opcodes_h_l1838_c41_41d7_previous_ram_read,
jsi_uxn_opcodes_h_l1838_c41_41d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_left,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_right,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76
opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_cond,
opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue,
opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse,
opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output);

-- lit_uxn_opcodes_h_l1839_c41_fda5
lit_uxn_opcodes_h_l1839_c41_fda5 : entity work.lit_0CLK_0852fa80 port map (
clk,
lit_uxn_opcodes_h_l1839_c41_fda5_CLOCK_ENABLE,
lit_uxn_opcodes_h_l1839_c41_fda5_phase,
lit_uxn_opcodes_h_l1839_c41_fda5_pc,
lit_uxn_opcodes_h_l1839_c41_fda5_previous_stack_read,
lit_uxn_opcodes_h_l1839_c41_fda5_previous_ram_read,
lit_uxn_opcodes_h_l1839_c41_fda5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1840_c7_d559
opc_result_MUX_uxn_opcodes_h_l1840_c7_d559 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_cond,
opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue,
opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse,
opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output);

-- lit2_uxn_opcodes_h_l1840_c41_3dd1
lit2_uxn_opcodes_h_l1840_c41_3dd1 : entity work.lit2_0CLK_83f22136 port map (
clk,
lit2_uxn_opcodes_h_l1840_c41_3dd1_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l1840_c41_3dd1_phase,
lit2_uxn_opcodes_h_l1840_c41_3dd1_pc,
lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_stack_read,
lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_ram_read,
lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_left,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_right,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e
opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_cond,
opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue,
opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse,
opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output);

-- lit_uxn_opcodes_h_l1841_c41_10ba
lit_uxn_opcodes_h_l1841_c41_10ba : entity work.lit_0CLK_0852fa80 port map (
clk,
lit_uxn_opcodes_h_l1841_c41_10ba_CLOCK_ENABLE,
lit_uxn_opcodes_h_l1841_c41_10ba_phase,
lit_uxn_opcodes_h_l1841_c41_10ba_pc,
lit_uxn_opcodes_h_l1841_c41_10ba_previous_stack_read,
lit_uxn_opcodes_h_l1841_c41_10ba_previous_ram_read,
lit_uxn_opcodes_h_l1841_c41_10ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1842_c7_0089
opc_result_MUX_uxn_opcodes_h_l1842_c7_0089 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_cond,
opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue,
opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse,
opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output);

-- lit2_uxn_opcodes_h_l1842_c41_777e
lit2_uxn_opcodes_h_l1842_c41_777e : entity work.lit2_0CLK_83f22136 port map (
clk,
lit2_uxn_opcodes_h_l1842_c41_777e_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l1842_c41_777e_phase,
lit2_uxn_opcodes_h_l1842_c41_777e_pc,
lit2_uxn_opcodes_h_l1842_c41_777e_previous_stack_read,
lit2_uxn_opcodes_h_l1842_c41_777e_previous_ram_read,
lit2_uxn_opcodes_h_l1842_c41_777e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1843_c7_7095
opc_result_MUX_uxn_opcodes_h_l1843_c7_7095 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_cond,
opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue,
opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse,
opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output);

-- printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86
printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86 : entity work.printf_uxn_opcodes_h_l1843_c28_df86_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41
opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_cond,
opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue,
opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse,
opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output);

-- inc2_uxn_opcodes_h_l1844_c41_f2dc
inc2_uxn_opcodes_h_l1844_c41_f2dc : entity work.inc2_0CLK_0852fa80 port map (
clk,
inc2_uxn_opcodes_h_l1844_c41_f2dc_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l1844_c41_f2dc_phase,
inc2_uxn_opcodes_h_l1844_c41_f2dc_ins,
inc2_uxn_opcodes_h_l1844_c41_f2dc_pc,
inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_stack_read,
inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_ram_read,
inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1845_c7_142d
opc_result_MUX_uxn_opcodes_h_l1845_c7_142d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_cond,
opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue,
opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse,
opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output);

-- pop_uxn_opcodes_h_l1845_c41_49f4
pop_uxn_opcodes_h_l1845_c41_49f4 : entity work.pop_0CLK_25d197a7 port map (
clk,
pop_uxn_opcodes_h_l1845_c41_49f4_CLOCK_ENABLE,
pop_uxn_opcodes_h_l1845_c41_49f4_phase,
pop_uxn_opcodes_h_l1845_c41_49f4_ins,
pop_uxn_opcodes_h_l1845_c41_49f4_pc,
pop_uxn_opcodes_h_l1845_c41_49f4_previous_stack_read,
pop_uxn_opcodes_h_l1845_c41_49f4_previous_ram_read,
pop_uxn_opcodes_h_l1845_c41_49f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_left,
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_right,
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3
opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond,
opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue,
opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse,
opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output);

-- pop2_uxn_opcodes_h_l1846_c41_7dee
pop2_uxn_opcodes_h_l1846_c41_7dee : entity work.pop2_0CLK_25d197a7 port map (
clk,
pop2_uxn_opcodes_h_l1846_c41_7dee_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l1846_c41_7dee_phase,
pop2_uxn_opcodes_h_l1846_c41_7dee_ins,
pop2_uxn_opcodes_h_l1846_c41_7dee_pc,
pop2_uxn_opcodes_h_l1846_c41_7dee_previous_stack_read,
pop2_uxn_opcodes_h_l1846_c41_7dee_previous_ram_read,
pop2_uxn_opcodes_h_l1846_c41_7dee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3
BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0
opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_cond,
opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue,
opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse,
opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output);

-- nip_uxn_opcodes_h_l1847_c41_363f
nip_uxn_opcodes_h_l1847_c41_363f : entity work.nip_0CLK_4351dde2 port map (
clk,
nip_uxn_opcodes_h_l1847_c41_363f_CLOCK_ENABLE,
nip_uxn_opcodes_h_l1847_c41_363f_phase,
nip_uxn_opcodes_h_l1847_c41_363f_ins,
nip_uxn_opcodes_h_l1847_c41_363f_pc,
nip_uxn_opcodes_h_l1847_c41_363f_previous_stack_read,
nip_uxn_opcodes_h_l1847_c41_363f_previous_ram_read,
nip_uxn_opcodes_h_l1847_c41_363f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7
opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_cond,
opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue,
opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse,
opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output);

-- printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514
printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514 : entity work.printf_uxn_opcodes_h_l1848_c28_0514_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3
opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_cond,
opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output);

-- swp_uxn_opcodes_h_l1849_c41_e6d7
swp_uxn_opcodes_h_l1849_c41_e6d7 : entity work.swp_0CLK_a45e5d62 port map (
clk,
swp_uxn_opcodes_h_l1849_c41_e6d7_CLOCK_ENABLE,
swp_uxn_opcodes_h_l1849_c41_e6d7_phase,
swp_uxn_opcodes_h_l1849_c41_e6d7_ins,
swp_uxn_opcodes_h_l1849_c41_e6d7_pc,
swp_uxn_opcodes_h_l1849_c41_e6d7_previous_stack_read,
swp_uxn_opcodes_h_l1849_c41_e6d7_previous_ram_read,
swp_uxn_opcodes_h_l1849_c41_e6d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a
BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d
opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond,
opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue,
opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse,
opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output);

-- swp2_uxn_opcodes_h_l1850_c41_8d46
swp2_uxn_opcodes_h_l1850_c41_8d46 : entity work.swp2_0CLK_6f1dc0f8 port map (
clk,
swp2_uxn_opcodes_h_l1850_c41_8d46_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l1850_c41_8d46_phase,
swp2_uxn_opcodes_h_l1850_c41_8d46_ins,
swp2_uxn_opcodes_h_l1850_c41_8d46_pc,
swp2_uxn_opcodes_h_l1850_c41_8d46_previous_stack_read,
swp2_uxn_opcodes_h_l1850_c41_8d46_previous_ram_read,
swp2_uxn_opcodes_h_l1850_c41_8d46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_left,
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_right,
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2
opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond,
opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output);

-- printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf
printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf : entity work.printf_uxn_opcodes_h_l1851_c28_2bdf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_left,
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_right,
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5
opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_cond,
opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output);

-- printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9
printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9 : entity work.printf_uxn_opcodes_h_l1852_c28_edf9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a
opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_cond,
opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue,
opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse,
opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output);

-- printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59
printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59 : entity work.printf_uxn_opcodes_h_l1853_c28_1e59_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5
opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_cond,
opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue,
opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse,
opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output);

-- printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073
printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073 : entity work.printf_uxn_opcodes_h_l1854_c28_9073_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_left,
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_right,
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7
opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond,
opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output);

-- printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d
printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d : entity work.printf_uxn_opcodes_h_l1855_c28_b81d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1856_c7_6010
opc_result_MUX_uxn_opcodes_h_l1856_c7_6010 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_cond,
opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue,
opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse,
opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output);

-- ovr2_uxn_opcodes_h_l1856_c41_1700
ovr2_uxn_opcodes_h_l1856_c41_1700 : entity work.ovr2_0CLK_57eb5902 port map (
clk,
ovr2_uxn_opcodes_h_l1856_c41_1700_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l1856_c41_1700_phase,
ovr2_uxn_opcodes_h_l1856_c41_1700_ins,
ovr2_uxn_opcodes_h_l1856_c41_1700_pc,
ovr2_uxn_opcodes_h_l1856_c41_1700_previous_stack_read,
ovr2_uxn_opcodes_h_l1856_c41_1700_previous_ram_read,
ovr2_uxn_opcodes_h_l1856_c41_1700_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f
opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_cond,
opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue,
opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse,
opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output);

-- equ_uxn_opcodes_h_l1857_c41_ab4f
equ_uxn_opcodes_h_l1857_c41_ab4f : entity work.equ_0CLK_67fe881f port map (
clk,
equ_uxn_opcodes_h_l1857_c41_ab4f_CLOCK_ENABLE,
equ_uxn_opcodes_h_l1857_c41_ab4f_phase,
equ_uxn_opcodes_h_l1857_c41_ab4f_ins,
equ_uxn_opcodes_h_l1857_c41_ab4f_pc,
equ_uxn_opcodes_h_l1857_c41_ab4f_previous_stack_read,
equ_uxn_opcodes_h_l1857_c41_ab4f_previous_ram_read,
equ_uxn_opcodes_h_l1857_c41_ab4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1858_c7_139d
opc_result_MUX_uxn_opcodes_h_l1858_c7_139d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_cond,
opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue,
opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse,
opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output);

-- equ2_uxn_opcodes_h_l1858_c41_e1c6
equ2_uxn_opcodes_h_l1858_c41_e1c6 : entity work.equ2_0CLK_5fcb251d port map (
clk,
equ2_uxn_opcodes_h_l1858_c41_e1c6_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l1858_c41_e1c6_phase,
equ2_uxn_opcodes_h_l1858_c41_e1c6_ins,
equ2_uxn_opcodes_h_l1858_c41_e1c6_pc,
equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_stack_read,
equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_ram_read,
equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81
opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_cond,
opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue,
opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse,
opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output);

-- printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46
printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46 : entity work.printf_uxn_opcodes_h_l1859_c28_1e46_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1860_c7_2134
opc_result_MUX_uxn_opcodes_h_l1860_c7_2134 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_cond,
opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue,
opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse,
opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output);

-- printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500
printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500 : entity work.printf_uxn_opcodes_h_l1860_c28_7500_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f
opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond,
opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue,
opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse,
opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output);

-- printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf
printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf : entity work.printf_uxn_opcodes_h_l1861_c28_97cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_left,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_right,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e
opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_cond,
opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output);

-- gth2_uxn_opcodes_h_l1862_c41_3ba2
gth2_uxn_opcodes_h_l1862_c41_3ba2 : entity work.gth2_0CLK_5fcb251d port map (
clk,
gth2_uxn_opcodes_h_l1862_c41_3ba2_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l1862_c41_3ba2_phase,
gth2_uxn_opcodes_h_l1862_c41_3ba2_ins,
gth2_uxn_opcodes_h_l1862_c41_3ba2_pc,
gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_stack_read,
gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_ram_read,
gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1863_c7_7288
opc_result_MUX_uxn_opcodes_h_l1863_c7_7288 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_cond,
opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue,
opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse,
opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output);

-- printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257
printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257 : entity work.printf_uxn_opcodes_h_l1863_c28_f257_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0
BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f
opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_cond,
opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue,
opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse,
opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output);

-- lth2_uxn_opcodes_h_l1864_c41_da70
lth2_uxn_opcodes_h_l1864_c41_da70 : entity work.lth2_0CLK_5fcb251d port map (
clk,
lth2_uxn_opcodes_h_l1864_c41_da70_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l1864_c41_da70_phase,
lth2_uxn_opcodes_h_l1864_c41_da70_ins,
lth2_uxn_opcodes_h_l1864_c41_da70_pc,
lth2_uxn_opcodes_h_l1864_c41_da70_previous_stack_read,
lth2_uxn_opcodes_h_l1864_c41_da70_previous_ram_read,
lth2_uxn_opcodes_h_l1864_c41_da70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1865_c7_7371
opc_result_MUX_uxn_opcodes_h_l1865_c7_7371 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_cond,
opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue,
opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse,
opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output);

-- printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12
printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12 : entity work.printf_uxn_opcodes_h_l1865_c28_1a12_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1
opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond,
opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output);

-- jmp2_uxn_opcodes_h_l1866_c41_5aa8
jmp2_uxn_opcodes_h_l1866_c41_5aa8 : entity work.jmp2_0CLK_06911bbe port map (
clk,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_phase,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_ins,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_pc,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_stack_read,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_ram_read,
jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1867_c7_da06
opc_result_MUX_uxn_opcodes_h_l1867_c7_da06 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_cond,
opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue,
opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse,
opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output);

-- printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6
printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6 : entity work.printf_uxn_opcodes_h_l1867_c28_53e6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_left,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_right,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64
opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_cond,
opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue,
opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse,
opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output);

-- printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7
printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7 : entity work.printf_uxn_opcodes_h_l1868_c28_daa7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f
opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond,
opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output);

-- printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0
printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0 : entity work.printf_uxn_opcodes_h_l1869_c28_00d0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75
opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_cond,
opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue,
opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse,
opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output);

-- printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c
printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c : entity work.printf_uxn_opcodes_h_l1870_c28_f71c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1871_c7_03df
opc_result_MUX_uxn_opcodes_h_l1871_c7_03df : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_cond,
opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue,
opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse,
opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output);

-- printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7
printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7 : entity work.printf_uxn_opcodes_h_l1871_c28_27c7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6
BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1
opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond,
opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue,
opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse,
opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output);

-- sth2_uxn_opcodes_h_l1872_c41_cd43
sth2_uxn_opcodes_h_l1872_c41_cd43 : entity work.sth2_0CLK_9c3c4e32 port map (
clk,
sth2_uxn_opcodes_h_l1872_c41_cd43_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l1872_c41_cd43_phase,
sth2_uxn_opcodes_h_l1872_c41_cd43_ins,
sth2_uxn_opcodes_h_l1872_c41_cd43_pc,
sth2_uxn_opcodes_h_l1872_c41_cd43_previous_stack_read,
sth2_uxn_opcodes_h_l1872_c41_cd43_previous_ram_read,
sth2_uxn_opcodes_h_l1872_c41_cd43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea
opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_cond,
opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue,
opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse,
opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output);

-- printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9
printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9 : entity work.printf_uxn_opcodes_h_l1873_c28_cbe9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2
opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_cond,
opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue,
opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse,
opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output);

-- printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625
printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625 : entity work.printf_uxn_opcodes_h_l1874_c28_b625_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_left,
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_right,
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77
opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_cond,
opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue,
opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse,
opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output);

-- printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a
printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a : entity work.printf_uxn_opcodes_h_l1875_c28_2b4a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1876_c7_6150
opc_result_MUX_uxn_opcodes_h_l1876_c7_6150 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_cond,
opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue,
opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse,
opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output);

-- printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06
printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06 : entity work.printf_uxn_opcodes_h_l1876_c28_fc06_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_left,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_right,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86
opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_cond,
opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue,
opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse,
opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output);

-- printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df
printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df : entity work.printf_uxn_opcodes_h_l1877_c28_06df_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1878_c7_b143
opc_result_MUX_uxn_opcodes_h_l1878_c7_b143 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_cond,
opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue,
opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse,
opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output);

-- printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1
printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1 : entity work.printf_uxn_opcodes_h_l1878_c28_0eb1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_left,
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_right,
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1879_c7_750b
opc_result_MUX_uxn_opcodes_h_l1879_c7_750b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_cond,
opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue,
opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse,
opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output);

-- printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d
printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d : entity work.printf_uxn_opcodes_h_l1879_c28_2a4d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_left,
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_right,
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5
opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond,
opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output);

-- printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a
printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a : entity work.printf_uxn_opcodes_h_l1880_c28_f84a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7
opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond,
opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue,
opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse,
opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output);

-- printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde
printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde : entity work.printf_uxn_opcodes_h_l1881_c28_4fde_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6
opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_cond,
opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output);

-- lda2_uxn_opcodes_h_l1882_c41_ad35
lda2_uxn_opcodes_h_l1882_c41_ad35 : entity work.lda2_0CLK_084aa6da port map (
clk,
lda2_uxn_opcodes_h_l1882_c41_ad35_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l1882_c41_ad35_phase,
lda2_uxn_opcodes_h_l1882_c41_ad35_ins,
lda2_uxn_opcodes_h_l1882_c41_ad35_pc,
lda2_uxn_opcodes_h_l1882_c41_ad35_previous_stack_read,
lda2_uxn_opcodes_h_l1882_c41_ad35_previous_ram_read,
lda2_uxn_opcodes_h_l1882_c41_ad35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1883_c7_436d
opc_result_MUX_uxn_opcodes_h_l1883_c7_436d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_cond,
opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue,
opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse,
opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output);

-- printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498
printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498 : entity work.printf_uxn_opcodes_h_l1883_c28_1498_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42
opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_cond,
opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue,
opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse,
opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output);

-- sta2_uxn_opcodes_h_l1884_c41_5c42
sta2_uxn_opcodes_h_l1884_c41_5c42 : entity work.sta2_0CLK_df540198 port map (
clk,
sta2_uxn_opcodes_h_l1884_c41_5c42_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l1884_c41_5c42_phase,
sta2_uxn_opcodes_h_l1884_c41_5c42_ins,
sta2_uxn_opcodes_h_l1884_c41_5c42_pc,
sta2_uxn_opcodes_h_l1884_c41_5c42_previous_stack_read,
sta2_uxn_opcodes_h_l1884_c41_5c42_previous_ram_read,
sta2_uxn_opcodes_h_l1884_c41_5c42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_left,
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_right,
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e
opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_cond,
opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue,
opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse,
opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output);

-- printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba
printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba : entity work.printf_uxn_opcodes_h_l1885_c28_caba_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_left,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_right,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10
opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_cond,
opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue,
opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse,
opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output);

-- printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0
printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0 : entity work.printf_uxn_opcodes_h_l1886_c28_a0f0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_left,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_right,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d
opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond,
opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue,
opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse,
opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output);

-- deo_uxn_opcodes_h_l1887_c41_bc2b
deo_uxn_opcodes_h_l1887_c41_bc2b : entity work.deo_0CLK_feda93f5 port map (
clk,
deo_uxn_opcodes_h_l1887_c41_bc2b_CLOCK_ENABLE,
deo_uxn_opcodes_h_l1887_c41_bc2b_phase,
deo_uxn_opcodes_h_l1887_c41_bc2b_ins,
deo_uxn_opcodes_h_l1887_c41_bc2b_pc,
deo_uxn_opcodes_h_l1887_c41_bc2b_previous_stack_read,
deo_uxn_opcodes_h_l1887_c41_bc2b_previous_ram_read,
deo_uxn_opcodes_h_l1887_c41_bc2b_previous_device_ram_read,
deo_uxn_opcodes_h_l1887_c41_bc2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_left,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_right,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda
opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_cond,
opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue,
opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse,
opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output);

-- deo2_uxn_opcodes_h_l1888_c41_84ce
deo2_uxn_opcodes_h_l1888_c41_84ce : entity work.deo2_0CLK_29335e8f port map (
clk,
deo2_uxn_opcodes_h_l1888_c41_84ce_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l1888_c41_84ce_phase,
deo2_uxn_opcodes_h_l1888_c41_84ce_ins,
deo2_uxn_opcodes_h_l1888_c41_84ce_pc,
deo2_uxn_opcodes_h_l1888_c41_84ce_previous_stack_read,
deo2_uxn_opcodes_h_l1888_c41_84ce_previous_ram_read,
deo2_uxn_opcodes_h_l1888_c41_84ce_previous_device_ram_read,
deo2_uxn_opcodes_h_l1888_c41_84ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_left,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_right,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1889_c7_f587
opc_result_MUX_uxn_opcodes_h_l1889_c7_f587 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_cond,
opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue,
opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse,
opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output);

-- printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37
printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37 : entity work.printf_uxn_opcodes_h_l1889_c28_9d37_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0
opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond,
opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue,
opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse,
opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output);

-- add2_uxn_opcodes_h_l1890_c41_0d4d
add2_uxn_opcodes_h_l1890_c41_0d4d : entity work.add2_0CLK_b14a5a36 port map (
clk,
add2_uxn_opcodes_h_l1890_c41_0d4d_CLOCK_ENABLE,
add2_uxn_opcodes_h_l1890_c41_0d4d_phase,
add2_uxn_opcodes_h_l1890_c41_0d4d_ins,
add2_uxn_opcodes_h_l1890_c41_0d4d_pc,
add2_uxn_opcodes_h_l1890_c41_0d4d_previous_stack_read,
add2_uxn_opcodes_h_l1890_c41_0d4d_previous_ram_read,
add2_uxn_opcodes_h_l1890_c41_0d4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff
opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond,
opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output);

-- printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569
printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569 : entity work.printf_uxn_opcodes_h_l1891_c28_f569_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_left,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_right,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5
opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_cond,
opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output);

-- sub2_uxn_opcodes_h_l1892_c41_a79f
sub2_uxn_opcodes_h_l1892_c41_a79f : entity work.sub2_0CLK_b14a5a36 port map (
clk,
sub2_uxn_opcodes_h_l1892_c41_a79f_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l1892_c41_a79f_phase,
sub2_uxn_opcodes_h_l1892_c41_a79f_ins,
sub2_uxn_opcodes_h_l1892_c41_a79f_pc,
sub2_uxn_opcodes_h_l1892_c41_a79f_previous_stack_read,
sub2_uxn_opcodes_h_l1892_c41_a79f_previous_ram_read,
sub2_uxn_opcodes_h_l1892_c41_a79f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_left,
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_right,
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1893_c7_1198
opc_result_MUX_uxn_opcodes_h_l1893_c7_1198 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_cond,
opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue,
opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse,
opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output);

-- printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4
printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4 : entity work.printf_uxn_opcodes_h_l1893_c28_1cf4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_left,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_right,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1894_c7_f967
opc_result_MUX_uxn_opcodes_h_l1894_c7_f967 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_cond,
opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue,
opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse,
opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output);

-- mul2_uxn_opcodes_h_l1894_c41_c141
mul2_uxn_opcodes_h_l1894_c41_c141 : entity work.mul2_0CLK_b14a5a36 port map (
clk,
mul2_uxn_opcodes_h_l1894_c41_c141_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l1894_c41_c141_phase,
mul2_uxn_opcodes_h_l1894_c41_c141_ins,
mul2_uxn_opcodes_h_l1894_c41_c141_pc,
mul2_uxn_opcodes_h_l1894_c41_c141_previous_stack_read,
mul2_uxn_opcodes_h_l1894_c41_c141_previous_ram_read,
mul2_uxn_opcodes_h_l1894_c41_c141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484
BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_left,
BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_right,
BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0
opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond,
opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output);

-- printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe
printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe : entity work.printf_uxn_opcodes_h_l1895_c28_aafe_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6
opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond,
opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue,
opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse,
opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output);

-- printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446
printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446 : entity work.printf_uxn_opcodes_h_l1896_c28_1446_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1897_c7_948c
opc_result_MUX_uxn_opcodes_h_l1897_c7_948c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_cond,
opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue,
opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse,
opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output);

-- printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944
printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944 : entity work.printf_uxn_opcodes_h_l1897_c28_b944_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c
opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_cond,
opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue,
opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse,
opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output);

-- and2_uxn_opcodes_h_l1898_c41_0a13
and2_uxn_opcodes_h_l1898_c41_0a13 : entity work.and2_0CLK_b14a5a36 port map (
clk,
and2_uxn_opcodes_h_l1898_c41_0a13_CLOCK_ENABLE,
and2_uxn_opcodes_h_l1898_c41_0a13_phase,
and2_uxn_opcodes_h_l1898_c41_0a13_ins,
and2_uxn_opcodes_h_l1898_c41_0a13_pc,
and2_uxn_opcodes_h_l1898_c41_0a13_previous_stack_read,
and2_uxn_opcodes_h_l1898_c41_0a13_previous_ram_read,
and2_uxn_opcodes_h_l1898_c41_0a13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8
opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_cond,
opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output);

-- printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404
printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404 : entity work.printf_uxn_opcodes_h_l1899_c28_6404_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_left,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_right,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1900_c7_c264
opc_result_MUX_uxn_opcodes_h_l1900_c7_c264 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_cond,
opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue,
opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse,
opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output);

-- printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64
printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64 : entity work.printf_uxn_opcodes_h_l1900_c28_ea64_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a
BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_left,
BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_right,
BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e
opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_cond,
opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue,
opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse,
opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output);

-- eor_uxn_opcodes_h_l1901_c41_82b4
eor_uxn_opcodes_h_l1901_c41_82b4 : entity work.eor_0CLK_06911bbe port map (
clk,
eor_uxn_opcodes_h_l1901_c41_82b4_CLOCK_ENABLE,
eor_uxn_opcodes_h_l1901_c41_82b4_phase,
eor_uxn_opcodes_h_l1901_c41_82b4_ins,
eor_uxn_opcodes_h_l1901_c41_82b4_pc,
eor_uxn_opcodes_h_l1901_c41_82b4_previous_stack_read,
eor_uxn_opcodes_h_l1901_c41_82b4_previous_ram_read,
eor_uxn_opcodes_h_l1901_c41_82b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7
opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond,
opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue,
opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse,
opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output);

-- eor2_uxn_opcodes_h_l1902_c41_297b
eor2_uxn_opcodes_h_l1902_c41_297b : entity work.eor2_0CLK_b14a5a36 port map (
clk,
eor2_uxn_opcodes_h_l1902_c41_297b_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l1902_c41_297b_phase,
eor2_uxn_opcodes_h_l1902_c41_297b_ins,
eor2_uxn_opcodes_h_l1902_c41_297b_pc,
eor2_uxn_opcodes_h_l1902_c41_297b_previous_stack_read,
eor2_uxn_opcodes_h_l1902_c41_297b_previous_ram_read,
eor2_uxn_opcodes_h_l1902_c41_297b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd
opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_cond,
opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue,
opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse,
opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output);

-- sft_uxn_opcodes_h_l1903_c41_3e60
sft_uxn_opcodes_h_l1903_c41_3e60 : entity work.sft_0CLK_0d42d320 port map (
clk,
sft_uxn_opcodes_h_l1903_c41_3e60_CLOCK_ENABLE,
sft_uxn_opcodes_h_l1903_c41_3e60_phase,
sft_uxn_opcodes_h_l1903_c41_3e60_ins,
sft_uxn_opcodes_h_l1903_c41_3e60_pc,
sft_uxn_opcodes_h_l1903_c41_3e60_previous_stack_read,
sft_uxn_opcodes_h_l1903_c41_3e60_previous_ram_read,
sft_uxn_opcodes_h_l1903_c41_3e60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output);

-- opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99
opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_cond,
opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue,
opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse,
opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output);

-- sft2_uxn_opcodes_h_l1904_c41_05ba
sft2_uxn_opcodes_h_l1904_c41_05ba : entity work.sft2_0CLK_51ffd248 port map (
clk,
sft2_uxn_opcodes_h_l1904_c41_05ba_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l1904_c41_05ba_phase,
sft2_uxn_opcodes_h_l1904_c41_05ba_ins,
sft2_uxn_opcodes_h_l1904_c41_05ba_pc,
sft2_uxn_opcodes_h_l1904_c41_05ba_previous_stack_read,
sft2_uxn_opcodes_h_l1904_c41_05ba_previous_ram_read,
sft2_uxn_opcodes_h_l1904_c41_05ba_return_output);

-- printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f
printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f : entity work.printf_uxn_opcodes_h_l1905_c9_924f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_arg0);

-- sp0_MUX_uxn_opcodes_h_l1907_c2_c73e
sp0_MUX_uxn_opcodes_h_l1907_c2_c73e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_cond,
sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue,
sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse,
sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output);

-- sp1_MUX_uxn_opcodes_h_l1907_c2_c73e
sp1_MUX_uxn_opcodes_h_l1907_c2_c73e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_cond,
sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue,
sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse,
sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output);

-- sp0_MUX_uxn_opcodes_h_l1908_c3_305c
sp0_MUX_uxn_opcodes_h_l1908_c3_305c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l1908_c3_305c_cond,
sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue,
sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse,
sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output);

-- sp1_MUX_uxn_opcodes_h_l1908_c3_305c
sp1_MUX_uxn_opcodes_h_l1908_c3_305c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l1908_c3_305c_cond,
sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue,
sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse,
sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb
BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_left,
BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_right,
BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a
BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output);

-- MUX_uxn_opcodes_h_l1917_c19_dbbf
MUX_uxn_opcodes_h_l1917_c19_dbbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1917_c19_dbbf_cond,
MUX_uxn_opcodes_h_l1917_c19_dbbf_iftrue,
MUX_uxn_opcodes_h_l1917_c19_dbbf_iffalse,
MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050
BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_left,
BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_right,
BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31
stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_cond,
stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405 : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address0,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_value,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address1,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9 : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address0,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_value,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address1,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output);

-- device_ram_update_uxn_opcodes_h_l1940_c26_04fc
device_ram_update_uxn_opcodes_h_l1940_c26_04fc : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address0,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_value,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_enable,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read0_enable,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address1,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read1_enable,
device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output,
 CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output,
 MUX_uxn_opcodes_h_l1830_c10_9171_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output,
 MUX_uxn_opcodes_h_l1831_c18_1b02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output,
 opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output,
 jci_uxn_opcodes_h_l1836_c41_0124_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output,
 jmi_uxn_opcodes_h_l1837_c41_76d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output,
 opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output,
 jsi_uxn_opcodes_h_l1838_c41_41d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output,
 opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output,
 lit_uxn_opcodes_h_l1839_c41_fda5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output,
 opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output,
 lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output,
 opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output,
 lit_uxn_opcodes_h_l1841_c41_10ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output,
 opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output,
 lit2_uxn_opcodes_h_l1842_c41_777e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output,
 opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output,
 opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output,
 inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output,
 opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output,
 pop_uxn_opcodes_h_l1845_c41_49f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output,
 opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output,
 pop2_uxn_opcodes_h_l1846_c41_7dee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output,
 opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output,
 nip_uxn_opcodes_h_l1847_c41_363f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output,
 opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output,
 swp_uxn_opcodes_h_l1849_c41_e6d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output,
 swp2_uxn_opcodes_h_l1850_c41_8d46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output,
 opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output,
 opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output,
 opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output,
 opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output,
 ovr2_uxn_opcodes_h_l1856_c41_1700_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output,
 opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output,
 equ_uxn_opcodes_h_l1857_c41_ab4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output,
 opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output,
 equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output,
 opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output,
 opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output,
 opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output,
 gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output,
 opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output,
 opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output,
 lth2_uxn_opcodes_h_l1864_c41_da70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output,
 opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output,
 jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output,
 opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output,
 opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output,
 opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output,
 opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output,
 opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output,
 sth2_uxn_opcodes_h_l1872_c41_cd43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output,
 opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output,
 opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output,
 opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output,
 opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output,
 opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output,
 opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output,
 opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output,
 opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output,
 lda2_uxn_opcodes_h_l1882_c41_ad35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output,
 opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output,
 opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output,
 sta2_uxn_opcodes_h_l1884_c41_5c42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output,
 opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output,
 opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output,
 opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output,
 deo_uxn_opcodes_h_l1887_c41_bc2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output,
 opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output,
 deo2_uxn_opcodes_h_l1888_c41_84ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output,
 opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output,
 add2_uxn_opcodes_h_l1890_c41_0d4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output,
 opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output,
 sub2_uxn_opcodes_h_l1892_c41_a79f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output,
 opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output,
 mul2_uxn_opcodes_h_l1894_c41_c141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output,
 opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output,
 opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output,
 opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output,
 and2_uxn_opcodes_h_l1898_c41_0a13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output,
 opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output,
 opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output,
 opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output,
 eor_uxn_opcodes_h_l1901_c41_82b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output,
 opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output,
 eor2_uxn_opcodes_h_l1902_c41_297b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output,
 opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output,
 sft_uxn_opcodes_h_l1903_c41_3e60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output,
 opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output,
 sft2_uxn_opcodes_h_l1904_c41_05ba_return_output,
 sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output,
 sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output,
 sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output,
 sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output,
 MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output,
 stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output,
 stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output,
 device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l1830_c2_1e92 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1830_c10_9171_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1830_c10_9171_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1830_c10_9171_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l1830_c30_9ae9_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l1830_c57_3cdf_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1830_c10_9171_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1835_c2_0836_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l1836_c41_0124_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l1836_c41_0124_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l1836_c41_0124_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l1836_c41_0124_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l1836_c41_0124_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l1836_c41_0124_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1839_c41_fda5_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1839_c41_fda5_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1839_c41_fda5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1839_c41_fda5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1839_c41_fda5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1839_c41_fda5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1841_c41_10ba_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1841_c41_10ba_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1841_c41_10ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1841_c41_10ba_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1841_c41_10ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l1841_c41_10ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1842_c41_777e_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1842_c41_777e_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1842_c41_777e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1842_c41_777e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1842_c41_777e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l1842_c41_777e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1843_c7_7095_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_pc : unsigned(15 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_pc : unsigned(15 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l1845_c41_49f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_pc : unsigned(15 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_pc : unsigned(15 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l1847_c41_363f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1848_c7_eab7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_pc : unsigned(15 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_pc : unsigned(15 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1851_c7_a2c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1852_c7_38d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1853_c7_c33a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1854_c7_baf5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1855_c7_c1d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_pc : unsigned(15 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_pc : unsigned(15 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_pc : unsigned(15 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1859_c7_7b81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1860_c7_2134_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1861_c7_4d7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_pc : unsigned(15 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1863_c7_7288_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_pc : unsigned(15 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l1864_c41_da70_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1865_c7_7371_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_pc : unsigned(15 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1867_c7_da06_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1868_c7_7d64_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1869_c7_8e5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1870_c7_dc75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1871_c7_03df_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_pc : unsigned(15 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1873_c7_0aea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1874_c7_cda2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1875_c7_cf77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1876_c7_6150_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1877_c7_9d86_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1878_c7_b143_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1879_c7_750b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1880_c7_d9b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1881_c7_9fd7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_pc : unsigned(15 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1883_c7_436d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_pc : unsigned(15 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1885_c7_e21e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1886_c7_2e10_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_pc : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_pc : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1889_c7_f587_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_pc : unsigned(15 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1891_c7_e6ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_pc : unsigned(15 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1893_c7_1198_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_pc : unsigned(15 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_previous_ram_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l1894_c41_c141_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1895_c7_1bd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1896_c7_aaa6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1897_c7_948c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_pc : unsigned(15 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_previous_ram_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l1898_c41_0a13_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1899_c7_66e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1900_c7_c264_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_pc : unsigned(15 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l1901_c41_82b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_pc : unsigned(15 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l1902_c41_297b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_pc : unsigned(15 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l1903_c41_3e60_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_pc : unsigned(15 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1907_c6_945a_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l1911_c4_2612 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l1909_c4_61d1 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1915_c18_ea13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1916_c19_e579_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1917_c82_4edb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1918_c22_baa2_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l1921_c3_a643 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l1930_c3_1b1f : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l1940_c2_3ae5 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l1942_c3_beca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l1943_c3_7f21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l1946_c3_776a_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1949_c34_2a30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l1950_c23_8819_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1951_c32_32fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1952_c33_1e5c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1953_c29_dc52_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1954_c30_331b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1955_c34_165c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l1956_c33_b44c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l1957_c31_51d1_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1958_c32_fe91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1908_l1917_l1920_DUPLICATE_251f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1909_DUPLICATE_33e0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l1945_l1941_DUPLICATE_7cdd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l1960_l1813_DUPLICATE_c6c3_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_right := to_unsigned(43, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_right := to_unsigned(3072, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_right := to_unsigned(42, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_right := to_unsigned(49, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_right := to_unsigned(29, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_right := to_unsigned(2048, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_right := to_unsigned(58, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_right := to_unsigned(56, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_right := to_unsigned(28, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_right := to_unsigned(14, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_right := to_unsigned(0, 1);
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_right := to_unsigned(22, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_right := to_unsigned(19, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_right := to_unsigned(1024, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_right := to_unsigned(26, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue := to_unsigned(0, 1);
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_right := to_unsigned(34, 6);
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_right := to_unsigned(3584, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_right := to_unsigned(51, 6);
     VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_right := to_unsigned(64, 7);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg0 := resize(VAR_ins, 32);
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse := opc_result;
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_pc := VAR_pc;
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_pc := VAR_pc;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_pc := VAR_pc;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_pc := VAR_pc;
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_pc := VAR_pc;
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_pc := VAR_pc;
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_pc := VAR_pc;
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_pc := VAR_pc;
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_pc := VAR_pc;
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_pc := VAR_pc;
     VAR_jci_uxn_opcodes_h_l1836_c41_0124_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_pc := VAR_pc;
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_pc := VAR_pc;
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l1842_c41_777e_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l1839_c41_fda5_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l1841_c41_10ba_pc := VAR_pc;
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_pc := VAR_pc;
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_pc := VAR_pc;
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_pc := VAR_pc;
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_pc := VAR_pc;
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_pc := VAR_pc;
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_pc := VAR_pc;
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_pc := VAR_pc;
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_pc := VAR_pc;
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_pc := VAR_pc;
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_pc := VAR_pc;
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_pc := VAR_pc;
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_pc := VAR_pc;
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l1836_c41_0124_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l1842_c41_777e_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l1839_c41_fda5_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l1841_c41_10ba_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg2 := resize(VAR_phase, 32);
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_phase := VAR_phase;
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_previous_ram_read := VAR_previous_ram_read;
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_previous_ram_read := VAR_previous_ram_read;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_ram_read := VAR_previous_ram_read;
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_previous_ram_read := VAR_previous_ram_read;
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_previous_ram_read := VAR_previous_ram_read;
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_ram_read := VAR_previous_ram_read;
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_previous_ram_read := VAR_previous_ram_read;
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_ram_read := VAR_previous_ram_read;
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l1836_c41_0124_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_previous_ram_read := VAR_previous_ram_read;
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l1842_c41_777e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l1839_c41_fda5_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l1841_c41_10ba_previous_ram_read := VAR_previous_ram_read;
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_previous_ram_read := VAR_previous_ram_read;
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_previous_ram_read := VAR_previous_ram_read;
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_previous_ram_read := VAR_previous_ram_read;
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_previous_ram_read := VAR_previous_ram_read;
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_previous_ram_read := VAR_previous_ram_read;
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_previous_ram_read := VAR_previous_ram_read;
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_previous_ram_read := VAR_previous_ram_read;
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_previous_ram_read := VAR_previous_ram_read;
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_previous_ram_read := VAR_previous_ram_read;
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_previous_ram_read := VAR_previous_ram_read;
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_previous_ram_read := VAR_previous_ram_read;
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_previous_ram_read := VAR_previous_ram_read;
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_previous_ram_read := VAR_previous_ram_read;
     REG_VAR_sp := sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l1836_c41_0124_previous_stack_read := stack_read_value;
     VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_stack_read := stack_read_value;
     VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l1842_c41_777e_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l1839_c41_fda5_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l1841_c41_10ba_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_previous_stack_read := stack_read_value;
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_previous_stack_read := stack_read_value;
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1883_c7_436d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1883_c7_436d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1880_c7_d9b5] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1880_c7_d9b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1854_c7_baf5] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1854_c7_baf5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1835_c2_0836] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1835_c2_0836_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1871_c7_03df] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1871_c7_03df_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1877_c7_9d86] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1877_c7_9d86_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1843_c7_7095] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1843_c7_7095_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1896_c7_aaa6] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1896_c7_aaa6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1870_c7_dc75] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1870_c7_dc75_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1852_c7_38d5] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1852_c7_38d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1889_c7_f587] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1889_c7_f587_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1875_c7_cf77] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1875_c7_cf77_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1869_c7_8e5f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1869_c7_8e5f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1881_c7_9fd7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1881_c7_9fd7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1878_c7_b143] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1878_c7_b143_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1885_c7_e21e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1885_c7_e21e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1893_c7_1198] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1893_c7_1198_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1860_c7_2134] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1860_c7_2134_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1899_c7_66e8] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1899_c7_66e8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1876_c7_6150] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1876_c7_6150_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1897_c7_948c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1897_c7_948c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1895_c7_1bd0] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1895_c7_1bd0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1865_c7_7371] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1865_c7_7371_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1868_c7_7d64] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1868_c7_7d64_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l1831_c18_6a62] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_left;
     BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output := BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1874_c7_cda2] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1874_c7_cda2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1859_c7_7b81] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1859_c7_7b81_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1891_c7_e6ff] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1891_c7_e6ff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1900_c7_c264] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1900_c7_c264_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1867_c7_da06] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1867_c7_da06_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1853_c7_c33a] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1853_c7_c33a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- CAST_TO_uint12_t[uxn_opcodes_h_l1830_c57_3cdf] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l1830_c57_3cdf_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1848_c7_eab7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1848_c7_eab7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l1830_c41_664d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_left;
     BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output := BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1886_c7_2e10] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1886_c7_2e10_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1879_c7_750b] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1879_c7_750b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1861_c7_4d7f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1861_c7_4d7f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1873_c7_0aea] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1873_c7_0aea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1851_c7_a2c2] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1851_c7_a2c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1855_c7_c1d7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1855_c7_c1d7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l1863_c7_7288] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1863_c7_7288_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l1830_c10_fc62] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_left;
     BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output := BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c10_fc62_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c18_6a62_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l1830_c57_3cdf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1835_c2_0836_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1843_c7_7095_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1848_c7_eab7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1851_c7_a2c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1852_c7_38d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1853_c7_c33a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1854_c7_baf5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1855_c7_c1d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1859_c7_7b81_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1860_c7_2134_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1861_c7_4d7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1863_c7_7288_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1865_c7_7371_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1867_c7_da06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1868_c7_7d64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1869_c7_8e5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1870_c7_dc75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1871_c7_03df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1873_c7_0aea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1874_c7_cda2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1875_c7_cf77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1876_c7_6150_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1877_c7_9d86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1878_c7_b143_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1879_c7_750b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1880_c7_d9b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1881_c7_9fd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1883_c7_436d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1885_c7_e21e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1886_c7_2e10_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1889_c7_f587_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1891_c7_e6ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1893_c7_1198_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1895_c7_1bd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1896_c7_aaa6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1897_c7_948c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1899_c7_66e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l1900_c7_c264_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1830_c10_2825] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_left;
     BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output := BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l1830_c57_6c80] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_x <= VAR_CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output := CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1831_c18_dfe4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_left;
     BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output := BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l1830_c30_9ae9] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l1830_c30_9ae9_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l1830_c41_664d_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1830_c10_9171_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1830_c10_2825_return_output;
     VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c18_dfe4_return_output;
     VAR_MUX_uxn_opcodes_h_l1830_c10_9171_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l1830_c30_9ae9_return_output;
     VAR_MUX_uxn_opcodes_h_l1830_c10_9171_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l1830_c57_6c80_return_output;
     -- MUX[uxn_opcodes_h_l1831_c18_1b02] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1831_c18_1b02_cond <= VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_cond;
     MUX_uxn_opcodes_h_l1831_c18_1b02_iftrue <= VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_iftrue;
     MUX_uxn_opcodes_h_l1831_c18_1b02_iffalse <= VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_return_output := MUX_uxn_opcodes_h_l1831_c18_1b02_return_output;

     -- MUX[uxn_opcodes_h_l1830_c10_9171] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1830_c10_9171_cond <= VAR_MUX_uxn_opcodes_h_l1830_c10_9171_cond;
     MUX_uxn_opcodes_h_l1830_c10_9171_iftrue <= VAR_MUX_uxn_opcodes_h_l1830_c10_9171_iftrue;
     MUX_uxn_opcodes_h_l1830_c10_9171_iffalse <= VAR_MUX_uxn_opcodes_h_l1830_c10_9171_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1830_c10_9171_return_output := MUX_uxn_opcodes_h_l1830_c10_9171_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l1830_c2_1e92 := VAR_MUX_uxn_opcodes_h_l1830_c10_9171_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_left := VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l1831_c18_1b02_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_left := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l1830_c2_1e92;
     VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg1 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     VAR_printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_arg0 := resize(VAR_opc_uxn_opcodes_h_l1830_c2_1e92, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_9ca6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1897_c11_55a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_5a3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1895_c11_d484] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_left;
     BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output := BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1856_c11_75ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1884_c11_a1aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1846_c11_af98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1838_c11_2da9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_e16b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_118d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1855_c11_761f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_9d78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_eb89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_1120] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1842_c11_50ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_d979] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_af3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1864_c11_e5e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_31f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_5d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_cec1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1901_c11_426a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_7fc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1852_c11_a933] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_left;
     BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output := BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_3e82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_2fe3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1893_c11_2160] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_left;
     BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output := BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1902_c11_ca4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_8c28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1898_c11_3e0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c6_6b6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_467b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_5fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_27c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1851_c11_4447] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_left;
     BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output := BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1875_c11_3760] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_left;
     BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output := BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_41b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1881_c11_89d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_ae55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1885_c11_054b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_51ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_bab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_1d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c11_68e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_76e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_4013] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_left;
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output := BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_262f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_81fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1872_c11_f0e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1879_c11_5731] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_left;
     BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output := BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output;

     -- printf_uxn_opcodes_h_l1833_c2_42b7[uxn_opcodes_h_l1833_c2_42b7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg0 <= VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg0;
     printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg1 <= VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg1;
     printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg2 <= VAR_printf_uxn_opcodes_h_l1833_c2_42b7_uxn_opcodes_h_l1833_c2_42b7_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_9f68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_9f0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1850_c11_6d8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_65cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_7617] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_left;
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output := BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_0267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_left;
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output := BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_9a3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1890_c11_8e4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_c61e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_bc6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_cd97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_c938] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1880_c11_e010] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_left;
     BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output := BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_14c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1847_c11_03c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_3924] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_8290] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_left;
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output := BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_a3ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_d035] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_4080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_left;
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output := BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c6_6b6b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_31f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_cec1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_2da9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_9f0a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_bab7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_4080_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_50ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_41b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_68e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_a3ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_af98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c11_03c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5d76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_5a3d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1850_c11_6d8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_4447_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_a933_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_14c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_65cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_761f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_75ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_76e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_d979_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_7fc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_5fb0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_27c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ae55_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_8c28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1864_c11_e5e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_9f68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_bc6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_51ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_467b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_cd97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_3924_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_2fe3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1872_c11_f0e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_262f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_1d76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_3760_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_9a3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_0267_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_af3e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_5731_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e010_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_89d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_eb89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_81fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_a1aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_054b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_118d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_8290_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_3e82_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_c61e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_8e4b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_c938_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7617_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_2160_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_4013_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c11_d484_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_9d78_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_55a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_3e0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_d035_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_e16b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1901_c11_426a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_ca4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1120_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_9ca6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1836_c7_c774] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c7_c774_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1836_c1_ce74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1837_c7_85e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output;
     VAR_jci_uxn_opcodes_h_l1836_c41_0124_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1836_c1_ce74_return_output;
     -- jci[uxn_opcodes_h_l1836_c41_0124] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l1836_c41_0124_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l1836_c41_0124_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l1836_c41_0124_phase <= VAR_jci_uxn_opcodes_h_l1836_c41_0124_phase;
     jci_uxn_opcodes_h_l1836_c41_0124_pc <= VAR_jci_uxn_opcodes_h_l1836_c41_0124_pc;
     jci_uxn_opcodes_h_l1836_c41_0124_previous_stack_read <= VAR_jci_uxn_opcodes_h_l1836_c41_0124_previous_stack_read;
     jci_uxn_opcodes_h_l1836_c41_0124_previous_ram_read <= VAR_jci_uxn_opcodes_h_l1836_c41_0124_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l1836_c41_0124_return_output := jci_uxn_opcodes_h_l1836_c41_0124_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1838_c7_90ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1837_c1_8eea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output;
     VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1837_c1_8eea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue := VAR_jci_uxn_opcodes_h_l1836_c41_0124_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1838_c1_9c1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1839_c7_0a76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output;

     -- jmi[uxn_opcodes_h_l1837_c41_76d2] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l1837_c41_76d2_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l1837_c41_76d2_phase <= VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_phase;
     jmi_uxn_opcodes_h_l1837_c41_76d2_pc <= VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_pc;
     jmi_uxn_opcodes_h_l1837_c41_76d2_previous_stack_read <= VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_previous_stack_read;
     jmi_uxn_opcodes_h_l1837_c41_76d2_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_return_output := jmi_uxn_opcodes_h_l1837_c41_76d2_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output;
     VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1838_c1_9c1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue := VAR_jmi_uxn_opcodes_h_l1837_c41_76d2_return_output;
     -- jsi[uxn_opcodes_h_l1838_c41_41d7] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l1838_c41_41d7_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l1838_c41_41d7_phase <= VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_phase;
     jsi_uxn_opcodes_h_l1838_c41_41d7_pc <= VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_pc;
     jsi_uxn_opcodes_h_l1838_c41_41d7_previous_stack_read <= VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_previous_stack_read;
     jsi_uxn_opcodes_h_l1838_c41_41d7_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_return_output := jsi_uxn_opcodes_h_l1838_c41_41d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1840_c7_d559] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1839_c1_6a50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c7_d559_return_output;
     VAR_lit_uxn_opcodes_h_l1839_c41_fda5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1839_c1_6a50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue := VAR_jsi_uxn_opcodes_h_l1838_c41_41d7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1840_c1_dfb7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output;

     -- lit[uxn_opcodes_h_l1839_c41_fda5] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l1839_c41_fda5_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l1839_c41_fda5_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l1839_c41_fda5_phase <= VAR_lit_uxn_opcodes_h_l1839_c41_fda5_phase;
     lit_uxn_opcodes_h_l1839_c41_fda5_pc <= VAR_lit_uxn_opcodes_h_l1839_c41_fda5_pc;
     lit_uxn_opcodes_h_l1839_c41_fda5_previous_stack_read <= VAR_lit_uxn_opcodes_h_l1839_c41_fda5_previous_stack_read;
     lit_uxn_opcodes_h_l1839_c41_fda5_previous_ram_read <= VAR_lit_uxn_opcodes_h_l1839_c41_fda5_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l1839_c41_fda5_return_output := lit_uxn_opcodes_h_l1839_c41_fda5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1841_c7_d41e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output;
     VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1840_c1_dfb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue := VAR_lit_uxn_opcodes_h_l1839_c41_fda5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1842_c7_0089] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output;

     -- lit2[uxn_opcodes_h_l1840_c41_3dd1] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l1840_c41_3dd1_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l1840_c41_3dd1_phase <= VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_phase;
     lit2_uxn_opcodes_h_l1840_c41_3dd1_pc <= VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_pc;
     lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_stack_read;
     lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output := lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1841_c1_40a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c7_0089_return_output;
     VAR_lit_uxn_opcodes_h_l1841_c41_10ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1841_c1_40a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue := VAR_lit2_uxn_opcodes_h_l1840_c41_3dd1_return_output;
     -- lit[uxn_opcodes_h_l1841_c41_10ba] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l1841_c41_10ba_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l1841_c41_10ba_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l1841_c41_10ba_phase <= VAR_lit_uxn_opcodes_h_l1841_c41_10ba_phase;
     lit_uxn_opcodes_h_l1841_c41_10ba_pc <= VAR_lit_uxn_opcodes_h_l1841_c41_10ba_pc;
     lit_uxn_opcodes_h_l1841_c41_10ba_previous_stack_read <= VAR_lit_uxn_opcodes_h_l1841_c41_10ba_previous_stack_read;
     lit_uxn_opcodes_h_l1841_c41_10ba_previous_ram_read <= VAR_lit_uxn_opcodes_h_l1841_c41_10ba_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l1841_c41_10ba_return_output := lit_uxn_opcodes_h_l1841_c41_10ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1842_c1_9b94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1843_c7_7095] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c7_7095_return_output;
     VAR_lit2_uxn_opcodes_h_l1842_c41_777e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1842_c1_9b94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue := VAR_lit_uxn_opcodes_h_l1841_c41_10ba_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1843_c1_0f96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output;

     -- lit2[uxn_opcodes_h_l1842_c41_777e] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l1842_c41_777e_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l1842_c41_777e_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l1842_c41_777e_phase <= VAR_lit2_uxn_opcodes_h_l1842_c41_777e_phase;
     lit2_uxn_opcodes_h_l1842_c41_777e_pc <= VAR_lit2_uxn_opcodes_h_l1842_c41_777e_pc;
     lit2_uxn_opcodes_h_l1842_c41_777e_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l1842_c41_777e_previous_stack_read;
     lit2_uxn_opcodes_h_l1842_c41_777e_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l1842_c41_777e_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l1842_c41_777e_return_output := lit2_uxn_opcodes_h_l1842_c41_777e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1844_c7_fa41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output;
     VAR_printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1843_c1_0f96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue := VAR_lit2_uxn_opcodes_h_l1842_c41_777e_return_output;
     -- printf_uxn_opcodes_h_l1843_c28_df86[uxn_opcodes_h_l1843_c28_df86] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_arg0 <= VAR_printf_uxn_opcodes_h_l1843_c28_df86_uxn_opcodes_h_l1843_c28_df86_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1845_c7_142d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1844_c1_78af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c7_142d_return_output;
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1844_c1_78af_return_output;
     -- inc2[uxn_opcodes_h_l1844_c41_f2dc] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l1844_c41_f2dc_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l1844_c41_f2dc_phase <= VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_phase;
     inc2_uxn_opcodes_h_l1844_c41_f2dc_ins <= VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_ins;
     inc2_uxn_opcodes_h_l1844_c41_f2dc_pc <= VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_pc;
     inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_stack_read;
     inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_ram_read <= VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_previous_ram_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output := inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1845_c1_b207] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1846_c7_d8d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output;
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1845_c1_b207_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue := VAR_inc2_uxn_opcodes_h_l1844_c41_f2dc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1846_c1_2e70] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1847_c7_3be0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output;

     -- pop[uxn_opcodes_h_l1845_c41_49f4] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l1845_c41_49f4_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l1845_c41_49f4_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l1845_c41_49f4_phase <= VAR_pop_uxn_opcodes_h_l1845_c41_49f4_phase;
     pop_uxn_opcodes_h_l1845_c41_49f4_ins <= VAR_pop_uxn_opcodes_h_l1845_c41_49f4_ins;
     pop_uxn_opcodes_h_l1845_c41_49f4_pc <= VAR_pop_uxn_opcodes_h_l1845_c41_49f4_pc;
     pop_uxn_opcodes_h_l1845_c41_49f4_previous_stack_read <= VAR_pop_uxn_opcodes_h_l1845_c41_49f4_previous_stack_read;
     pop_uxn_opcodes_h_l1845_c41_49f4_previous_ram_read <= VAR_pop_uxn_opcodes_h_l1845_c41_49f4_previous_ram_read;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l1845_c41_49f4_return_output := pop_uxn_opcodes_h_l1845_c41_49f4_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output;
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1846_c1_2e70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue := VAR_pop_uxn_opcodes_h_l1845_c41_49f4_return_output;
     -- pop2[uxn_opcodes_h_l1846_c41_7dee] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l1846_c41_7dee_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l1846_c41_7dee_phase <= VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_phase;
     pop2_uxn_opcodes_h_l1846_c41_7dee_ins <= VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_ins;
     pop2_uxn_opcodes_h_l1846_c41_7dee_pc <= VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_pc;
     pop2_uxn_opcodes_h_l1846_c41_7dee_previous_stack_read <= VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_previous_stack_read;
     pop2_uxn_opcodes_h_l1846_c41_7dee_previous_ram_read <= VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_previous_ram_read;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_return_output := pop2_uxn_opcodes_h_l1846_c41_7dee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1847_c1_763a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1848_c7_eab7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output;
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_763a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue := VAR_pop2_uxn_opcodes_h_l1846_c41_7dee_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1849_c7_17f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1848_c1_39ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output;

     -- nip[uxn_opcodes_h_l1847_c41_363f] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l1847_c41_363f_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l1847_c41_363f_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l1847_c41_363f_phase <= VAR_nip_uxn_opcodes_h_l1847_c41_363f_phase;
     nip_uxn_opcodes_h_l1847_c41_363f_ins <= VAR_nip_uxn_opcodes_h_l1847_c41_363f_ins;
     nip_uxn_opcodes_h_l1847_c41_363f_pc <= VAR_nip_uxn_opcodes_h_l1847_c41_363f_pc;
     nip_uxn_opcodes_h_l1847_c41_363f_previous_stack_read <= VAR_nip_uxn_opcodes_h_l1847_c41_363f_previous_stack_read;
     nip_uxn_opcodes_h_l1847_c41_363f_previous_ram_read <= VAR_nip_uxn_opcodes_h_l1847_c41_363f_previous_ram_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l1847_c41_363f_return_output := nip_uxn_opcodes_h_l1847_c41_363f_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output;
     VAR_printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_39ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue := VAR_nip_uxn_opcodes_h_l1847_c41_363f_return_output;
     -- printf_uxn_opcodes_h_l1848_c28_0514[uxn_opcodes_h_l1848_c28_0514] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_arg0 <= VAR_printf_uxn_opcodes_h_l1848_c28_0514_uxn_opcodes_h_l1848_c28_0514_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1850_c7_dc7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1849_c1_4e54] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output;
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1849_c1_4e54_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1850_c1_f22c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output;

     -- swp[uxn_opcodes_h_l1849_c41_e6d7] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l1849_c41_e6d7_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l1849_c41_e6d7_phase <= VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_phase;
     swp_uxn_opcodes_h_l1849_c41_e6d7_ins <= VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_ins;
     swp_uxn_opcodes_h_l1849_c41_e6d7_pc <= VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_pc;
     swp_uxn_opcodes_h_l1849_c41_e6d7_previous_stack_read <= VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_previous_stack_read;
     swp_uxn_opcodes_h_l1849_c41_e6d7_previous_ram_read <= VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_previous_ram_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_return_output := swp_uxn_opcodes_h_l1849_c41_e6d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1851_c7_a2c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output;
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1850_c1_f22c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue := VAR_swp_uxn_opcodes_h_l1849_c41_e6d7_return_output;
     -- swp2[uxn_opcodes_h_l1850_c41_8d46] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l1850_c41_8d46_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l1850_c41_8d46_phase <= VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_phase;
     swp2_uxn_opcodes_h_l1850_c41_8d46_ins <= VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_ins;
     swp2_uxn_opcodes_h_l1850_c41_8d46_pc <= VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_pc;
     swp2_uxn_opcodes_h_l1850_c41_8d46_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_previous_stack_read;
     swp2_uxn_opcodes_h_l1850_c41_8d46_previous_ram_read <= VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_previous_ram_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_return_output := swp2_uxn_opcodes_h_l1850_c41_8d46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1852_c7_38d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1851_c1_62a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output;
     VAR_printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_62a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue := VAR_swp2_uxn_opcodes_h_l1850_c41_8d46_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c7_c33a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1852_c1_a4b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output;

     -- printf_uxn_opcodes_h_l1851_c28_2bdf[uxn_opcodes_h_l1851_c28_2bdf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_arg0 <= VAR_printf_uxn_opcodes_h_l1851_c28_2bdf_uxn_opcodes_h_l1851_c28_2bdf_arg0;
     -- Outputs

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output;
     VAR_printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1852_c1_a4b9_return_output;
     -- printf_uxn_opcodes_h_l1852_c28_edf9[uxn_opcodes_h_l1852_c28_edf9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_arg0 <= VAR_printf_uxn_opcodes_h_l1852_c28_edf9_uxn_opcodes_h_l1852_c28_edf9_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1854_c7_baf5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c1_8610] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output;
     VAR_printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_8610_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1855_c7_c1d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1854_c1_2290] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output;

     -- printf_uxn_opcodes_h_l1853_c28_1e59[uxn_opcodes_h_l1853_c28_1e59] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_arg0 <= VAR_printf_uxn_opcodes_h_l1853_c28_1e59_uxn_opcodes_h_l1853_c28_1e59_arg0;
     -- Outputs

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output;
     VAR_printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1854_c1_2290_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1856_c7_6010] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1855_c1_1b35] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output;

     -- printf_uxn_opcodes_h_l1854_c28_9073[uxn_opcodes_h_l1854_c28_9073] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_arg0 <= VAR_printf_uxn_opcodes_h_l1854_c28_9073_uxn_opcodes_h_l1854_c28_9073_arg0;
     -- Outputs

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c7_6010_return_output;
     VAR_printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1855_c1_1b35_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1856_c1_077e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output;

     -- printf_uxn_opcodes_h_l1855_c28_b81d[uxn_opcodes_h_l1855_c28_b81d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_arg0 <= VAR_printf_uxn_opcodes_h_l1855_c28_b81d_uxn_opcodes_h_l1855_c28_b81d_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1857_c7_c20f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output;
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1856_c1_077e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1857_c1_e06d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output;

     -- ovr2[uxn_opcodes_h_l1856_c41_1700] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l1856_c41_1700_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l1856_c41_1700_phase <= VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_phase;
     ovr2_uxn_opcodes_h_l1856_c41_1700_ins <= VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_ins;
     ovr2_uxn_opcodes_h_l1856_c41_1700_pc <= VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_pc;
     ovr2_uxn_opcodes_h_l1856_c41_1700_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_previous_stack_read;
     ovr2_uxn_opcodes_h_l1856_c41_1700_previous_ram_read <= VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_previous_ram_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_return_output := ovr2_uxn_opcodes_h_l1856_c41_1700_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1858_c7_139d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c7_139d_return_output;
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1857_c1_e06d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue := VAR_ovr2_uxn_opcodes_h_l1856_c41_1700_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1859_c7_7b81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1858_c1_55cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output;

     -- equ[uxn_opcodes_h_l1857_c41_ab4f] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l1857_c41_ab4f_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l1857_c41_ab4f_phase <= VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_phase;
     equ_uxn_opcodes_h_l1857_c41_ab4f_ins <= VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_ins;
     equ_uxn_opcodes_h_l1857_c41_ab4f_pc <= VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_pc;
     equ_uxn_opcodes_h_l1857_c41_ab4f_previous_stack_read <= VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_previous_stack_read;
     equ_uxn_opcodes_h_l1857_c41_ab4f_previous_ram_read <= VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_previous_ram_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_return_output := equ_uxn_opcodes_h_l1857_c41_ab4f_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output;
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1858_c1_55cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue := VAR_equ_uxn_opcodes_h_l1857_c41_ab4f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c7_2134] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output;

     -- equ2[uxn_opcodes_h_l1858_c41_e1c6] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l1858_c41_e1c6_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l1858_c41_e1c6_phase <= VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_phase;
     equ2_uxn_opcodes_h_l1858_c41_e1c6_ins <= VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_ins;
     equ2_uxn_opcodes_h_l1858_c41_e1c6_pc <= VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_pc;
     equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_stack_read;
     equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_ram_read <= VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_previous_ram_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output := equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1859_c1_5839] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c7_2134_return_output;
     VAR_printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1859_c1_5839_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue := VAR_equ2_uxn_opcodes_h_l1858_c41_e1c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c1_cf38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output;

     -- printf_uxn_opcodes_h_l1859_c28_1e46[uxn_opcodes_h_l1859_c28_1e46] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_arg0 <= VAR_printf_uxn_opcodes_h_l1859_c28_1e46_uxn_opcodes_h_l1859_c28_1e46_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1861_c7_4d7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output;
     VAR_printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_cf38_return_output;
     -- printf_uxn_opcodes_h_l1860_c28_7500[uxn_opcodes_h_l1860_c28_7500] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_arg0 <= VAR_printf_uxn_opcodes_h_l1860_c28_7500_uxn_opcodes_h_l1860_c28_7500_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1861_c1_8f9f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1862_c7_be4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output;
     VAR_printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1861_c1_8f9f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1862_c1_ca76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1863_c7_7288] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output;

     -- printf_uxn_opcodes_h_l1861_c28_97cf[uxn_opcodes_h_l1861_c28_97cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_arg0 <= VAR_printf_uxn_opcodes_h_l1861_c28_97cf_uxn_opcodes_h_l1861_c28_97cf_arg0;
     -- Outputs

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c7_7288_return_output;
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1862_c1_ca76_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1864_c7_c41f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output;

     -- gth2[uxn_opcodes_h_l1862_c41_3ba2] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l1862_c41_3ba2_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l1862_c41_3ba2_phase <= VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_phase;
     gth2_uxn_opcodes_h_l1862_c41_3ba2_ins <= VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_ins;
     gth2_uxn_opcodes_h_l1862_c41_3ba2_pc <= VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_pc;
     gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_stack_read;
     gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_ram_read <= VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_previous_ram_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output := gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1863_c1_3c94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output;
     VAR_printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1863_c1_3c94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue := VAR_gth2_uxn_opcodes_h_l1862_c41_3ba2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1865_c7_7371] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output;

     -- printf_uxn_opcodes_h_l1863_c28_f257[uxn_opcodes_h_l1863_c28_f257] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_arg0 <= VAR_printf_uxn_opcodes_h_l1863_c28_f257_uxn_opcodes_h_l1863_c28_f257_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1864_c1_7e62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c7_7371_return_output;
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1864_c1_7e62_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1865_c1_5f36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1866_c7_d4f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output;

     -- lth2[uxn_opcodes_h_l1864_c41_da70] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l1864_c41_da70_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l1864_c41_da70_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l1864_c41_da70_phase <= VAR_lth2_uxn_opcodes_h_l1864_c41_da70_phase;
     lth2_uxn_opcodes_h_l1864_c41_da70_ins <= VAR_lth2_uxn_opcodes_h_l1864_c41_da70_ins;
     lth2_uxn_opcodes_h_l1864_c41_da70_pc <= VAR_lth2_uxn_opcodes_h_l1864_c41_da70_pc;
     lth2_uxn_opcodes_h_l1864_c41_da70_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l1864_c41_da70_previous_stack_read;
     lth2_uxn_opcodes_h_l1864_c41_da70_previous_ram_read <= VAR_lth2_uxn_opcodes_h_l1864_c41_da70_previous_ram_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l1864_c41_da70_return_output := lth2_uxn_opcodes_h_l1864_c41_da70_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output;
     VAR_printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_5f36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue := VAR_lth2_uxn_opcodes_h_l1864_c41_da70_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1867_c7_da06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output;

     -- printf_uxn_opcodes_h_l1865_c28_1a12[uxn_opcodes_h_l1865_c28_1a12] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_arg0 <= VAR_printf_uxn_opcodes_h_l1865_c28_1a12_uxn_opcodes_h_l1865_c28_1a12_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1866_c1_3f17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c7_da06_return_output;
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1866_c1_3f17_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1868_c7_7d64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1867_c1_0161] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output;

     -- jmp2[uxn_opcodes_h_l1866_c41_5aa8] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l1866_c41_5aa8_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l1866_c41_5aa8_phase <= VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_phase;
     jmp2_uxn_opcodes_h_l1866_c41_5aa8_ins <= VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_ins;
     jmp2_uxn_opcodes_h_l1866_c41_5aa8_pc <= VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_pc;
     jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_stack_read;
     jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_ram_read <= VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_previous_ram_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output := jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output;
     VAR_printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_0161_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue := VAR_jmp2_uxn_opcodes_h_l1866_c41_5aa8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1869_c7_8e5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output;

     -- printf_uxn_opcodes_h_l1867_c28_53e6[uxn_opcodes_h_l1867_c28_53e6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_arg0 <= VAR_printf_uxn_opcodes_h_l1867_c28_53e6_uxn_opcodes_h_l1867_c28_53e6_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1868_c1_9706] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output;
     VAR_printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1868_c1_9706_return_output;
     -- printf_uxn_opcodes_h_l1868_c28_daa7[uxn_opcodes_h_l1868_c28_daa7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_arg0 <= VAR_printf_uxn_opcodes_h_l1868_c28_daa7_uxn_opcodes_h_l1868_c28_daa7_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1869_c1_65b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1870_c7_dc75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output;
     VAR_printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1869_c1_65b8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1871_c7_03df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output;

     -- printf_uxn_opcodes_h_l1869_c28_00d0[uxn_opcodes_h_l1869_c28_00d0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_arg0 <= VAR_printf_uxn_opcodes_h_l1869_c28_00d0_uxn_opcodes_h_l1869_c28_00d0_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1870_c1_c61d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c7_03df_return_output;
     VAR_printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1870_c1_c61d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1871_c1_85a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output;

     -- printf_uxn_opcodes_h_l1870_c28_f71c[uxn_opcodes_h_l1870_c28_f71c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_arg0 <= VAR_printf_uxn_opcodes_h_l1870_c28_f71c_uxn_opcodes_h_l1870_c28_f71c_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1872_c7_1ba1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output;
     VAR_printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1871_c1_85a4_return_output;
     -- printf_uxn_opcodes_h_l1871_c28_27c7[uxn_opcodes_h_l1871_c28_27c7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_arg0 <= VAR_printf_uxn_opcodes_h_l1871_c28_27c7_uxn_opcodes_h_l1871_c28_27c7_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1872_c1_fe04] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1873_c7_0aea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output;
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1872_c1_fe04_return_output;
     -- sth2[uxn_opcodes_h_l1872_c41_cd43] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l1872_c41_cd43_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l1872_c41_cd43_phase <= VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_phase;
     sth2_uxn_opcodes_h_l1872_c41_cd43_ins <= VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_ins;
     sth2_uxn_opcodes_h_l1872_c41_cd43_pc <= VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_pc;
     sth2_uxn_opcodes_h_l1872_c41_cd43_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_previous_stack_read;
     sth2_uxn_opcodes_h_l1872_c41_cd43_previous_ram_read <= VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_previous_ram_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_return_output := sth2_uxn_opcodes_h_l1872_c41_cd43_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1874_c7_cda2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1873_c1_f793] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output;
     VAR_printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1873_c1_f793_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue := VAR_sth2_uxn_opcodes_h_l1872_c41_cd43_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1874_c1_aea0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output;

     -- printf_uxn_opcodes_h_l1873_c28_cbe9[uxn_opcodes_h_l1873_c28_cbe9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_arg0 <= VAR_printf_uxn_opcodes_h_l1873_c28_cbe9_uxn_opcodes_h_l1873_c28_cbe9_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1875_c7_cf77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output;
     VAR_printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1874_c1_aea0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1876_c7_6150] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output;

     -- printf_uxn_opcodes_h_l1874_c28_b625[uxn_opcodes_h_l1874_c28_b625] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_arg0 <= VAR_printf_uxn_opcodes_h_l1874_c28_b625_uxn_opcodes_h_l1874_c28_b625_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1875_c1_23be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c7_6150_return_output;
     VAR_printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1875_c1_23be_return_output;
     -- printf_uxn_opcodes_h_l1875_c28_2b4a[uxn_opcodes_h_l1875_c28_2b4a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_arg0 <= VAR_printf_uxn_opcodes_h_l1875_c28_2b4a_uxn_opcodes_h_l1875_c28_2b4a_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1876_c1_0752] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1877_c7_9d86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output;
     VAR_printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1876_c1_0752_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1878_c7_b143] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output;

     -- printf_uxn_opcodes_h_l1876_c28_fc06[uxn_opcodes_h_l1876_c28_fc06] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_arg0 <= VAR_printf_uxn_opcodes_h_l1876_c28_fc06_uxn_opcodes_h_l1876_c28_fc06_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1877_c1_205f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c7_b143_return_output;
     VAR_printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1877_c1_205f_return_output;
     -- printf_uxn_opcodes_h_l1877_c28_06df[uxn_opcodes_h_l1877_c28_06df] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_arg0 <= VAR_printf_uxn_opcodes_h_l1877_c28_06df_uxn_opcodes_h_l1877_c28_06df_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1879_c7_750b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1878_c1_45bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c7_750b_return_output;
     VAR_printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1878_c1_45bd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1880_c7_d9b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output;

     -- printf_uxn_opcodes_h_l1878_c28_0eb1[uxn_opcodes_h_l1878_c28_0eb1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_arg0 <= VAR_printf_uxn_opcodes_h_l1878_c28_0eb1_uxn_opcodes_h_l1878_c28_0eb1_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1879_c1_3875] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output;
     VAR_printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1879_c1_3875_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1880_c1_ce78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1881_c7_9fd7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output;

     -- printf_uxn_opcodes_h_l1879_c28_2a4d[uxn_opcodes_h_l1879_c28_2a4d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_arg0 <= VAR_printf_uxn_opcodes_h_l1879_c28_2a4d_uxn_opcodes_h_l1879_c28_2a4d_arg0;
     -- Outputs

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output;
     VAR_printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1880_c1_ce78_return_output;
     -- printf_uxn_opcodes_h_l1880_c28_f84a[uxn_opcodes_h_l1880_c28_f84a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_arg0 <= VAR_printf_uxn_opcodes_h_l1880_c28_f84a_uxn_opcodes_h_l1880_c28_f84a_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1882_c7_40e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1881_c1_ff32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output;
     VAR_printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1881_c1_ff32_return_output;
     -- printf_uxn_opcodes_h_l1881_c28_4fde[uxn_opcodes_h_l1881_c28_4fde] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_arg0 <= VAR_printf_uxn_opcodes_h_l1881_c28_4fde_uxn_opcodes_h_l1881_c28_4fde_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1882_c1_d12f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1883_c7_436d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c7_436d_return_output;
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1882_c1_d12f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1883_c1_0e9c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output;

     -- lda2[uxn_opcodes_h_l1882_c41_ad35] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l1882_c41_ad35_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l1882_c41_ad35_phase <= VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_phase;
     lda2_uxn_opcodes_h_l1882_c41_ad35_ins <= VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_ins;
     lda2_uxn_opcodes_h_l1882_c41_ad35_pc <= VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_pc;
     lda2_uxn_opcodes_h_l1882_c41_ad35_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_previous_stack_read;
     lda2_uxn_opcodes_h_l1882_c41_ad35_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_return_output := lda2_uxn_opcodes_h_l1882_c41_ad35_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1884_c7_ea42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output;
     VAR_printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_0e9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue := VAR_lda2_uxn_opcodes_h_l1882_c41_ad35_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1885_c7_e21e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output;

     -- printf_uxn_opcodes_h_l1883_c28_1498[uxn_opcodes_h_l1883_c28_1498] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_arg0 <= VAR_printf_uxn_opcodes_h_l1883_c28_1498_uxn_opcodes_h_l1883_c28_1498_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1884_c1_d57b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output;
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1884_c1_d57b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1885_c1_12bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output;

     -- sta2[uxn_opcodes_h_l1884_c41_5c42] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l1884_c41_5c42_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l1884_c41_5c42_phase <= VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_phase;
     sta2_uxn_opcodes_h_l1884_c41_5c42_ins <= VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_ins;
     sta2_uxn_opcodes_h_l1884_c41_5c42_pc <= VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_pc;
     sta2_uxn_opcodes_h_l1884_c41_5c42_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_previous_stack_read;
     sta2_uxn_opcodes_h_l1884_c41_5c42_previous_ram_read <= VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_previous_ram_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_return_output := sta2_uxn_opcodes_h_l1884_c41_5c42_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1886_c7_2e10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output;
     VAR_printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1885_c1_12bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue := VAR_sta2_uxn_opcodes_h_l1884_c41_5c42_return_output;
     -- printf_uxn_opcodes_h_l1885_c28_caba[uxn_opcodes_h_l1885_c28_caba] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_arg0 <= VAR_printf_uxn_opcodes_h_l1885_c28_caba_uxn_opcodes_h_l1885_c28_caba_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1886_c1_f2cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1887_c7_0e1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output;
     VAR_printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1886_c1_f2cb_return_output;
     -- printf_uxn_opcodes_h_l1886_c28_a0f0[uxn_opcodes_h_l1886_c28_a0f0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_arg0 <= VAR_printf_uxn_opcodes_h_l1886_c28_a0f0_uxn_opcodes_h_l1886_c28_a0f0_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1888_c7_3fda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1887_c1_3272] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output;
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1887_c1_3272_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1889_c7_f587] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output;

     -- deo[uxn_opcodes_h_l1887_c41_bc2b] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l1887_c41_bc2b_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l1887_c41_bc2b_phase <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_phase;
     deo_uxn_opcodes_h_l1887_c41_bc2b_ins <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_ins;
     deo_uxn_opcodes_h_l1887_c41_bc2b_pc <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_pc;
     deo_uxn_opcodes_h_l1887_c41_bc2b_previous_stack_read <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_stack_read;
     deo_uxn_opcodes_h_l1887_c41_bc2b_previous_ram_read <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_ram_read;
     deo_uxn_opcodes_h_l1887_c41_bc2b_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_return_output := deo_uxn_opcodes_h_l1887_c41_bc2b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1888_c1_6331] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c7_f587_return_output;
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1888_c1_6331_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue := VAR_deo_uxn_opcodes_h_l1887_c41_bc2b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1890_c7_6bc0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1889_c1_0614] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output;

     -- deo2[uxn_opcodes_h_l1888_c41_84ce] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l1888_c41_84ce_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l1888_c41_84ce_phase <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_phase;
     deo2_uxn_opcodes_h_l1888_c41_84ce_ins <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_ins;
     deo2_uxn_opcodes_h_l1888_c41_84ce_pc <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_pc;
     deo2_uxn_opcodes_h_l1888_c41_84ce_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_stack_read;
     deo2_uxn_opcodes_h_l1888_c41_84ce_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_ram_read;
     deo2_uxn_opcodes_h_l1888_c41_84ce_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_return_output := deo2_uxn_opcodes_h_l1888_c41_84ce_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output;
     VAR_printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1889_c1_0614_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue := VAR_deo2_uxn_opcodes_h_l1888_c41_84ce_return_output;
     -- printf_uxn_opcodes_h_l1889_c28_9d37[uxn_opcodes_h_l1889_c28_9d37] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_arg0 <= VAR_printf_uxn_opcodes_h_l1889_c28_9d37_uxn_opcodes_h_l1889_c28_9d37_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1890_c1_0763] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1891_c7_e6ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output;
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1890_c1_0763_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1891_c1_d99d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1892_c7_78b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output;

     -- add2[uxn_opcodes_h_l1890_c41_0d4d] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l1890_c41_0d4d_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l1890_c41_0d4d_phase <= VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_phase;
     add2_uxn_opcodes_h_l1890_c41_0d4d_ins <= VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_ins;
     add2_uxn_opcodes_h_l1890_c41_0d4d_pc <= VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_pc;
     add2_uxn_opcodes_h_l1890_c41_0d4d_previous_stack_read <= VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_previous_stack_read;
     add2_uxn_opcodes_h_l1890_c41_0d4d_previous_ram_read <= VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_previous_ram_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_return_output := add2_uxn_opcodes_h_l1890_c41_0d4d_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output;
     VAR_printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d99d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue := VAR_add2_uxn_opcodes_h_l1890_c41_0d4d_return_output;
     -- printf_uxn_opcodes_h_l1891_c28_f569[uxn_opcodes_h_l1891_c28_f569] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_arg0 <= VAR_printf_uxn_opcodes_h_l1891_c28_f569_uxn_opcodes_h_l1891_c28_f569_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1893_c7_1198] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1892_c1_683c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c7_1198_return_output;
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1892_c1_683c_return_output;
     -- sub2[uxn_opcodes_h_l1892_c41_a79f] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l1892_c41_a79f_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l1892_c41_a79f_phase <= VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_phase;
     sub2_uxn_opcodes_h_l1892_c41_a79f_ins <= VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_ins;
     sub2_uxn_opcodes_h_l1892_c41_a79f_pc <= VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_pc;
     sub2_uxn_opcodes_h_l1892_c41_a79f_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_previous_stack_read;
     sub2_uxn_opcodes_h_l1892_c41_a79f_previous_ram_read <= VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_previous_ram_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_return_output := sub2_uxn_opcodes_h_l1892_c41_a79f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1894_c7_f967] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1893_c1_9915] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c7_f967_return_output;
     VAR_printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1893_c1_9915_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue := VAR_sub2_uxn_opcodes_h_l1892_c41_a79f_return_output;
     -- printf_uxn_opcodes_h_l1893_c28_1cf4[uxn_opcodes_h_l1893_c28_1cf4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_arg0 <= VAR_printf_uxn_opcodes_h_l1893_c28_1cf4_uxn_opcodes_h_l1893_c28_1cf4_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1894_c1_185d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1895_c7_1bd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output;
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1894_c1_185d_return_output;
     -- mul2[uxn_opcodes_h_l1894_c41_c141] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l1894_c41_c141_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l1894_c41_c141_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l1894_c41_c141_phase <= VAR_mul2_uxn_opcodes_h_l1894_c41_c141_phase;
     mul2_uxn_opcodes_h_l1894_c41_c141_ins <= VAR_mul2_uxn_opcodes_h_l1894_c41_c141_ins;
     mul2_uxn_opcodes_h_l1894_c41_c141_pc <= VAR_mul2_uxn_opcodes_h_l1894_c41_c141_pc;
     mul2_uxn_opcodes_h_l1894_c41_c141_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l1894_c41_c141_previous_stack_read;
     mul2_uxn_opcodes_h_l1894_c41_c141_previous_ram_read <= VAR_mul2_uxn_opcodes_h_l1894_c41_c141_previous_ram_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l1894_c41_c141_return_output := mul2_uxn_opcodes_h_l1894_c41_c141_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1896_c7_aaa6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1895_c1_9e4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output;
     VAR_printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_9e4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue := VAR_mul2_uxn_opcodes_h_l1894_c41_c141_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1896_c1_ed14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output;

     -- printf_uxn_opcodes_h_l1895_c28_aafe[uxn_opcodes_h_l1895_c28_aafe] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_arg0 <= VAR_printf_uxn_opcodes_h_l1895_c28_aafe_uxn_opcodes_h_l1895_c28_aafe_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1897_c7_948c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c7_948c_return_output;
     VAR_printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1896_c1_ed14_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1897_c1_b02d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1898_c7_e27c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output;

     -- printf_uxn_opcodes_h_l1896_c28_1446[uxn_opcodes_h_l1896_c28_1446] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_arg0 <= VAR_printf_uxn_opcodes_h_l1896_c28_1446_uxn_opcodes_h_l1896_c28_1446_arg0;
     -- Outputs

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output;
     VAR_printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1897_c1_b02d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1899_c7_66e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1898_c1_6063] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output;

     -- printf_uxn_opcodes_h_l1897_c28_b944[uxn_opcodes_h_l1897_c28_b944] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_arg0 <= VAR_printf_uxn_opcodes_h_l1897_c28_b944_uxn_opcodes_h_l1897_c28_b944_arg0;
     -- Outputs

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output;
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_6063_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1900_c7_c264] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output;

     -- and2[uxn_opcodes_h_l1898_c41_0a13] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l1898_c41_0a13_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l1898_c41_0a13_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l1898_c41_0a13_phase <= VAR_and2_uxn_opcodes_h_l1898_c41_0a13_phase;
     and2_uxn_opcodes_h_l1898_c41_0a13_ins <= VAR_and2_uxn_opcodes_h_l1898_c41_0a13_ins;
     and2_uxn_opcodes_h_l1898_c41_0a13_pc <= VAR_and2_uxn_opcodes_h_l1898_c41_0a13_pc;
     and2_uxn_opcodes_h_l1898_c41_0a13_previous_stack_read <= VAR_and2_uxn_opcodes_h_l1898_c41_0a13_previous_stack_read;
     and2_uxn_opcodes_h_l1898_c41_0a13_previous_ram_read <= VAR_and2_uxn_opcodes_h_l1898_c41_0a13_previous_ram_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l1898_c41_0a13_return_output := and2_uxn_opcodes_h_l1898_c41_0a13_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1899_c1_2947] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c7_c264_return_output;
     VAR_printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_2947_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue := VAR_and2_uxn_opcodes_h_l1898_c41_0a13_return_output;
     -- printf_uxn_opcodes_h_l1899_c28_6404[uxn_opcodes_h_l1899_c28_6404] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_arg0 <= VAR_printf_uxn_opcodes_h_l1899_c28_6404_uxn_opcodes_h_l1899_c28_6404_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1900_c1_ae4d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1901_c7_b46e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output;
     VAR_printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1900_c1_ae4d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1901_c1_8dd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1902_c7_7cf7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output;

     -- printf_uxn_opcodes_h_l1900_c28_ea64[uxn_opcodes_h_l1900_c28_ea64] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_arg0 <= VAR_printf_uxn_opcodes_h_l1900_c28_ea64_uxn_opcodes_h_l1900_c28_ea64_arg0;
     -- Outputs

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output;
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1901_c1_8dd6_return_output;
     -- eor[uxn_opcodes_h_l1901_c41_82b4] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l1901_c41_82b4_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l1901_c41_82b4_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l1901_c41_82b4_phase <= VAR_eor_uxn_opcodes_h_l1901_c41_82b4_phase;
     eor_uxn_opcodes_h_l1901_c41_82b4_ins <= VAR_eor_uxn_opcodes_h_l1901_c41_82b4_ins;
     eor_uxn_opcodes_h_l1901_c41_82b4_pc <= VAR_eor_uxn_opcodes_h_l1901_c41_82b4_pc;
     eor_uxn_opcodes_h_l1901_c41_82b4_previous_stack_read <= VAR_eor_uxn_opcodes_h_l1901_c41_82b4_previous_stack_read;
     eor_uxn_opcodes_h_l1901_c41_82b4_previous_ram_read <= VAR_eor_uxn_opcodes_h_l1901_c41_82b4_previous_ram_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l1901_c41_82b4_return_output := eor_uxn_opcodes_h_l1901_c41_82b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1902_c1_b690] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1903_c7_6efd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output;
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1902_c1_b690_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue := VAR_eor_uxn_opcodes_h_l1901_c41_82b4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1903_c1_1aea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output;

     -- eor2[uxn_opcodes_h_l1902_c41_297b] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l1902_c41_297b_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l1902_c41_297b_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l1902_c41_297b_phase <= VAR_eor2_uxn_opcodes_h_l1902_c41_297b_phase;
     eor2_uxn_opcodes_h_l1902_c41_297b_ins <= VAR_eor2_uxn_opcodes_h_l1902_c41_297b_ins;
     eor2_uxn_opcodes_h_l1902_c41_297b_pc <= VAR_eor2_uxn_opcodes_h_l1902_c41_297b_pc;
     eor2_uxn_opcodes_h_l1902_c41_297b_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l1902_c41_297b_previous_stack_read;
     eor2_uxn_opcodes_h_l1902_c41_297b_previous_ram_read <= VAR_eor2_uxn_opcodes_h_l1902_c41_297b_previous_ram_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l1902_c41_297b_return_output := eor2_uxn_opcodes_h_l1902_c41_297b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1904_c7_1c99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output;
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_1aea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue := VAR_eor2_uxn_opcodes_h_l1902_c41_297b_return_output;
     -- sft[uxn_opcodes_h_l1903_c41_3e60] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l1903_c41_3e60_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l1903_c41_3e60_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l1903_c41_3e60_phase <= VAR_sft_uxn_opcodes_h_l1903_c41_3e60_phase;
     sft_uxn_opcodes_h_l1903_c41_3e60_ins <= VAR_sft_uxn_opcodes_h_l1903_c41_3e60_ins;
     sft_uxn_opcodes_h_l1903_c41_3e60_pc <= VAR_sft_uxn_opcodes_h_l1903_c41_3e60_pc;
     sft_uxn_opcodes_h_l1903_c41_3e60_previous_stack_read <= VAR_sft_uxn_opcodes_h_l1903_c41_3e60_previous_stack_read;
     sft_uxn_opcodes_h_l1903_c41_3e60_previous_ram_read <= VAR_sft_uxn_opcodes_h_l1903_c41_3e60_previous_ram_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l1903_c41_3e60_return_output := sft_uxn_opcodes_h_l1903_c41_3e60_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1905_c1_1b40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1904_c1_1040] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_1b40_return_output;
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1904_c1_1040_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue := VAR_sft_uxn_opcodes_h_l1903_c41_3e60_return_output;
     -- printf_uxn_opcodes_h_l1905_c9_924f[uxn_opcodes_h_l1905_c9_924f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_arg0 <= VAR_printf_uxn_opcodes_h_l1905_c9_924f_uxn_opcodes_h_l1905_c9_924f_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l1904_c41_05ba] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l1904_c41_05ba_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l1904_c41_05ba_phase <= VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_phase;
     sft2_uxn_opcodes_h_l1904_c41_05ba_ins <= VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_ins;
     sft2_uxn_opcodes_h_l1904_c41_05ba_pc <= VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_pc;
     sft2_uxn_opcodes_h_l1904_c41_05ba_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_previous_stack_read;
     sft2_uxn_opcodes_h_l1904_c41_05ba_previous_ram_read <= VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_previous_ram_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_return_output := sft2_uxn_opcodes_h_l1904_c41_05ba_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue := VAR_sft2_uxn_opcodes_h_l1904_c41_05ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1904_c7_1c99] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_cond;
     opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output := opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1904_c7_1c99_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1903_c7_6efd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_cond;
     opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output := opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1903_c7_6efd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1902_c7_7cf7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_cond;
     opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output := opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1902_c7_7cf7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1901_c7_b46e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_cond;
     opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output := opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1901_c7_b46e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1900_c7_c264] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_cond;
     opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output := opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1900_c7_c264_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1899_c7_66e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_cond;
     opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output := opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1899_c7_66e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1898_c7_e27c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_cond;
     opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output := opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1898_c7_e27c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1897_c7_948c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_cond;
     opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output := opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1897_c7_948c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1896_c7_aaa6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_cond;
     opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output := opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1896_c7_aaa6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1895_c7_1bd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_cond;
     opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output := opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1895_c7_1bd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1894_c7_f967] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_cond;
     opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output := opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1894_c7_f967_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1893_c7_1198] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_cond;
     opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output := opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1893_c7_1198_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1892_c7_78b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_cond;
     opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output := opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1892_c7_78b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1891_c7_e6ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_cond;
     opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output := opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1891_c7_e6ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1890_c7_6bc0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_cond;
     opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output := opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1890_c7_6bc0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1889_c7_f587] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_cond;
     opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output := opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1889_c7_f587_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1888_c7_3fda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_cond;
     opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output := opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1888_c7_3fda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1887_c7_0e1d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_cond;
     opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output := opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1887_c7_0e1d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1886_c7_2e10] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_cond;
     opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output := opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1886_c7_2e10_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1885_c7_e21e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_cond;
     opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output := opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1885_c7_e21e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1884_c7_ea42] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_cond;
     opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output := opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1884_c7_ea42_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1883_c7_436d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_cond;
     opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output := opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1883_c7_436d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1882_c7_40e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_cond;
     opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output := opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1882_c7_40e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1881_c7_9fd7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_cond;
     opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output := opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1881_c7_9fd7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1880_c7_d9b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_cond;
     opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output := opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1880_c7_d9b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1879_c7_750b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_cond;
     opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output := opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1879_c7_750b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1878_c7_b143] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_cond;
     opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output := opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1878_c7_b143_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1877_c7_9d86] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_cond;
     opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output := opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1877_c7_9d86_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1876_c7_6150] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_cond;
     opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output := opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1876_c7_6150_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1875_c7_cf77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_cond;
     opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output := opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1875_c7_cf77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1874_c7_cda2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_cond;
     opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output := opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1874_c7_cda2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1873_c7_0aea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_cond;
     opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output := opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1873_c7_0aea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1872_c7_1ba1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_cond;
     opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output := opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1872_c7_1ba1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1871_c7_03df] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_cond;
     opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output := opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1871_c7_03df_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1870_c7_dc75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_cond;
     opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output := opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1870_c7_dc75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1869_c7_8e5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_cond;
     opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output := opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1869_c7_8e5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1868_c7_7d64] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_cond;
     opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output := opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1868_c7_7d64_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1867_c7_da06] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_cond;
     opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output := opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1867_c7_da06_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1866_c7_d4f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_cond;
     opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output := opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1866_c7_d4f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1865_c7_7371] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_cond;
     opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output := opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1865_c7_7371_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1864_c7_c41f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_cond;
     opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output := opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1864_c7_c41f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1863_c7_7288] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_cond;
     opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output := opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1863_c7_7288_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1862_c7_be4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_cond;
     opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output := opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1862_c7_be4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1861_c7_4d7f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_cond;
     opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output := opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1861_c7_4d7f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1860_c7_2134] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_cond;
     opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output := opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1860_c7_2134_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1859_c7_7b81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_cond;
     opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output := opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1859_c7_7b81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1858_c7_139d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_cond;
     opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output := opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1858_c7_139d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1857_c7_c20f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_cond;
     opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output := opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1857_c7_c20f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1856_c7_6010] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_cond;
     opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output := opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1856_c7_6010_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1855_c7_c1d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_cond;
     opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output := opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1855_c7_c1d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1854_c7_baf5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_cond;
     opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output := opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1854_c7_baf5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1853_c7_c33a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_cond;
     opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output := opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1853_c7_c33a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1852_c7_38d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_cond;
     opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output := opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1852_c7_38d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1851_c7_a2c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_cond;
     opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output := opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1851_c7_a2c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1850_c7_dc7d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_cond;
     opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output := opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1850_c7_dc7d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1849_c7_17f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_cond;
     opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output := opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1849_c7_17f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1848_c7_eab7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_cond;
     opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output := opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1848_c7_eab7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1847_c7_3be0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_cond;
     opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output := opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1847_c7_3be0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1846_c7_d8d3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_cond;
     opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output := opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1846_c7_d8d3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1845_c7_142d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_cond;
     opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output := opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1845_c7_142d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1844_c7_fa41] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_cond;
     opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output := opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1844_c7_fa41_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1843_c7_7095] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_cond;
     opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output := opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1843_c7_7095_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1842_c7_0089] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_cond;
     opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output := opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1842_c7_0089_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1841_c7_d41e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_cond;
     opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output := opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1841_c7_d41e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1840_c7_d559] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_cond;
     opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output := opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1840_c7_d559_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1839_c7_0a76] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_cond;
     opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output := opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1839_c7_0a76_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1838_c7_90ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_cond;
     opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output := opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1838_c7_90ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1837_c7_85e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_cond;
     opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output := opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1837_c7_85e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1836_c7_c774] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_cond;
     opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output := opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l1836_c7_c774_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l1835_c2_0836] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_cond;
     opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iftrue;
     opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output := opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l1945_l1941_DUPLICATE_7cdd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l1945_l1941_DUPLICATE_7cdd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.device_ram_address;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l1956_c33_b44c] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l1956_c33_b44c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l1946_c3_776a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l1946_c3_776a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l1954_c30_331b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1954_c30_331b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l1907_c6_945a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1907_c6_945a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1916_c19_e579] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1916_c19_e579_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_stack_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l1957_c31_51d1] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l1957_c31_51d1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1955_c34_165c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1955_c34_165c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1952_c33_1e5c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1952_c33_1e5c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1917_c82_4edb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1917_c82_4edb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l1942_c3_beca] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l1942_c3_beca_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l1943_c3_7f21] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l1943_c3_7f21_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_device_ram_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1909_DUPLICATE_33e0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1909_DUPLICATE_33e0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1908_l1917_l1920_DUPLICATE_251f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1908_l1917_l1920_DUPLICATE_251f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l1958_c32_fe91] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1958_c32_fe91_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l1950_c23_8819] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l1950_c23_8819_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.pc;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l1953_c29_dc52] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1953_c29_dc52_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l1918_c22_baa2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1918_c22_baa2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1949_c34_2a30] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1949_c34_2a30_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1915_c18_ea13] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1915_c18_ea13_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l1951_c32_32fe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1951_c32_32fe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l1835_c2_0836_return_output.is_ram_read;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1909_DUPLICATE_33e0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1909_DUPLICATE_33e0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l1946_c3_776a_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l1943_c3_7f21_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1907_c6_945a_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1907_c6_945a_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1908_l1917_l1920_DUPLICATE_251f_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1915_c18_ea13_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1915_c18_ea13_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1915_c18_ea13_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1916_c19_e579_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1916_c19_e579_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1916_c19_e579_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l1945_l1941_DUPLICATE_7cdd_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l1945_l1941_DUPLICATE_7cdd_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l1942_c3_beca_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1917_c82_4edb_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1918_c22_baa2_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1918_c22_baa2_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1918_c22_baa2_return_output;
     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;

     -- device_ram_update[uxn_opcodes_h_l1940_c26_04fc] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address0 <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address0;
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_value;
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_write0_enable;
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read0_enable;
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address1 <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_address1;
     device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output := device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1909_c4_53bb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l1960_l1813_DUPLICATE_c6c3 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l1960_l1813_DUPLICATE_c6c3_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1949_c34_2a30_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l1950_c23_8819_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1951_c32_32fe_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1952_c33_1e5c_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1953_c29_dc52_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1954_c30_331b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1955_c34_165c_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l1956_c33_b44c_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l1957_c31_51d1_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1958_c32_fe91_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1911_c4_ca0a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l1909_c4_61d1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1909_c4_53bb_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l1911_c4_2612 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1911_c4_ca0a_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;
     VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l1917_l1920_l1908_DUPLICATE_8a76_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l1960_l1813_DUPLICATE_c6c3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l1960_l1813_DUPLICATE_c6c3_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l1940_c2_3ae5 := resize(VAR_device_ram_update_uxn_opcodes_h_l1940_c26_04fc_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l1940_c2_3ae5;
     VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse := VAR_sp0_uxn_opcodes_h_l1911_c4_2612;
     VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue := VAR_sp1_uxn_opcodes_h_l1909_c4_61d1;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1929_c1_cf80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output;

     -- sp0_MUX[uxn_opcodes_h_l1908_c3_305c] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l1908_c3_305c_cond <= VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_cond;
     sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue;
     sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output := sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1920_c1_8cc7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output;

     -- sp1_MUX[uxn_opcodes_h_l1908_c3_305c] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l1908_c3_305c_cond <= VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_cond;
     sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iftrue;
     sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output := sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1929_c1_cf80_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1920_c1_8cc7_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l1908_c3_305c_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l1908_c3_305c_return_output;
     -- sp1_MUX[uxn_opcodes_h_l1907_c2_c73e] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_cond <= VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_cond;
     sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue;
     sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output := sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output;

     -- sp0_MUX[uxn_opcodes_h_l1907_c2_c73e] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_cond <= VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_cond;
     sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iftrue;
     sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output := sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output;
     VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l1907_c2_c73e_return_output;
     -- MUX[uxn_opcodes_h_l1917_c19_dbbf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1917_c19_dbbf_cond <= VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_cond;
     MUX_uxn_opcodes_h_l1917_c19_dbbf_iftrue <= VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_iftrue;
     MUX_uxn_opcodes_h_l1917_c19_dbbf_iffalse <= VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output := MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_left := VAR_MUX_uxn_opcodes_h_l1917_c19_dbbf_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l1917_c19_0050] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_left;
     BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output := BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l1917_c19_0050_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3;
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address0 := resize(VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address1 := resize(VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address0 := resize(VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address1 := resize(VAR_stack_address_uxn_opcodes_h_l1917_c2_84d3, 8);
     -- stack_w_ram_update[uxn_opcodes_h_l1930_c22_b1c9] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address0;
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_address1;
     stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output := stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output;

     -- stack_r_ram_update[uxn_opcodes_h_l1921_c22_1405] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address0;
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_address1;
     stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output := stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l1921_c3_a643 := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l1921_c22_1405_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l1930_c3_1b1f := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l1930_c22_b1c9_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iftrue := VAR_stack_read_value_uxn_opcodes_h_l1921_c3_a643;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iffalse := VAR_stack_read_value_uxn_opcodes_h_l1930_c3_1b1f;
     -- stack_read_value_MUX[uxn_opcodes_h_l1920_c2_3a31] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_cond;
     stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output := stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l1920_c2_3a31_return_output;
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
