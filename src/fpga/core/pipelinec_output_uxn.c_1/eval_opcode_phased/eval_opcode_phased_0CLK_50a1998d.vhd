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
-- Submodules: 412
entity eval_opcode_phased_0CLK_50a1998d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_50a1998d;
architecture arch of eval_opcode_phased_0CLK_50a1998d is
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
-- BIN_OP_AND[uxn_opcodes_h_l2002_c10_cb7b]
signal BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2002_c10_aa5b]
signal BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2002_c41_bb46]
signal BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2002_c57_6154]
signal CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2002_c10_7e9d]
signal MUX_uxn_opcodes_h_l2002_c10_7e9d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2002_c10_7e9d_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2002_c10_7e9d_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2003_c18_9714]
signal BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2003_c18_7861]
signal BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2003_c18_d5d9]
signal MUX_uxn_opcodes_h_l2003_c18_d5d9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2003_c18_d5d9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2003_c18_d5d9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2005_c2_69a6[uxn_opcodes_h_l2005_c2_69a6]
signal printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2007_c6_a377]
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c7_5684]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2007_c2_85e9]
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_41a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c1_426c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c7_bbcd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2008_c7_5684]
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2008_c41_1abc]
signal jci_uxn_opcodes_h_l2008_c41_1abc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_1abc_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_1abc_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_1abc_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_1abc_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_1abc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_2e8b]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c1_6fa7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c7_b401]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2009_c7_bbcd]
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2009_c41_b9cd]
signal jmi_uxn_opcodes_h_l2009_c41_b9cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_b9cd_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_b9cd_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_stack_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_9bcd]
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c1_6bd1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c7_3314]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2010_c7_b401]
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2010_c41_669b]
signal jsi_uxn_opcodes_h_l2010_c41_669b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_669b_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_669b_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_669b_previous_stack_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_669b_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_669b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2011_c11_d3c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c1_9370]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c7_f22c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2011_c7_3314]
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2011_c41_46f2]
signal lit_uxn_opcodes_h_l2011_c41_46f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_46f2_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_46f2_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_46f2_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_46f2_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_46f2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_2726]
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c1_c8dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c7_b7b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2012_c7_f22c]
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2012_c41_a8fc]
signal lit2_uxn_opcodes_h_l2012_c41_a8fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_a8fc_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_a8fc_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_aa6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c1_ec56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c7_fa3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2013_c7_b7b8]
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2013_c41_7c5a]
signal lit_uxn_opcodes_h_l2013_c41_7c5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_7c5a_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_7c5a_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_7c5a_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_7c5a_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_7c5a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2014_c11_7d52]
signal BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c1_c54c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c7_4e5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2014_c7_fa3d]
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2014_c41_4595]
signal lit2_uxn_opcodes_h_l2014_c41_4595_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_4595_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_4595_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_4595_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_4595_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_4595_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_d48c]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c1_a252]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c7_9764]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2015_c7_4e5f]
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2015_c28_b4d5[uxn_opcodes_h_l2015_c28_b4d5]
signal printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_b893]
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c1_c356]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c7_175a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2016_c7_9764]
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2016_c41_fd5f]
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_pc : unsigned(15 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_ram_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_f2e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c1_a5dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c7_a423]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2017_c7_175a]
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2017_c41_bc0c]
signal pop_uxn_opcodes_h_l2017_c41_bc0c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_bc0c_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_bc0c_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_bc0c_pc : unsigned(15 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_bc0c_previous_stack_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_bc0c_previous_ram_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_bc0c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_525b]
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c1_931a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c7_ac34]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2018_c7_a423]
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2018_c41_a4ed]
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_pc : unsigned(15 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_stack_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_ram_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_a0f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c1_678b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c7_bdd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2019_c7_ac34]
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2019_c41_5213]
signal nip_uxn_opcodes_h_l2019_c41_5213_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_5213_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_5213_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_5213_pc : unsigned(15 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_5213_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_5213_previous_ram_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_5213_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_f050]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c1_0358]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c7_f350]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2020_c7_bdd9]
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2020_c28_0a45[uxn_opcodes_h_l2020_c28_0a45]
signal printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_8877]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c1_0f0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c7_46ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2021_c7_f350]
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2021_c41_61f7]
signal swp_uxn_opcodes_h_l2021_c41_61f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_61f7_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_61f7_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_61f7_pc : unsigned(15 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_61f7_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_61f7_previous_ram_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_61f7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2022_c11_92b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c1_e618]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c7_eae0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2022_c7_46ae]
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2022_c41_b71e]
signal swp2_uxn_opcodes_h_l2022_c41_b71e_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_b71e_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_b71e_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_b71e_pc : unsigned(15 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_b71e_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_b71e_previous_ram_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_b71e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2023_c11_8eb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c1_d34d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c7_28f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2023_c7_eae0]
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2023_c28_c31c[uxn_opcodes_h_l2023_c28_c31c]
signal printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_14ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c1_e7e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c7_b5b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2024_c7_28f5]
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2024_c41_6bef]
signal rot2_uxn_opcodes_h_l2024_c41_6bef_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_6bef_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_6bef_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_6bef_pc : unsigned(15 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_6bef_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_6bef_previous_ram_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_6bef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_5a64]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c1_e683]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c7_f7d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2025_c7_b5b8]
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2025_c28_bbd7[uxn_opcodes_h_l2025_c28_bbd7]
signal printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_f64c]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c1_9b0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c7_1170]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2026_c7_f7d8]
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2026_c41_1ea7]
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_pc : unsigned(15 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_ram_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2027_c11_19a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c1_68fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c7_f1fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2027_c7_1170]
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2027_c28_060c[uxn_opcodes_h_l2027_c28_060c]
signal printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2028_c11_5d1c]
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c1_7638]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c7_7681]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2028_c7_f1fa]
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2028_c41_3754]
signal ovr2_uxn_opcodes_h_l2028_c41_3754_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_3754_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_3754_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_3754_pc : unsigned(15 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_3754_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_3754_previous_ram_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_3754_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_a988]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c1_d1e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c7_10f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2029_c7_7681]
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2029_c41_49c5]
signal equ_uxn_opcodes_h_l2029_c41_49c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_49c5_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_49c5_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_49c5_pc : unsigned(15 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_49c5_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_49c5_previous_ram_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_49c5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_e6d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c1_0cc3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c7_afdc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2030_c7_10f2]
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2030_c41_7927]
signal equ2_uxn_opcodes_h_l2030_c41_7927_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_7927_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_7927_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_7927_pc : unsigned(15 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_7927_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_7927_previous_ram_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_7927_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_183b]
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_1433]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c7_1686]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2031_c7_afdc]
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2031_c28_aa2b[uxn_opcodes_h_l2031_c28_aa2b]
signal printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_90ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_70dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c7_d542]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2032_c7_1686]
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2032_c28_8891[uxn_opcodes_h_l2032_c28_8891]
signal printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_7d92]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c1_c6e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c7_0d41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2033_c7_d542]
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2033_c28_344e[uxn_opcodes_h_l2033_c28_344e]
signal printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_2a2c]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c1_ca60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c7_fed1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2034_c7_0d41]
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2034_c41_4fd1]
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_pc : unsigned(15 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_ram_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_d3ba]
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c1_ecb2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c7_b85e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2035_c7_fed1]
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2035_c28_c7e6[uxn_opcodes_h_l2035_c28_c7e6]
signal printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2036_c11_349c]
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c1_3691]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c7_f6e9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2036_c7_b85e]
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2036_c41_5ba8]
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_pc : unsigned(15 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_ram_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_85eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c1_9168]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c7_013b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2037_c7_f6e9]
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2037_c28_aa7e[uxn_opcodes_h_l2037_c28_aa7e]
signal printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_e735]
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_fd48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c7_4c4f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2038_c7_013b]
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2038_c41_144d]
signal jmp2_uxn_opcodes_h_l2038_c41_144d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_144d_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_144d_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_144d_pc : unsigned(15 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_144d_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_144d_previous_ram_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_144d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_50ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c1_8042]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c7_21ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2039_c7_4c4f]
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2039_c28_7e9f[uxn_opcodes_h_l2039_c28_7e9f]
signal printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_cff7]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_f2a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c7_90e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2040_c7_21ed]
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2040_c28_234a[uxn_opcodes_h_l2040_c28_234a]
signal printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_a576]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c1_321a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c7_2dfe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2041_c7_90e4]
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2041_c28_fed8[uxn_opcodes_h_l2041_c28_fed8]
signal printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_9e50]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c1_daf5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c7_80db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2042_c7_2dfe]
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2042_c28_61ac[uxn_opcodes_h_l2042_c28_61ac]
signal printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_7d8c]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_52fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c7_1953]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2043_c7_80db]
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2043_c28_dbd6[uxn_opcodes_h_l2043_c28_dbd6]
signal printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_dc96]
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c1_2a34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c7_9cce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2044_c7_1953]
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2044_c41_de4b]
signal sth2_uxn_opcodes_h_l2044_c41_de4b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_de4b_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_de4b_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_de4b_pc : unsigned(15 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_de4b_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_de4b_previous_ram_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_de4b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_9a3e]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_1962]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c7_efe6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2045_c7_9cce]
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2045_c28_41b5[uxn_opcodes_h_l2045_c28_41b5]
signal printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_ad75]
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c1_9aa1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c7_c988]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2046_c7_efe6]
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2046_c28_a9f2[uxn_opcodes_h_l2046_c28_a9f2]
signal printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_2bf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_9801]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c7_1524]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2047_c7_c988]
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2047_c28_a8cc[uxn_opcodes_h_l2047_c28_a8cc]
signal printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_0396]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_7cbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c7_cb45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2048_c7_1524]
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2048_c28_b580[uxn_opcodes_h_l2048_c28_b580]
signal printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2049_c11_e6d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c1_f364]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c7_e636]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2049_c7_cb45]
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2049_c28_41f1[uxn_opcodes_h_l2049_c28_41f1]
signal printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_a978]
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c1_6967]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c7_6988]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2050_c7_e636]
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2050_c28_f254[uxn_opcodes_h_l2050_c28_f254]
signal printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_eb0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c1_60a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c7_6bce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2051_c7_6988]
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2051_c28_23f3[uxn_opcodes_h_l2051_c28_23f3]
signal printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_6eff]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c1_8d4a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c7_6947]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2052_c7_6bce]
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2052_c28_6391[uxn_opcodes_h_l2052_c28_6391]
signal printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_e631]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c1_6c56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c7_cc0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2053_c7_6947]
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2053_c28_b503[uxn_opcodes_h_l2053_c28_b503]
signal printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_cb09]
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c1_a9c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c7_5ea8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2054_c7_cc0d]
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2054_c41_f847]
signal lda2_uxn_opcodes_h_l2054_c41_f847_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_f847_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_f847_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_f847_pc : unsigned(15 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_f847_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_f847_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_f847_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_4aa0]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_396c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c7_ad65]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2055_c7_5ea8]
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2055_c28_6792[uxn_opcodes_h_l2055_c28_6792]
signal printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_52b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c1_a9b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c7_a858]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2056_c7_ad65]
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2056_c41_0480]
signal sta2_uxn_opcodes_h_l2056_c41_0480_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_0480_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_0480_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_0480_pc : unsigned(15 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_0480_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_0480_previous_ram_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_0480_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_c907]
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c1_4949]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c7_1930]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2057_c7_a858]
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2057_c28_f21d[uxn_opcodes_h_l2057_c28_f21d]
signal printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_50fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c1_9429]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c7_10aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2058_c7_1930]
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2058_c28_6117[uxn_opcodes_h_l2058_c28_6117]
signal printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_1860]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c1_96bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c7_0237]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2059_c7_10aa]
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2059_c41_c707]
signal deo_uxn_opcodes_h_l2059_c41_c707_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_pc : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_c707_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_63d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c1_bdda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c7_5103]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2060_c7_0237]
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2060_c41_34cf]
signal deo2_uxn_opcodes_h_l2060_c41_34cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_pc : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_34cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_6eb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c1_ea0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c7_b92f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2061_c7_5103]
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2061_c28_fb23[uxn_opcodes_h_l2061_c28_fb23]
signal printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_e202]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c1_b068]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c7_ab1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2062_c7_b92f]
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2062_c41_bba2]
signal add2_uxn_opcodes_h_l2062_c41_bba2_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_bba2_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_bba2_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_bba2_pc : unsigned(15 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_bba2_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_bba2_previous_ram_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_bba2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_08a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c1_5219]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c7_8119]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2063_c7_ab1e]
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2063_c28_c913[uxn_opcodes_h_l2063_c28_c913]
signal printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_9dd7]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c1_3269]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c7_c243]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2064_c7_8119]
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2064_c41_3043]
signal sub2_uxn_opcodes_h_l2064_c41_3043_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_3043_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_3043_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_3043_pc : unsigned(15 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_3043_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_3043_previous_ram_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_3043_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_60db]
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c1_c7bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c7_054e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2065_c7_c243]
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2065_c28_7421[uxn_opcodes_h_l2065_c28_7421]
signal printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_6ba6]
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c1_b0d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c7_fcfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2066_c7_054e]
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2066_c41_271a]
signal mul2_uxn_opcodes_h_l2066_c41_271a_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_271a_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_271a_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_271a_pc : unsigned(15 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_271a_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_271a_previous_ram_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_271a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_dae3]
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c1_7d82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c7_96d9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2067_c7_fcfc]
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2067_c28_7341[uxn_opcodes_h_l2067_c28_7341]
signal printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_0873]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c1_2ade]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c7_e1ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2068_c7_96d9]
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2068_c28_df3b[uxn_opcodes_h_l2068_c28_df3b]
signal printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_0cad]
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c1_e3c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c7_3e33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2069_c7_e1ad]
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2069_c28_42cf[uxn_opcodes_h_l2069_c28_42cf]
signal printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2070_c11_2308]
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c1_2124]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c7_be4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2070_c7_3e33]
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2070_c41_a5b5]
signal and2_uxn_opcodes_h_l2070_c41_a5b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_a5b5_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_a5b5_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_a5b5_pc : unsigned(15 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_a5b5_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_a5b5_previous_ram_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_a5b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_8203]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_5e4c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c7_b29b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2071_c7_be4b]
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2071_c28_51c4[uxn_opcodes_h_l2071_c28_51c4]
signal printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_405f]
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c1_89da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c7_e217]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2072_c7_b29b]
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2072_c28_88a6[uxn_opcodes_h_l2072_c28_88a6]
signal printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_e0a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c1_d33d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c7_e94b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2073_c7_e217]
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2073_c41_9778]
signal eor_uxn_opcodes_h_l2073_c41_9778_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_9778_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_9778_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_9778_pc : unsigned(15 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_9778_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_9778_previous_ram_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_9778_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_3276]
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c1_9afb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c7_8f47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2074_c7_e94b]
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2074_c41_453a]
signal eor2_uxn_opcodes_h_l2074_c41_453a_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_453a_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_453a_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_453a_pc : unsigned(15 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_453a_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_453a_previous_ram_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_453a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_44b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c1_0221]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c7_95e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2075_c7_8f47]
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2075_c41_4299]
signal sft_uxn_opcodes_h_l2075_c41_4299_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_4299_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_4299_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_4299_pc : unsigned(15 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_4299_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_4299_previous_ram_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_4299_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_252a]
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c1_ba77]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c1_3f38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2076_c7_95e0]
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2076_c41_671e]
signal sft2_uxn_opcodes_h_l2076_c41_671e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_671e_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_671e_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_671e_pc : unsigned(15 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_671e_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_671e_previous_ram_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_671e_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2077_c9_24ce[uxn_opcodes_h_l2077_c9_24ce]
signal printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_arg0 : unsigned(31 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2079_c2_e930]
signal sp1_MUX_uxn_opcodes_h_l2079_c2_e930_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2079_c2_e930]
signal sp0_MUX_uxn_opcodes_h_l2079_c2_e930_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2080_c3_d6cd]
signal sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2080_c3_d6cd]
signal sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2081_c4_600b]
signal BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2083_c4_c1cf]
signal BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2089_c19_faed]
signal MUX_uxn_opcodes_h_l2089_c19_faed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2089_c19_faed_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2089_c19_faed_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2089_c19_faed_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2089_c19_e476]
signal BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c1_95b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2101_c1_82a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l2092_c2_9750]
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l2093_c22_d864]
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l2102_c22_6fb3]
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l2112_c26_6378]
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b
BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_left,
BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_right,
BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b
BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_left,
BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_right,
BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46
BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_left,
BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_right,
BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2002_c57_6154
CONST_SL_4_uxn_opcodes_h_l2002_c57_6154 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_x,
CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output);

-- MUX_uxn_opcodes_h_l2002_c10_7e9d
MUX_uxn_opcodes_h_l2002_c10_7e9d : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2002_c10_7e9d_cond,
MUX_uxn_opcodes_h_l2002_c10_7e9d_iftrue,
MUX_uxn_opcodes_h_l2002_c10_7e9d_iffalse,
MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714
BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_left,
BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_right,
BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861
BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_left,
BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_right,
BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output);

-- MUX_uxn_opcodes_h_l2003_c18_d5d9
MUX_uxn_opcodes_h_l2003_c18_d5d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2003_c18_d5d9_cond,
MUX_uxn_opcodes_h_l2003_c18_d5d9_iftrue,
MUX_uxn_opcodes_h_l2003_c18_d5d9_iffalse,
MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output);

-- printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6
printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6 : entity work.printf_uxn_opcodes_h_l2005_c2_69a6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg0,
printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg1,
printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_left,
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_right,
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9
opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_cond,
opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2008_c7_5684
opc_result_MUX_uxn_opcodes_h_l2008_c7_5684 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_cond,
opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue,
opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse,
opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output);

-- jci_uxn_opcodes_h_l2008_c41_1abc
jci_uxn_opcodes_h_l2008_c41_1abc : entity work.jci_0CLK_a538d920 port map (
clk,
jci_uxn_opcodes_h_l2008_c41_1abc_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2008_c41_1abc_phase,
jci_uxn_opcodes_h_l2008_c41_1abc_pc,
jci_uxn_opcodes_h_l2008_c41_1abc_previous_stack_read,
jci_uxn_opcodes_h_l2008_c41_1abc_previous_ram_read,
jci_uxn_opcodes_h_l2008_c41_1abc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd
opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond,
opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output);

-- jmi_uxn_opcodes_h_l2009_c41_b9cd
jmi_uxn_opcodes_h_l2009_c41_b9cd : entity work.jmi_0CLK_d14e7b0e port map (
clk,
jmi_uxn_opcodes_h_l2009_c41_b9cd_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2009_c41_b9cd_phase,
jmi_uxn_opcodes_h_l2009_c41_b9cd_pc,
jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_stack_read,
jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_ram_read,
jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_left,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_right,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2010_c7_b401
opc_result_MUX_uxn_opcodes_h_l2010_c7_b401 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_cond,
opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue,
opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse,
opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output);

-- jsi_uxn_opcodes_h_l2010_c41_669b
jsi_uxn_opcodes_h_l2010_c41_669b : entity work.jsi_0CLK_85c87c86 port map (
clk,
jsi_uxn_opcodes_h_l2010_c41_669b_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2010_c41_669b_phase,
jsi_uxn_opcodes_h_l2010_c41_669b_pc,
jsi_uxn_opcodes_h_l2010_c41_669b_previous_stack_read,
jsi_uxn_opcodes_h_l2010_c41_669b_previous_ram_read,
jsi_uxn_opcodes_h_l2010_c41_669b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2011_c7_3314
opc_result_MUX_uxn_opcodes_h_l2011_c7_3314 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_cond,
opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue,
opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse,
opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output);

-- lit_uxn_opcodes_h_l2011_c41_46f2
lit_uxn_opcodes_h_l2011_c41_46f2 : entity work.lit_0CLK_0852fa80 port map (
clk,
lit_uxn_opcodes_h_l2011_c41_46f2_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2011_c41_46f2_phase,
lit_uxn_opcodes_h_l2011_c41_46f2_pc,
lit_uxn_opcodes_h_l2011_c41_46f2_previous_stack_read,
lit_uxn_opcodes_h_l2011_c41_46f2_previous_ram_read,
lit_uxn_opcodes_h_l2011_c41_46f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_left,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_right,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c
opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_cond,
opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output);

-- lit2_uxn_opcodes_h_l2012_c41_a8fc
lit2_uxn_opcodes_h_l2012_c41_a8fc : entity work.lit2_0CLK_83f22136 port map (
clk,
lit2_uxn_opcodes_h_l2012_c41_a8fc_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2012_c41_a8fc_phase,
lit2_uxn_opcodes_h_l2012_c41_a8fc_pc,
lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_stack_read,
lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_ram_read,
lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8
opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond,
opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output);

-- lit_uxn_opcodes_h_l2013_c41_7c5a
lit_uxn_opcodes_h_l2013_c41_7c5a : entity work.lit_0CLK_0852fa80 port map (
clk,
lit_uxn_opcodes_h_l2013_c41_7c5a_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2013_c41_7c5a_phase,
lit_uxn_opcodes_h_l2013_c41_7c5a_pc,
lit_uxn_opcodes_h_l2013_c41_7c5a_previous_stack_read,
lit_uxn_opcodes_h_l2013_c41_7c5a_previous_ram_read,
lit_uxn_opcodes_h_l2013_c41_7c5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_left,
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_right,
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d
opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond,
opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output);

-- lit2_uxn_opcodes_h_l2014_c41_4595
lit2_uxn_opcodes_h_l2014_c41_4595 : entity work.lit2_0CLK_83f22136 port map (
clk,
lit2_uxn_opcodes_h_l2014_c41_4595_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2014_c41_4595_phase,
lit2_uxn_opcodes_h_l2014_c41_4595_pc,
lit2_uxn_opcodes_h_l2014_c41_4595_previous_stack_read,
lit2_uxn_opcodes_h_l2014_c41_4595_previous_ram_read,
lit2_uxn_opcodes_h_l2014_c41_4595_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f
opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond,
opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output);

-- printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5
printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5 : entity work.printf_uxn_opcodes_h_l2015_c28_b4d5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_left,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_right,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2016_c7_9764
opc_result_MUX_uxn_opcodes_h_l2016_c7_9764 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_cond,
opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue,
opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse,
opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output);

-- inc2_uxn_opcodes_h_l2016_c41_fd5f
inc2_uxn_opcodes_h_l2016_c41_fd5f : entity work.inc2_0CLK_0852fa80 port map (
clk,
inc2_uxn_opcodes_h_l2016_c41_fd5f_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2016_c41_fd5f_phase,
inc2_uxn_opcodes_h_l2016_c41_fd5f_ins,
inc2_uxn_opcodes_h_l2016_c41_fd5f_pc,
inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_stack_read,
inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_ram_read,
inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2017_c7_175a
opc_result_MUX_uxn_opcodes_h_l2017_c7_175a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_cond,
opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output);

-- pop_uxn_opcodes_h_l2017_c41_bc0c
pop_uxn_opcodes_h_l2017_c41_bc0c : entity work.pop_0CLK_25d197a7 port map (
clk,
pop_uxn_opcodes_h_l2017_c41_bc0c_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2017_c41_bc0c_phase,
pop_uxn_opcodes_h_l2017_c41_bc0c_ins,
pop_uxn_opcodes_h_l2017_c41_bc0c_pc,
pop_uxn_opcodes_h_l2017_c41_bc0c_previous_stack_read,
pop_uxn_opcodes_h_l2017_c41_bc0c_previous_ram_read,
pop_uxn_opcodes_h_l2017_c41_bc0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_left,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_right,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2018_c7_a423
opc_result_MUX_uxn_opcodes_h_l2018_c7_a423 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_cond,
opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue,
opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse,
opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output);

-- pop2_uxn_opcodes_h_l2018_c41_a4ed
pop2_uxn_opcodes_h_l2018_c41_a4ed : entity work.pop2_0CLK_25d197a7 port map (
clk,
pop2_uxn_opcodes_h_l2018_c41_a4ed_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2018_c41_a4ed_phase,
pop2_uxn_opcodes_h_l2018_c41_a4ed_ins,
pop2_uxn_opcodes_h_l2018_c41_a4ed_pc,
pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_stack_read,
pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_ram_read,
pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34
opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_cond,
opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue,
opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse,
opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output);

-- nip_uxn_opcodes_h_l2019_c41_5213
nip_uxn_opcodes_h_l2019_c41_5213 : entity work.nip_0CLK_4351dde2 port map (
clk,
nip_uxn_opcodes_h_l2019_c41_5213_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2019_c41_5213_phase,
nip_uxn_opcodes_h_l2019_c41_5213_ins,
nip_uxn_opcodes_h_l2019_c41_5213_pc,
nip_uxn_opcodes_h_l2019_c41_5213_previous_stack_read,
nip_uxn_opcodes_h_l2019_c41_5213_previous_ram_read,
nip_uxn_opcodes_h_l2019_c41_5213_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9
opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond,
opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output);

-- printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45
printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45 : entity work.printf_uxn_opcodes_h_l2020_c28_0a45_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2021_c7_f350
opc_result_MUX_uxn_opcodes_h_l2021_c7_f350 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_cond,
opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue,
opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse,
opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output);

-- swp_uxn_opcodes_h_l2021_c41_61f7
swp_uxn_opcodes_h_l2021_c41_61f7 : entity work.swp_0CLK_a45e5d62 port map (
clk,
swp_uxn_opcodes_h_l2021_c41_61f7_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2021_c41_61f7_phase,
swp_uxn_opcodes_h_l2021_c41_61f7_ins,
swp_uxn_opcodes_h_l2021_c41_61f7_pc,
swp_uxn_opcodes_h_l2021_c41_61f7_previous_stack_read,
swp_uxn_opcodes_h_l2021_c41_61f7_previous_ram_read,
swp_uxn_opcodes_h_l2021_c41_61f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae
opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_cond,
opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue,
opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse,
opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output);

-- swp2_uxn_opcodes_h_l2022_c41_b71e
swp2_uxn_opcodes_h_l2022_c41_b71e : entity work.swp2_0CLK_6f1dc0f8 port map (
clk,
swp2_uxn_opcodes_h_l2022_c41_b71e_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2022_c41_b71e_phase,
swp2_uxn_opcodes_h_l2022_c41_b71e_ins,
swp2_uxn_opcodes_h_l2022_c41_b71e_pc,
swp2_uxn_opcodes_h_l2022_c41_b71e_previous_stack_read,
swp2_uxn_opcodes_h_l2022_c41_b71e_previous_ram_read,
swp2_uxn_opcodes_h_l2022_c41_b71e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0
opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_cond,
opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output);

-- printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c
printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c : entity work.printf_uxn_opcodes_h_l2023_c28_c31c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5
opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_cond,
opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output);

-- rot2_uxn_opcodes_h_l2024_c41_6bef
rot2_uxn_opcodes_h_l2024_c41_6bef : entity work.rot2_0CLK_113f14d9 port map (
clk,
rot2_uxn_opcodes_h_l2024_c41_6bef_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2024_c41_6bef_phase,
rot2_uxn_opcodes_h_l2024_c41_6bef_ins,
rot2_uxn_opcodes_h_l2024_c41_6bef_pc,
rot2_uxn_opcodes_h_l2024_c41_6bef_previous_stack_read,
rot2_uxn_opcodes_h_l2024_c41_6bef_previous_ram_read,
rot2_uxn_opcodes_h_l2024_c41_6bef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8
opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond,
opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output);

-- printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7
printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7 : entity work.printf_uxn_opcodes_h_l2025_c28_bbd7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8
opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond,
opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output);

-- dup2_uxn_opcodes_h_l2026_c41_1ea7
dup2_uxn_opcodes_h_l2026_c41_1ea7 : entity work.dup2_0CLK_a05d6369 port map (
clk,
dup2_uxn_opcodes_h_l2026_c41_1ea7_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2026_c41_1ea7_phase,
dup2_uxn_opcodes_h_l2026_c41_1ea7_ins,
dup2_uxn_opcodes_h_l2026_c41_1ea7_pc,
dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_stack_read,
dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_ram_read,
dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2027_c7_1170
opc_result_MUX_uxn_opcodes_h_l2027_c7_1170 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_cond,
opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue,
opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse,
opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output);

-- printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c
printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c : entity work.printf_uxn_opcodes_h_l2027_c28_060c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_left,
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_right,
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa
opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond,
opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output);

-- ovr2_uxn_opcodes_h_l2028_c41_3754
ovr2_uxn_opcodes_h_l2028_c41_3754 : entity work.ovr2_0CLK_57eb5902 port map (
clk,
ovr2_uxn_opcodes_h_l2028_c41_3754_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2028_c41_3754_phase,
ovr2_uxn_opcodes_h_l2028_c41_3754_ins,
ovr2_uxn_opcodes_h_l2028_c41_3754_pc,
ovr2_uxn_opcodes_h_l2028_c41_3754_previous_stack_read,
ovr2_uxn_opcodes_h_l2028_c41_3754_previous_ram_read,
ovr2_uxn_opcodes_h_l2028_c41_3754_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2029_c7_7681
opc_result_MUX_uxn_opcodes_h_l2029_c7_7681 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_cond,
opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue,
opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse,
opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output);

-- equ_uxn_opcodes_h_l2029_c41_49c5
equ_uxn_opcodes_h_l2029_c41_49c5 : entity work.equ_0CLK_67fe881f port map (
clk,
equ_uxn_opcodes_h_l2029_c41_49c5_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2029_c41_49c5_phase,
equ_uxn_opcodes_h_l2029_c41_49c5_ins,
equ_uxn_opcodes_h_l2029_c41_49c5_pc,
equ_uxn_opcodes_h_l2029_c41_49c5_previous_stack_read,
equ_uxn_opcodes_h_l2029_c41_49c5_previous_ram_read,
equ_uxn_opcodes_h_l2029_c41_49c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2
opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_cond,
opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output);

-- equ2_uxn_opcodes_h_l2030_c41_7927
equ2_uxn_opcodes_h_l2030_c41_7927 : entity work.equ2_0CLK_5fcb251d port map (
clk,
equ2_uxn_opcodes_h_l2030_c41_7927_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2030_c41_7927_phase,
equ2_uxn_opcodes_h_l2030_c41_7927_ins,
equ2_uxn_opcodes_h_l2030_c41_7927_pc,
equ2_uxn_opcodes_h_l2030_c41_7927_previous_stack_read,
equ2_uxn_opcodes_h_l2030_c41_7927_previous_ram_read,
equ2_uxn_opcodes_h_l2030_c41_7927_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_left,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_right,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc
opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_cond,
opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output);

-- printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b
printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b : entity work.printf_uxn_opcodes_h_l2031_c28_aa2b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2032_c7_1686
opc_result_MUX_uxn_opcodes_h_l2032_c7_1686 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_cond,
opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue,
opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse,
opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output);

-- printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891
printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891 : entity work.printf_uxn_opcodes_h_l2032_c28_8891_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2033_c7_d542
opc_result_MUX_uxn_opcodes_h_l2033_c7_d542 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_cond,
opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue,
opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse,
opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output);

-- printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e
printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e : entity work.printf_uxn_opcodes_h_l2033_c28_344e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41
opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_cond,
opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue,
opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse,
opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output);

-- gth2_uxn_opcodes_h_l2034_c41_4fd1
gth2_uxn_opcodes_h_l2034_c41_4fd1 : entity work.gth2_0CLK_5fcb251d port map (
clk,
gth2_uxn_opcodes_h_l2034_c41_4fd1_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2034_c41_4fd1_phase,
gth2_uxn_opcodes_h_l2034_c41_4fd1_ins,
gth2_uxn_opcodes_h_l2034_c41_4fd1_pc,
gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_stack_read,
gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_ram_read,
gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_left,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_right,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1
opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_cond,
opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output);

-- printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6
printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6 : entity work.printf_uxn_opcodes_h_l2035_c28_c7e6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_left,
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_right,
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e
opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_cond,
opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output);

-- lth2_uxn_opcodes_h_l2036_c41_5ba8
lth2_uxn_opcodes_h_l2036_c41_5ba8 : entity work.lth2_0CLK_5fcb251d port map (
clk,
lth2_uxn_opcodes_h_l2036_c41_5ba8_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2036_c41_5ba8_phase,
lth2_uxn_opcodes_h_l2036_c41_5ba8_ins,
lth2_uxn_opcodes_h_l2036_c41_5ba8_pc,
lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_stack_read,
lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_ram_read,
lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9
opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond,
opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output);

-- printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e
printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e : entity work.printf_uxn_opcodes_h_l2037_c28_aa7e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_left,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_right,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2038_c7_013b
opc_result_MUX_uxn_opcodes_h_l2038_c7_013b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_cond,
opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output);

-- jmp2_uxn_opcodes_h_l2038_c41_144d
jmp2_uxn_opcodes_h_l2038_c41_144d : entity work.jmp2_0CLK_06911bbe port map (
clk,
jmp2_uxn_opcodes_h_l2038_c41_144d_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2038_c41_144d_phase,
jmp2_uxn_opcodes_h_l2038_c41_144d_ins,
jmp2_uxn_opcodes_h_l2038_c41_144d_pc,
jmp2_uxn_opcodes_h_l2038_c41_144d_previous_stack_read,
jmp2_uxn_opcodes_h_l2038_c41_144d_previous_ram_read,
jmp2_uxn_opcodes_h_l2038_c41_144d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f
opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond,
opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output);

-- printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f
printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f : entity work.printf_uxn_opcodes_h_l2039_c28_7e9f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed
opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_cond,
opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue,
opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse,
opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output);

-- printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a
printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a : entity work.printf_uxn_opcodes_h_l2040_c28_234a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4
opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_cond,
opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output);

-- printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8
printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8 : entity work.printf_uxn_opcodes_h_l2041_c28_fed8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe
opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond,
opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output);

-- printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac
printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac : entity work.printf_uxn_opcodes_h_l2042_c28_61ac_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2043_c7_80db
opc_result_MUX_uxn_opcodes_h_l2043_c7_80db : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_cond,
opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue,
opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse,
opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output);

-- printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6
printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6 : entity work.printf_uxn_opcodes_h_l2043_c28_dbd6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_left,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_right,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2044_c7_1953
opc_result_MUX_uxn_opcodes_h_l2044_c7_1953 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_cond,
opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue,
opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse,
opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output);

-- sth2_uxn_opcodes_h_l2044_c41_de4b
sth2_uxn_opcodes_h_l2044_c41_de4b : entity work.sth2_0CLK_9c3c4e32 port map (
clk,
sth2_uxn_opcodes_h_l2044_c41_de4b_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2044_c41_de4b_phase,
sth2_uxn_opcodes_h_l2044_c41_de4b_ins,
sth2_uxn_opcodes_h_l2044_c41_de4b_pc,
sth2_uxn_opcodes_h_l2044_c41_de4b_previous_stack_read,
sth2_uxn_opcodes_h_l2044_c41_de4b_previous_ram_read,
sth2_uxn_opcodes_h_l2044_c41_de4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce
opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_cond,
opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output);

-- printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5
printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5 : entity work.printf_uxn_opcodes_h_l2045_c28_41b5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_left,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_right,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6
opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_cond,
opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output);

-- printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2
printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2 : entity work.printf_uxn_opcodes_h_l2046_c28_a9f2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2047_c7_c988
opc_result_MUX_uxn_opcodes_h_l2047_c7_c988 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_cond,
opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue,
opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse,
opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output);

-- printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc
printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc : entity work.printf_uxn_opcodes_h_l2047_c28_a8cc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2048_c7_1524
opc_result_MUX_uxn_opcodes_h_l2048_c7_1524 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_cond,
opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue,
opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse,
opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output);

-- printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580
printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580 : entity work.printf_uxn_opcodes_h_l2048_c28_b580_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45
opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_cond,
opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue,
opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse,
opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output);

-- printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1
printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1 : entity work.printf_uxn_opcodes_h_l2049_c28_41f1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_left,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_right,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2050_c7_e636
opc_result_MUX_uxn_opcodes_h_l2050_c7_e636 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_cond,
opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue,
opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse,
opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output);

-- printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254
printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254 : entity work.printf_uxn_opcodes_h_l2050_c28_f254_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2051_c7_6988
opc_result_MUX_uxn_opcodes_h_l2051_c7_6988 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_cond,
opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue,
opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse,
opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output);

-- printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3
printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3 : entity work.printf_uxn_opcodes_h_l2051_c28_23f3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce
opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_cond,
opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output);

-- printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391
printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391 : entity work.printf_uxn_opcodes_h_l2052_c28_6391_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2053_c7_6947
opc_result_MUX_uxn_opcodes_h_l2053_c7_6947 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_cond,
opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue,
opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse,
opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output);

-- printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503
printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503 : entity work.printf_uxn_opcodes_h_l2053_c28_b503_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_left,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_right,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d
opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond,
opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output);

-- lda2_uxn_opcodes_h_l2054_c41_f847
lda2_uxn_opcodes_h_l2054_c41_f847 : entity work.lda2_0CLK_084aa6da port map (
clk,
lda2_uxn_opcodes_h_l2054_c41_f847_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2054_c41_f847_phase,
lda2_uxn_opcodes_h_l2054_c41_f847_ins,
lda2_uxn_opcodes_h_l2054_c41_f847_pc,
lda2_uxn_opcodes_h_l2054_c41_f847_previous_stack_read,
lda2_uxn_opcodes_h_l2054_c41_f847_previous_ram_read,
lda2_uxn_opcodes_h_l2054_c41_f847_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8
opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond,
opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output);

-- printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792
printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792 : entity work.printf_uxn_opcodes_h_l2055_c28_6792_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65
opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_cond,
opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue,
opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse,
opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output);

-- sta2_uxn_opcodes_h_l2056_c41_0480
sta2_uxn_opcodes_h_l2056_c41_0480 : entity work.sta2_0CLK_df540198 port map (
clk,
sta2_uxn_opcodes_h_l2056_c41_0480_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2056_c41_0480_phase,
sta2_uxn_opcodes_h_l2056_c41_0480_ins,
sta2_uxn_opcodes_h_l2056_c41_0480_pc,
sta2_uxn_opcodes_h_l2056_c41_0480_previous_stack_read,
sta2_uxn_opcodes_h_l2056_c41_0480_previous_ram_read,
sta2_uxn_opcodes_h_l2056_c41_0480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_left,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_right,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2057_c7_a858
opc_result_MUX_uxn_opcodes_h_l2057_c7_a858 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_cond,
opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue,
opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse,
opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output);

-- printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d
printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d : entity work.printf_uxn_opcodes_h_l2057_c28_f21d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2058_c7_1930
opc_result_MUX_uxn_opcodes_h_l2058_c7_1930 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_cond,
opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue,
opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse,
opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output);

-- printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117
printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117 : entity work.printf_uxn_opcodes_h_l2058_c28_6117_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa
opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_cond,
opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output);

-- deo_uxn_opcodes_h_l2059_c41_c707
deo_uxn_opcodes_h_l2059_c41_c707 : entity work.deo_0CLK_feda93f5 port map (
clk,
deo_uxn_opcodes_h_l2059_c41_c707_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2059_c41_c707_phase,
deo_uxn_opcodes_h_l2059_c41_c707_ins,
deo_uxn_opcodes_h_l2059_c41_c707_pc,
deo_uxn_opcodes_h_l2059_c41_c707_previous_stack_read,
deo_uxn_opcodes_h_l2059_c41_c707_previous_ram_read,
deo_uxn_opcodes_h_l2059_c41_c707_previous_device_ram_read,
deo_uxn_opcodes_h_l2059_c41_c707_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2060_c7_0237
opc_result_MUX_uxn_opcodes_h_l2060_c7_0237 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_cond,
opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue,
opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse,
opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output);

-- deo2_uxn_opcodes_h_l2060_c41_34cf
deo2_uxn_opcodes_h_l2060_c41_34cf : entity work.deo2_0CLK_29335e8f port map (
clk,
deo2_uxn_opcodes_h_l2060_c41_34cf_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2060_c41_34cf_phase,
deo2_uxn_opcodes_h_l2060_c41_34cf_ins,
deo2_uxn_opcodes_h_l2060_c41_34cf_pc,
deo2_uxn_opcodes_h_l2060_c41_34cf_previous_stack_read,
deo2_uxn_opcodes_h_l2060_c41_34cf_previous_ram_read,
deo2_uxn_opcodes_h_l2060_c41_34cf_previous_device_ram_read,
deo2_uxn_opcodes_h_l2060_c41_34cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2061_c7_5103
opc_result_MUX_uxn_opcodes_h_l2061_c7_5103 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_cond,
opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue,
opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse,
opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output);

-- printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23
printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23 : entity work.printf_uxn_opcodes_h_l2061_c28_fb23_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f
opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_cond,
opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output);

-- add2_uxn_opcodes_h_l2062_c41_bba2
add2_uxn_opcodes_h_l2062_c41_bba2 : entity work.add2_0CLK_b14a5a36 port map (
clk,
add2_uxn_opcodes_h_l2062_c41_bba2_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2062_c41_bba2_phase,
add2_uxn_opcodes_h_l2062_c41_bba2_ins,
add2_uxn_opcodes_h_l2062_c41_bba2_pc,
add2_uxn_opcodes_h_l2062_c41_bba2_previous_stack_read,
add2_uxn_opcodes_h_l2062_c41_bba2_previous_ram_read,
add2_uxn_opcodes_h_l2062_c41_bba2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e
opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond,
opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output);

-- printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913
printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913 : entity work.printf_uxn_opcodes_h_l2063_c28_c913_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2064_c7_8119
opc_result_MUX_uxn_opcodes_h_l2064_c7_8119 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_cond,
opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue,
opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse,
opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output);

-- sub2_uxn_opcodes_h_l2064_c41_3043
sub2_uxn_opcodes_h_l2064_c41_3043 : entity work.sub2_0CLK_b14a5a36 port map (
clk,
sub2_uxn_opcodes_h_l2064_c41_3043_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2064_c41_3043_phase,
sub2_uxn_opcodes_h_l2064_c41_3043_ins,
sub2_uxn_opcodes_h_l2064_c41_3043_pc,
sub2_uxn_opcodes_h_l2064_c41_3043_previous_stack_read,
sub2_uxn_opcodes_h_l2064_c41_3043_previous_ram_read,
sub2_uxn_opcodes_h_l2064_c41_3043_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_left,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_right,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2065_c7_c243
opc_result_MUX_uxn_opcodes_h_l2065_c7_c243 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_cond,
opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue,
opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse,
opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output);

-- printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421
printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421 : entity work.printf_uxn_opcodes_h_l2065_c28_7421_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_left,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_right,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2066_c7_054e
opc_result_MUX_uxn_opcodes_h_l2066_c7_054e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_cond,
opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output);

-- mul2_uxn_opcodes_h_l2066_c41_271a
mul2_uxn_opcodes_h_l2066_c41_271a : entity work.mul2_0CLK_b14a5a36 port map (
clk,
mul2_uxn_opcodes_h_l2066_c41_271a_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2066_c41_271a_phase,
mul2_uxn_opcodes_h_l2066_c41_271a_ins,
mul2_uxn_opcodes_h_l2066_c41_271a_pc,
mul2_uxn_opcodes_h_l2066_c41_271a_previous_stack_read,
mul2_uxn_opcodes_h_l2066_c41_271a_previous_ram_read,
mul2_uxn_opcodes_h_l2066_c41_271a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_left,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_right,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc
opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond,
opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output);

-- printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341
printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341 : entity work.printf_uxn_opcodes_h_l2067_c28_7341_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9
opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_cond,
opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output);

-- printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b
printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b : entity work.printf_uxn_opcodes_h_l2068_c28_df3b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_left,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_right,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad
opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond,
opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output);

-- printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf
printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf : entity work.printf_uxn_opcodes_h_l2069_c28_42cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_left,
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_right,
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33
opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_cond,
opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue,
opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse,
opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output);

-- and2_uxn_opcodes_h_l2070_c41_a5b5
and2_uxn_opcodes_h_l2070_c41_a5b5 : entity work.and2_0CLK_b14a5a36 port map (
clk,
and2_uxn_opcodes_h_l2070_c41_a5b5_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2070_c41_a5b5_phase,
and2_uxn_opcodes_h_l2070_c41_a5b5_ins,
and2_uxn_opcodes_h_l2070_c41_a5b5_pc,
and2_uxn_opcodes_h_l2070_c41_a5b5_previous_stack_read,
and2_uxn_opcodes_h_l2070_c41_a5b5_previous_ram_read,
and2_uxn_opcodes_h_l2070_c41_a5b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b
opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_cond,
opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output);

-- printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4
printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4 : entity work.printf_uxn_opcodes_h_l2071_c28_51c4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_left,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_right,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b
opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_cond,
opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output);

-- printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6
printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6 : entity work.printf_uxn_opcodes_h_l2072_c28_88a6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2073_c7_e217
opc_result_MUX_uxn_opcodes_h_l2073_c7_e217 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_cond,
opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue,
opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse,
opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output);

-- eor_uxn_opcodes_h_l2073_c41_9778
eor_uxn_opcodes_h_l2073_c41_9778 : entity work.eor_0CLK_06911bbe port map (
clk,
eor_uxn_opcodes_h_l2073_c41_9778_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2073_c41_9778_phase,
eor_uxn_opcodes_h_l2073_c41_9778_ins,
eor_uxn_opcodes_h_l2073_c41_9778_pc,
eor_uxn_opcodes_h_l2073_c41_9778_previous_stack_read,
eor_uxn_opcodes_h_l2073_c41_9778_previous_ram_read,
eor_uxn_opcodes_h_l2073_c41_9778_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_left,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_right,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b
opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_cond,
opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output);

-- eor2_uxn_opcodes_h_l2074_c41_453a
eor2_uxn_opcodes_h_l2074_c41_453a : entity work.eor2_0CLK_b14a5a36 port map (
clk,
eor2_uxn_opcodes_h_l2074_c41_453a_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2074_c41_453a_phase,
eor2_uxn_opcodes_h_l2074_c41_453a_ins,
eor2_uxn_opcodes_h_l2074_c41_453a_pc,
eor2_uxn_opcodes_h_l2074_c41_453a_previous_stack_read,
eor2_uxn_opcodes_h_l2074_c41_453a_previous_ram_read,
eor2_uxn_opcodes_h_l2074_c41_453a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47
opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_cond,
opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue,
opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse,
opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output);

-- sft_uxn_opcodes_h_l2075_c41_4299
sft_uxn_opcodes_h_l2075_c41_4299 : entity work.sft_0CLK_0d42d320 port map (
clk,
sft_uxn_opcodes_h_l2075_c41_4299_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2075_c41_4299_phase,
sft_uxn_opcodes_h_l2075_c41_4299_ins,
sft_uxn_opcodes_h_l2075_c41_4299_pc,
sft_uxn_opcodes_h_l2075_c41_4299_previous_stack_read,
sft_uxn_opcodes_h_l2075_c41_4299_previous_ram_read,
sft_uxn_opcodes_h_l2075_c41_4299_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_left,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_right,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0
opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_cond,
opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output);

-- sft2_uxn_opcodes_h_l2076_c41_671e
sft2_uxn_opcodes_h_l2076_c41_671e : entity work.sft2_0CLK_51ffd248 port map (
clk,
sft2_uxn_opcodes_h_l2076_c41_671e_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2076_c41_671e_phase,
sft2_uxn_opcodes_h_l2076_c41_671e_ins,
sft2_uxn_opcodes_h_l2076_c41_671e_pc,
sft2_uxn_opcodes_h_l2076_c41_671e_previous_stack_read,
sft2_uxn_opcodes_h_l2076_c41_671e_previous_ram_read,
sft2_uxn_opcodes_h_l2076_c41_671e_return_output);

-- printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce
printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce : entity work.printf_uxn_opcodes_h_l2077_c9_24ce_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_arg0);

-- sp1_MUX_uxn_opcodes_h_l2079_c2_e930
sp1_MUX_uxn_opcodes_h_l2079_c2_e930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2079_c2_e930_cond,
sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue,
sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse,
sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output);

-- sp0_MUX_uxn_opcodes_h_l2079_c2_e930
sp0_MUX_uxn_opcodes_h_l2079_c2_e930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2079_c2_e930_cond,
sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue,
sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse,
sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output);

-- sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd
sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond,
sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue,
sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse,
sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output);

-- sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd
sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond,
sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue,
sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse,
sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_left,
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_right,
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_left,
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_right,
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output);

-- MUX_uxn_opcodes_h_l2089_c19_faed
MUX_uxn_opcodes_h_l2089_c19_faed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2089_c19_faed_cond,
MUX_uxn_opcodes_h_l2089_c19_faed_iftrue,
MUX_uxn_opcodes_h_l2089_c19_faed_iffalse,
MUX_uxn_opcodes_h_l2089_c19_faed_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_left,
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_right,
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_cond,
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864 : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address0,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_value,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address1,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3 : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address0,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_value,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address1,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output);

-- device_ram_update_uxn_opcodes_h_l2112_c26_6378
device_ram_update_uxn_opcodes_h_l2112_c26_6378 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_address0,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_value,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_enable,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_read0_enable,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_address1,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_read1_enable,
device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output,
 CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output,
 MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output,
 MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output,
 opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output,
 jci_uxn_opcodes_h_l2008_c41_1abc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output,
 opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output,
 jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output,
 opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output,
 jsi_uxn_opcodes_h_l2010_c41_669b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output,
 lit_uxn_opcodes_h_l2011_c41_46f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output,
 lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output,
 lit_uxn_opcodes_h_l2013_c41_7c5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output,
 lit2_uxn_opcodes_h_l2014_c41_4595_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output,
 opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output,
 inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output,
 opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output,
 pop_uxn_opcodes_h_l2017_c41_bc0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output,
 opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output,
 pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output,
 nip_uxn_opcodes_h_l2019_c41_5213_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output,
 opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output,
 opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output,
 swp_uxn_opcodes_h_l2021_c41_61f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output,
 swp2_uxn_opcodes_h_l2022_c41_b71e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output,
 rot2_uxn_opcodes_h_l2024_c41_6bef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output,
 opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output,
 dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output,
 opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output,
 ovr2_uxn_opcodes_h_l2028_c41_3754_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output,
 equ_uxn_opcodes_h_l2029_c41_49c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output,
 equ2_uxn_opcodes_h_l2030_c41_7927_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output,
 opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output,
 opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output,
 opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output,
 gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output,
 lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output,
 jmp2_uxn_opcodes_h_l2038_c41_144d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output,
 opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output,
 opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output,
 opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output,
 sth2_uxn_opcodes_h_l2044_c41_de4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output,
 opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output,
 opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output,
 opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output,
 opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output,
 opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output,
 opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output,
 lda2_uxn_opcodes_h_l2054_c41_f847_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output,
 opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output,
 opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output,
 sta2_uxn_opcodes_h_l2056_c41_0480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output,
 opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output,
 opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output,
 deo_uxn_opcodes_h_l2059_c41_c707_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output,
 opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output,
 deo2_uxn_opcodes_h_l2060_c41_34cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output,
 add2_uxn_opcodes_h_l2062_c41_bba2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output,
 opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output,
 opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output,
 sub2_uxn_opcodes_h_l2064_c41_3043_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output,
 mul2_uxn_opcodes_h_l2066_c41_271a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output,
 opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output,
 and2_uxn_opcodes_h_l2070_c41_a5b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output,
 opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output,
 eor_uxn_opcodes_h_l2073_c41_9778_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output,
 opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output,
 eor2_uxn_opcodes_h_l2074_c41_453a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output,
 sft_uxn_opcodes_h_l2075_c41_4299_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output,
 sft2_uxn_opcodes_h_l2076_c41_671e_return_output,
 sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output,
 sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output,
 sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output,
 sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output,
 MUX_uxn_opcodes_h_l2089_c19_faed_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output,
 stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output,
 stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output,
 device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2002_c2_b0be : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c30_2a21_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c57_560f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2007_c2_85e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_1abc_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_1abc_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_1abc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_1abc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_1abc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_1abc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_669b_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_669b_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_669b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_669b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_669b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_669b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_46f2_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_46f2_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_46f2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_46f2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_46f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_46f2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_4595_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_4595_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_4595_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_4595_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_4595_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_4595_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2015_c7_4e5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_pc : unsigned(15 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_pc : unsigned(15 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_pc : unsigned(15 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_pc : unsigned(15 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_previous_ram_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_5213_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2020_c7_bdd9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_pc : unsigned(15 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_61f7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_pc : unsigned(15 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2023_c7_eae0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_pc : unsigned(15 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2025_c7_b5b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_pc : unsigned(15 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2027_c7_1170_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_pc : unsigned(15 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_pc : unsigned(15 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_49c5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_pc : unsigned(15 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_7927_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2031_c7_afdc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2032_c7_1686_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2033_c7_d542_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_pc : unsigned(15 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2035_c7_fed1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_pc : unsigned(15 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2037_c7_f6e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_pc : unsigned(15 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2039_c7_4c4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2040_c7_21ed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2041_c7_90e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2042_c7_2dfe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2043_c7_80db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_pc : unsigned(15 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_9cce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2046_c7_efe6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_c988_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2048_c7_1524_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_cb45_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2050_c7_e636_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2051_c7_6988_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2052_c7_6bce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2053_c7_6947_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_pc : unsigned(15 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_f847_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_5ea8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_pc : unsigned(15 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_0480_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_a858_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2058_c7_1930_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_pc : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_c707_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_pc : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_5103_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_pc : unsigned(15 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_bba2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_ab1e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_pc : unsigned(15 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_3043_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_c243_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_pc : unsigned(15 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_271a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_fcfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_96d9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_e1ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_pc : unsigned(15 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_be4b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_b29b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_pc : unsigned(15 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_9778_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_pc : unsigned(15 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_453a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_pc : unsigned(15 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_4299_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_pc : unsigned(15 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_671e_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_ee81_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2081_c4_c7ff : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2083_c4_b389 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_432e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_00ca_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2089_c2_99df : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_faed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_faed_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_faed_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_faed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_c82_d309_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_52e5_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2093_c3_5623 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2102_c3_7d3a : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l2112_c2_8565 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2114_c3_046c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2115_c3_a146_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2118_c3_9adc_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2121_c34_6e88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2122_c23_4d2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2123_c32_1105_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2124_c33_1400_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2125_c29_057a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2126_c30_e124_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2127_c34_68f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2128_c33_04f6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2129_c31_ab3a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2130_c32_2365_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2080_l2092_l2089_DUPLICATE_5fea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2081_l2083_DUPLICATE_d2ed_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_ed1a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_1215_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_right := to_unsigned(3584, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_right := to_unsigned(21, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_right := to_unsigned(49, 6);
     VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_right := to_unsigned(16, 5);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_right := to_unsigned(52, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_right := to_unsigned(58, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_right := to_unsigned(9, 4);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read0_enable := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_right := to_unsigned(3072, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_right := to_unsigned(42, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_right := to_unsigned(27, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_right := to_unsigned(64, 7);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_right := to_unsigned(4, 3);
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_read0_enable := to_unsigned(0, 1);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_right := to_unsigned(34, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_right := to_unsigned(2048, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_right := to_unsigned(2560, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse := opc_result;
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_pc := VAR_pc;
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_pc := VAR_pc;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_pc := VAR_pc;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_pc := VAR_pc;
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_pc := VAR_pc;
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_pc := VAR_pc;
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_pc := VAR_pc;
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_pc := VAR_pc;
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_pc := VAR_pc;
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_pc := VAR_pc;
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_pc := VAR_pc;
     VAR_jci_uxn_opcodes_h_l2008_c41_1abc_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_pc := VAR_pc;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2010_c41_669b_pc := VAR_pc;
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2014_c41_4595_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2011_c41_46f2_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_pc := VAR_pc;
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_pc := VAR_pc;
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_pc := VAR_pc;
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_pc := VAR_pc;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_pc := VAR_pc;
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_pc := VAR_pc;
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_pc := VAR_pc;
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_pc := VAR_pc;
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_pc := VAR_pc;
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_pc := VAR_pc;
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_pc := VAR_pc;
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_pc := VAR_pc;
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_pc := VAR_pc;
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_pc := VAR_pc;
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2008_c41_1abc_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2010_c41_669b_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2014_c41_4595_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2011_c41_46f2_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_phase := VAR_phase;
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_previous_ram_read := VAR_previous_ram_read;
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_previous_ram_read := VAR_previous_ram_read;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_ram_read := VAR_previous_ram_read;
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_ram_read := VAR_previous_ram_read;
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_previous_ram_read := VAR_previous_ram_read;
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_previous_ram_read := VAR_previous_ram_read;
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_previous_ram_read := VAR_previous_ram_read;
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_previous_ram_read := VAR_previous_ram_read;
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_ram_read := VAR_previous_ram_read;
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2008_c41_1abc_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_ram_read := VAR_previous_ram_read;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2010_c41_669b_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2014_c41_4595_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2011_c41_46f2_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_previous_ram_read := VAR_previous_ram_read;
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_ram_read := VAR_previous_ram_read;
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_previous_ram_read := VAR_previous_ram_read;
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_previous_ram_read := VAR_previous_ram_read;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_previous_ram_read := VAR_previous_ram_read;
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_ram_read := VAR_previous_ram_read;
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_previous_ram_read := VAR_previous_ram_read;
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_previous_ram_read := VAR_previous_ram_read;
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_previous_ram_read := VAR_previous_ram_read;
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_previous_ram_read := VAR_previous_ram_read;
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_previous_ram_read := VAR_previous_ram_read;
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_previous_ram_read := VAR_previous_ram_read;
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_previous_ram_read := VAR_previous_ram_read;
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_previous_ram_read := VAR_previous_ram_read;
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_previous_ram_read := VAR_previous_ram_read;
     REG_VAR_sp := sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2008_c41_1abc_previous_stack_read := stack_read_value;
     VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_previous_stack_read := stack_read_value;
     VAR_jsi_uxn_opcodes_h_l2010_c41_669b_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l2014_c41_4595_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l2011_c41_46f2_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_previous_stack_read := stack_read_value;
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_stack_read := stack_read_value;
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2041_c7_90e4] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2041_c7_90e4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2047_c7_c988] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_c988_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2002_c41_bb46] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_left;
     BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output := BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2043_c7_80db] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2043_c7_80db_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2069_c7_e1ad] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_e1ad_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2007_c2_85e9] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2007_c2_85e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2002_c57_560f] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c57_560f_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2031_c7_afdc] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2031_c7_afdc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2072_c7_b29b] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_b29b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2027_c7_1170] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2027_c7_1170_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2068_c7_96d9] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_96d9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2065_c7_c243] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_c243_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2057_c7_a858] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_a858_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2046_c7_efe6] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2046_c7_efe6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2045_c7_9cce] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_9cce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2039_c7_4c4f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2039_c7_4c4f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2049_c7_cb45] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_cb45_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2058_c7_1930] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2058_c7_1930_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2051_c7_6988] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2051_c7_6988_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2042_c7_2dfe] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2042_c7_2dfe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2050_c7_e636] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2050_c7_e636_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2071_c7_be4b] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_be4b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2035_c7_fed1] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2035_c7_fed1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2061_c7_5103] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_5103_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2032_c7_1686] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2032_c7_1686_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2002_c10_cb7b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_left;
     BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output := BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2003_c18_9714] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_left;
     BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output := BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2037_c7_f6e9] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2037_c7_f6e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2033_c7_d542] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2033_c7_d542_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2023_c7_eae0] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2023_c7_eae0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2040_c7_21ed] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2040_c7_21ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2048_c7_1524] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2048_c7_1524_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2015_c7_4e5f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2015_c7_4e5f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2020_c7_bdd9] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2020_c7_bdd9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2067_c7_fcfc] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_fcfc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2055_c7_5ea8] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_5ea8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2063_c7_ab1e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_ab1e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2025_c7_b5b8] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2025_c7_b5b8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2052_c7_6bce] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2052_c7_6bce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2053_c7_6947] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2053_c7_6947_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_cb7b_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_9714_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c57_560f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2007_c2_85e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2015_c7_4e5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2020_c7_bdd9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2023_c7_eae0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2025_c7_b5b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2027_c7_1170_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2031_c7_afdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2032_c7_1686_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2033_c7_d542_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2035_c7_fed1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2037_c7_f6e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2039_c7_4c4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2040_c7_21ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2041_c7_90e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2042_c7_2dfe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2043_c7_80db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_9cce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2046_c7_efe6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_c988_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2048_c7_1524_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_cb45_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2050_c7_e636_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2051_c7_6988_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2052_c7_6bce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2053_c7_6947_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_5ea8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_a858_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2058_c7_1930_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_5103_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_ab1e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_c243_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_fcfc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_96d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_e1ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_be4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_b29b_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2003_c18_7861] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_left;
     BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output := BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l2002_c57_6154] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output := CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2002_c30_2a21] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c30_2a21_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_bb46_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2002_c10_aa5b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_left;
     BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output := BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_aa5b_return_output;
     VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_7861_return_output;
     VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c30_2a21_return_output;
     VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_6154_return_output;
     -- MUX[uxn_opcodes_h_l2002_c10_7e9d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2002_c10_7e9d_cond <= VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_cond;
     MUX_uxn_opcodes_h_l2002_c10_7e9d_iftrue <= VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_iftrue;
     MUX_uxn_opcodes_h_l2002_c10_7e9d_iffalse <= VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output := MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output;

     -- MUX[uxn_opcodes_h_l2003_c18_d5d9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2003_c18_d5d9_cond <= VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_cond;
     MUX_uxn_opcodes_h_l2003_c18_d5d9_iftrue <= VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_iftrue;
     MUX_uxn_opcodes_h_l2003_c18_d5d9_iffalse <= VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output := MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2002_c2_b0be := VAR_MUX_uxn_opcodes_h_l2002_c10_7e9d_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_left := VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l2003_c18_d5d9_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_left := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2002_c2_b0be;
     VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg1 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     VAR_printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_b0be, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2023_c11_8eb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_60db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_a978] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_left;
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output := BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_a0f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_d48c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_9e50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_4aa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_cff7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_9a3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_1860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_a576] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2014_c11_7d52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_left;
     BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output := BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_2e8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_e6d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_9bcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_c907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_left;
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output := BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_85eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2027_c11_19a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_e0a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2036_c11_349c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_ad75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_41a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_50ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_0873] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_405f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_5a64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_183b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_a988] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2022_c11_92b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_8877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_eb0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2070_c11_2308] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_left;
     BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output := BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_0cad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_e735] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_left;
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output := BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2028_c11_5d1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_e631] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_2bf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_44b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_6ba6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_08a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_252a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_cb09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_left;
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output := BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_525b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_2a2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_f2e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_7d92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_f64c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2049_c11_e6d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_6eff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_63d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_2726] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_left;
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output := BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_dc96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_left;
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output := BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_7d8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_e202] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_aa6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_3276] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_left;
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output := BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2011_c11_d3c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_dae3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_50fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_0396] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_8203] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2007_c6_a377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_left;
     BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output := BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_9dd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_14ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_f050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_6eb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_52b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_90ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_d3ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output;

     -- printf_uxn_opcodes_h_l2005_c2_69a6[uxn_opcodes_h_l2005_c2_69a6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg0 <= VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg0;
     printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg1 <= VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg1;
     printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg2 <= VAR_printf_uxn_opcodes_h_l2005_c2_69a6_uxn_opcodes_h_l2005_c2_69a6_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_b893] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_left;
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output := BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_a377_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_41a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_2e8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_9bcd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_d3c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_2726_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_aa6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_7d52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d48c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_b893_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_f2e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_525b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_a0f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f050_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_8877_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_92b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_8eb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_14ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_5a64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_f64c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_19a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d1c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a988_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_e6d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_183b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_90ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7d92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_2a2c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_d3ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_349c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_85eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_e735_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_50ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_cff7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_a576_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_9e50_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_7d8c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_dc96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_9a3e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_ad75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_2bf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0396_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_e6d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_a978_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_eb0d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6eff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_e631_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_cb09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_4aa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_52b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_c907_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_50fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1860_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_63d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_6eb0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_e202_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_08a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9dd7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_60db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_6ba6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_dae3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_0873_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_0cad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_2308_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_8203_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_405f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e0a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_3276_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_44b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_252a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c7_5684] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_5684_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c7_bbcd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c1_426c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output;
     VAR_jci_uxn_opcodes_h_l2008_c41_1abc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_426c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c1_6fa7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c7_b401] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output;

     -- jci[uxn_opcodes_h_l2008_c41_1abc] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2008_c41_1abc_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2008_c41_1abc_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2008_c41_1abc_phase <= VAR_jci_uxn_opcodes_h_l2008_c41_1abc_phase;
     jci_uxn_opcodes_h_l2008_c41_1abc_pc <= VAR_jci_uxn_opcodes_h_l2008_c41_1abc_pc;
     jci_uxn_opcodes_h_l2008_c41_1abc_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2008_c41_1abc_previous_stack_read;
     jci_uxn_opcodes_h_l2008_c41_1abc_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2008_c41_1abc_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2008_c41_1abc_return_output := jci_uxn_opcodes_h_l2008_c41_1abc_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_b401_return_output;
     VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_6fa7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue := VAR_jci_uxn_opcodes_h_l2008_c41_1abc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c1_6bd1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c7_3314] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output;

     -- jmi[uxn_opcodes_h_l2009_c41_b9cd] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2009_c41_b9cd_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2009_c41_b9cd_phase <= VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_phase;
     jmi_uxn_opcodes_h_l2009_c41_b9cd_pc <= VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_pc;
     jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_stack_read <= VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_stack_read;
     jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output := jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_3314_return_output;
     VAR_jsi_uxn_opcodes_h_l2010_c41_669b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_6bd1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue := VAR_jmi_uxn_opcodes_h_l2009_c41_b9cd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c7_f22c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output;

     -- jsi[uxn_opcodes_h_l2010_c41_669b] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2010_c41_669b_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2010_c41_669b_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2010_c41_669b_phase <= VAR_jsi_uxn_opcodes_h_l2010_c41_669b_phase;
     jsi_uxn_opcodes_h_l2010_c41_669b_pc <= VAR_jsi_uxn_opcodes_h_l2010_c41_669b_pc;
     jsi_uxn_opcodes_h_l2010_c41_669b_previous_stack_read <= VAR_jsi_uxn_opcodes_h_l2010_c41_669b_previous_stack_read;
     jsi_uxn_opcodes_h_l2010_c41_669b_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2010_c41_669b_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2010_c41_669b_return_output := jsi_uxn_opcodes_h_l2010_c41_669b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c1_9370] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output;
     VAR_lit_uxn_opcodes_h_l2011_c41_46f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_9370_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue := VAR_jsi_uxn_opcodes_h_l2010_c41_669b_return_output;
     -- lit[uxn_opcodes_h_l2011_c41_46f2] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2011_c41_46f2_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2011_c41_46f2_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2011_c41_46f2_phase <= VAR_lit_uxn_opcodes_h_l2011_c41_46f2_phase;
     lit_uxn_opcodes_h_l2011_c41_46f2_pc <= VAR_lit_uxn_opcodes_h_l2011_c41_46f2_pc;
     lit_uxn_opcodes_h_l2011_c41_46f2_previous_stack_read <= VAR_lit_uxn_opcodes_h_l2011_c41_46f2_previous_stack_read;
     lit_uxn_opcodes_h_l2011_c41_46f2_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2011_c41_46f2_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2011_c41_46f2_return_output := lit_uxn_opcodes_h_l2011_c41_46f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c1_c8dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c7_b7b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output;
     VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_c8dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue := VAR_lit_uxn_opcodes_h_l2011_c41_46f2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c1_ec56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c7_fa3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output;

     -- lit2[uxn_opcodes_h_l2012_c41_a8fc] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2012_c41_a8fc_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2012_c41_a8fc_phase <= VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_phase;
     lit2_uxn_opcodes_h_l2012_c41_a8fc_pc <= VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_pc;
     lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_stack_read;
     lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output := lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output;
     VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_ec56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue := VAR_lit2_uxn_opcodes_h_l2012_c41_a8fc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c1_c54c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output;

     -- lit[uxn_opcodes_h_l2013_c41_7c5a] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2013_c41_7c5a_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2013_c41_7c5a_phase <= VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_phase;
     lit_uxn_opcodes_h_l2013_c41_7c5a_pc <= VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_pc;
     lit_uxn_opcodes_h_l2013_c41_7c5a_previous_stack_read <= VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_previous_stack_read;
     lit_uxn_opcodes_h_l2013_c41_7c5a_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_return_output := lit_uxn_opcodes_h_l2013_c41_7c5a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c7_4e5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output;
     VAR_lit2_uxn_opcodes_h_l2014_c41_4595_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_c54c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue := VAR_lit_uxn_opcodes_h_l2013_c41_7c5a_return_output;
     -- lit2[uxn_opcodes_h_l2014_c41_4595] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2014_c41_4595_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2014_c41_4595_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2014_c41_4595_phase <= VAR_lit2_uxn_opcodes_h_l2014_c41_4595_phase;
     lit2_uxn_opcodes_h_l2014_c41_4595_pc <= VAR_lit2_uxn_opcodes_h_l2014_c41_4595_pc;
     lit2_uxn_opcodes_h_l2014_c41_4595_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l2014_c41_4595_previous_stack_read;
     lit2_uxn_opcodes_h_l2014_c41_4595_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2014_c41_4595_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2014_c41_4595_return_output := lit2_uxn_opcodes_h_l2014_c41_4595_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c7_9764] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c1_a252] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_9764_return_output;
     VAR_printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_a252_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue := VAR_lit2_uxn_opcodes_h_l2014_c41_4595_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c7_175a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c1_c356] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output;

     -- printf_uxn_opcodes_h_l2015_c28_b4d5[uxn_opcodes_h_l2015_c28_b4d5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_arg0 <= VAR_printf_uxn_opcodes_h_l2015_c28_b4d5_uxn_opcodes_h_l2015_c28_b4d5_arg0;
     -- Outputs

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_175a_return_output;
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_c356_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c7_a423] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c1_a5dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output;

     -- inc2[uxn_opcodes_h_l2016_c41_fd5f] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2016_c41_fd5f_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2016_c41_fd5f_phase <= VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_phase;
     inc2_uxn_opcodes_h_l2016_c41_fd5f_ins <= VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_ins;
     inc2_uxn_opcodes_h_l2016_c41_fd5f_pc <= VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_pc;
     inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_stack_read;
     inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_ram_read <= VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_previous_ram_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output := inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_a423_return_output;
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_a5dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue := VAR_inc2_uxn_opcodes_h_l2016_c41_fd5f_return_output;
     -- pop[uxn_opcodes_h_l2017_c41_bc0c] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2017_c41_bc0c_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2017_c41_bc0c_phase <= VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_phase;
     pop_uxn_opcodes_h_l2017_c41_bc0c_ins <= VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_ins;
     pop_uxn_opcodes_h_l2017_c41_bc0c_pc <= VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_pc;
     pop_uxn_opcodes_h_l2017_c41_bc0c_previous_stack_read <= VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_previous_stack_read;
     pop_uxn_opcodes_h_l2017_c41_bc0c_previous_ram_read <= VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_previous_ram_read;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_return_output := pop_uxn_opcodes_h_l2017_c41_bc0c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c1_931a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c7_ac34] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output;
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_931a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue := VAR_pop_uxn_opcodes_h_l2017_c41_bc0c_return_output;
     -- pop2[uxn_opcodes_h_l2018_c41_a4ed] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2018_c41_a4ed_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2018_c41_a4ed_phase <= VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_phase;
     pop2_uxn_opcodes_h_l2018_c41_a4ed_ins <= VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_ins;
     pop2_uxn_opcodes_h_l2018_c41_a4ed_pc <= VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_pc;
     pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_stack_read <= VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_stack_read;
     pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_ram_read <= VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_previous_ram_read;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output := pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c7_bdd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c1_678b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output;
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_678b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue := VAR_pop2_uxn_opcodes_h_l2018_c41_a4ed_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c1_0358] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c7_f350] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output;

     -- nip[uxn_opcodes_h_l2019_c41_5213] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2019_c41_5213_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2019_c41_5213_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2019_c41_5213_phase <= VAR_nip_uxn_opcodes_h_l2019_c41_5213_phase;
     nip_uxn_opcodes_h_l2019_c41_5213_ins <= VAR_nip_uxn_opcodes_h_l2019_c41_5213_ins;
     nip_uxn_opcodes_h_l2019_c41_5213_pc <= VAR_nip_uxn_opcodes_h_l2019_c41_5213_pc;
     nip_uxn_opcodes_h_l2019_c41_5213_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2019_c41_5213_previous_stack_read;
     nip_uxn_opcodes_h_l2019_c41_5213_previous_ram_read <= VAR_nip_uxn_opcodes_h_l2019_c41_5213_previous_ram_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2019_c41_5213_return_output := nip_uxn_opcodes_h_l2019_c41_5213_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_f350_return_output;
     VAR_printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_0358_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue := VAR_nip_uxn_opcodes_h_l2019_c41_5213_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c1_0f0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c7_46ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output;

     -- printf_uxn_opcodes_h_l2020_c28_0a45[uxn_opcodes_h_l2020_c28_0a45] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_arg0 <= VAR_printf_uxn_opcodes_h_l2020_c28_0a45_uxn_opcodes_h_l2020_c28_0a45_arg0;
     -- Outputs

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output;
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_0f0a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c7_eae0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c1_e618] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output;

     -- swp[uxn_opcodes_h_l2021_c41_61f7] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2021_c41_61f7_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2021_c41_61f7_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2021_c41_61f7_phase <= VAR_swp_uxn_opcodes_h_l2021_c41_61f7_phase;
     swp_uxn_opcodes_h_l2021_c41_61f7_ins <= VAR_swp_uxn_opcodes_h_l2021_c41_61f7_ins;
     swp_uxn_opcodes_h_l2021_c41_61f7_pc <= VAR_swp_uxn_opcodes_h_l2021_c41_61f7_pc;
     swp_uxn_opcodes_h_l2021_c41_61f7_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2021_c41_61f7_previous_stack_read;
     swp_uxn_opcodes_h_l2021_c41_61f7_previous_ram_read <= VAR_swp_uxn_opcodes_h_l2021_c41_61f7_previous_ram_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2021_c41_61f7_return_output := swp_uxn_opcodes_h_l2021_c41_61f7_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output;
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_e618_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue := VAR_swp_uxn_opcodes_h_l2021_c41_61f7_return_output;
     -- swp2[uxn_opcodes_h_l2022_c41_b71e] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2022_c41_b71e_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2022_c41_b71e_phase <= VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_phase;
     swp2_uxn_opcodes_h_l2022_c41_b71e_ins <= VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_ins;
     swp2_uxn_opcodes_h_l2022_c41_b71e_pc <= VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_pc;
     swp2_uxn_opcodes_h_l2022_c41_b71e_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_previous_stack_read;
     swp2_uxn_opcodes_h_l2022_c41_b71e_previous_ram_read <= VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_previous_ram_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_return_output := swp2_uxn_opcodes_h_l2022_c41_b71e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c7_28f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c1_d34d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output;
     VAR_printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_d34d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue := VAR_swp2_uxn_opcodes_h_l2022_c41_b71e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c7_b5b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c1_e7e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output;

     -- printf_uxn_opcodes_h_l2023_c28_c31c[uxn_opcodes_h_l2023_c28_c31c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_arg0 <= VAR_printf_uxn_opcodes_h_l2023_c28_c31c_uxn_opcodes_h_l2023_c28_c31c_arg0;
     -- Outputs

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output;
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_e7e8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c1_e683] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c7_f7d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output;

     -- rot2[uxn_opcodes_h_l2024_c41_6bef] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2024_c41_6bef_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2024_c41_6bef_phase <= VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_phase;
     rot2_uxn_opcodes_h_l2024_c41_6bef_ins <= VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_ins;
     rot2_uxn_opcodes_h_l2024_c41_6bef_pc <= VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_pc;
     rot2_uxn_opcodes_h_l2024_c41_6bef_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_previous_stack_read;
     rot2_uxn_opcodes_h_l2024_c41_6bef_previous_ram_read <= VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_previous_ram_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_return_output := rot2_uxn_opcodes_h_l2024_c41_6bef_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output;
     VAR_printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_e683_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue := VAR_rot2_uxn_opcodes_h_l2024_c41_6bef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c1_9b0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output;

     -- printf_uxn_opcodes_h_l2025_c28_bbd7[uxn_opcodes_h_l2025_c28_bbd7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_arg0 <= VAR_printf_uxn_opcodes_h_l2025_c28_bbd7_uxn_opcodes_h_l2025_c28_bbd7_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c7_1170] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_1170_return_output;
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_9b0d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c7_f1fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c1_68fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output;

     -- dup2[uxn_opcodes_h_l2026_c41_1ea7] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2026_c41_1ea7_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2026_c41_1ea7_phase <= VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_phase;
     dup2_uxn_opcodes_h_l2026_c41_1ea7_ins <= VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_ins;
     dup2_uxn_opcodes_h_l2026_c41_1ea7_pc <= VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_pc;
     dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_stack_read;
     dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_ram_read <= VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_previous_ram_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output := dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output;
     VAR_printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_68fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue := VAR_dup2_uxn_opcodes_h_l2026_c41_1ea7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c7_7681] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output;

     -- printf_uxn_opcodes_h_l2027_c28_060c[uxn_opcodes_h_l2027_c28_060c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_arg0 <= VAR_printf_uxn_opcodes_h_l2027_c28_060c_uxn_opcodes_h_l2027_c28_060c_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c1_7638] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_7681_return_output;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_7638_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c1_d1e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output;

     -- ovr2[uxn_opcodes_h_l2028_c41_3754] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2028_c41_3754_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2028_c41_3754_phase <= VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_phase;
     ovr2_uxn_opcodes_h_l2028_c41_3754_ins <= VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_ins;
     ovr2_uxn_opcodes_h_l2028_c41_3754_pc <= VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_pc;
     ovr2_uxn_opcodes_h_l2028_c41_3754_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_previous_stack_read;
     ovr2_uxn_opcodes_h_l2028_c41_3754_previous_ram_read <= VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_previous_ram_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_return_output := ovr2_uxn_opcodes_h_l2028_c41_3754_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c7_10f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output;
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_d1e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue := VAR_ovr2_uxn_opcodes_h_l2028_c41_3754_return_output;
     -- equ[uxn_opcodes_h_l2029_c41_49c5] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2029_c41_49c5_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2029_c41_49c5_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2029_c41_49c5_phase <= VAR_equ_uxn_opcodes_h_l2029_c41_49c5_phase;
     equ_uxn_opcodes_h_l2029_c41_49c5_ins <= VAR_equ_uxn_opcodes_h_l2029_c41_49c5_ins;
     equ_uxn_opcodes_h_l2029_c41_49c5_pc <= VAR_equ_uxn_opcodes_h_l2029_c41_49c5_pc;
     equ_uxn_opcodes_h_l2029_c41_49c5_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2029_c41_49c5_previous_stack_read;
     equ_uxn_opcodes_h_l2029_c41_49c5_previous_ram_read <= VAR_equ_uxn_opcodes_h_l2029_c41_49c5_previous_ram_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2029_c41_49c5_return_output := equ_uxn_opcodes_h_l2029_c41_49c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c1_0cc3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c7_afdc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output;
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0cc3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue := VAR_equ_uxn_opcodes_h_l2029_c41_49c5_return_output;
     -- equ2[uxn_opcodes_h_l2030_c41_7927] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2030_c41_7927_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2030_c41_7927_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2030_c41_7927_phase <= VAR_equ2_uxn_opcodes_h_l2030_c41_7927_phase;
     equ2_uxn_opcodes_h_l2030_c41_7927_ins <= VAR_equ2_uxn_opcodes_h_l2030_c41_7927_ins;
     equ2_uxn_opcodes_h_l2030_c41_7927_pc <= VAR_equ2_uxn_opcodes_h_l2030_c41_7927_pc;
     equ2_uxn_opcodes_h_l2030_c41_7927_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2030_c41_7927_previous_stack_read;
     equ2_uxn_opcodes_h_l2030_c41_7927_previous_ram_read <= VAR_equ2_uxn_opcodes_h_l2030_c41_7927_previous_ram_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2030_c41_7927_return_output := equ2_uxn_opcodes_h_l2030_c41_7927_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c7_1686] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_1433] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_1686_return_output;
     VAR_printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_1433_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue := VAR_equ2_uxn_opcodes_h_l2030_c41_7927_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c7_d542] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output;

     -- printf_uxn_opcodes_h_l2031_c28_aa2b[uxn_opcodes_h_l2031_c28_aa2b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_arg0 <= VAR_printf_uxn_opcodes_h_l2031_c28_aa2b_uxn_opcodes_h_l2031_c28_aa2b_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_70dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_d542_return_output;
     VAR_printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_70dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c1_c6e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output;

     -- printf_uxn_opcodes_h_l2032_c28_8891[uxn_opcodes_h_l2032_c28_8891] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_arg0 <= VAR_printf_uxn_opcodes_h_l2032_c28_8891_uxn_opcodes_h_l2032_c28_8891_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c7_0d41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output;
     VAR_printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_c6e9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c7_fed1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c1_ca60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output;

     -- printf_uxn_opcodes_h_l2033_c28_344e[uxn_opcodes_h_l2033_c28_344e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_arg0 <= VAR_printf_uxn_opcodes_h_l2033_c28_344e_uxn_opcodes_h_l2033_c28_344e_arg0;
     -- Outputs

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output;
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_ca60_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c7_b85e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output;

     -- gth2[uxn_opcodes_h_l2034_c41_4fd1] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2034_c41_4fd1_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2034_c41_4fd1_phase <= VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_phase;
     gth2_uxn_opcodes_h_l2034_c41_4fd1_ins <= VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_ins;
     gth2_uxn_opcodes_h_l2034_c41_4fd1_pc <= VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_pc;
     gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_stack_read;
     gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_ram_read <= VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_previous_ram_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output := gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c1_ecb2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output;
     VAR_printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_ecb2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue := VAR_gth2_uxn_opcodes_h_l2034_c41_4fd1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c7_f6e9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c1_3691] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output;

     -- printf_uxn_opcodes_h_l2035_c28_c7e6[uxn_opcodes_h_l2035_c28_c7e6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_arg0 <= VAR_printf_uxn_opcodes_h_l2035_c28_c7e6_uxn_opcodes_h_l2035_c28_c7e6_arg0;
     -- Outputs

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output;
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_3691_return_output;
     -- lth2[uxn_opcodes_h_l2036_c41_5ba8] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2036_c41_5ba8_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2036_c41_5ba8_phase <= VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_phase;
     lth2_uxn_opcodes_h_l2036_c41_5ba8_ins <= VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_ins;
     lth2_uxn_opcodes_h_l2036_c41_5ba8_pc <= VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_pc;
     lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_stack_read;
     lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_ram_read <= VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_previous_ram_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output := lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c7_013b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c1_9168] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_013b_return_output;
     VAR_printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_9168_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue := VAR_lth2_uxn_opcodes_h_l2036_c41_5ba8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_fd48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c7_4c4f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output;

     -- printf_uxn_opcodes_h_l2037_c28_aa7e[uxn_opcodes_h_l2037_c28_aa7e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_arg0 <= VAR_printf_uxn_opcodes_h_l2037_c28_aa7e_uxn_opcodes_h_l2037_c28_aa7e_arg0;
     -- Outputs

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_fd48_return_output;
     -- jmp2[uxn_opcodes_h_l2038_c41_144d] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2038_c41_144d_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2038_c41_144d_phase <= VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_phase;
     jmp2_uxn_opcodes_h_l2038_c41_144d_ins <= VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_ins;
     jmp2_uxn_opcodes_h_l2038_c41_144d_pc <= VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_pc;
     jmp2_uxn_opcodes_h_l2038_c41_144d_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_previous_stack_read;
     jmp2_uxn_opcodes_h_l2038_c41_144d_previous_ram_read <= VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_previous_ram_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_return_output := jmp2_uxn_opcodes_h_l2038_c41_144d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c1_8042] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c7_21ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output;
     VAR_printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_8042_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue := VAR_jmp2_uxn_opcodes_h_l2038_c41_144d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c7_90e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output;

     -- printf_uxn_opcodes_h_l2039_c28_7e9f[uxn_opcodes_h_l2039_c28_7e9f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_arg0 <= VAR_printf_uxn_opcodes_h_l2039_c28_7e9f_uxn_opcodes_h_l2039_c28_7e9f_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_f2a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output;
     VAR_printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_f2a0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c7_2dfe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output;

     -- printf_uxn_opcodes_h_l2040_c28_234a[uxn_opcodes_h_l2040_c28_234a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_arg0 <= VAR_printf_uxn_opcodes_h_l2040_c28_234a_uxn_opcodes_h_l2040_c28_234a_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c1_321a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output;
     VAR_printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_321a_return_output;
     -- printf_uxn_opcodes_h_l2041_c28_fed8[uxn_opcodes_h_l2041_c28_fed8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_arg0 <= VAR_printf_uxn_opcodes_h_l2041_c28_fed8_uxn_opcodes_h_l2041_c28_fed8_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c7_80db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c1_daf5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_80db_return_output;
     VAR_printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_daf5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_52fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output;

     -- printf_uxn_opcodes_h_l2042_c28_61ac[uxn_opcodes_h_l2042_c28_61ac] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_arg0 <= VAR_printf_uxn_opcodes_h_l2042_c28_61ac_uxn_opcodes_h_l2042_c28_61ac_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c7_1953] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_1953_return_output;
     VAR_printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_52fd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c7_9cce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output;

     -- printf_uxn_opcodes_h_l2043_c28_dbd6[uxn_opcodes_h_l2043_c28_dbd6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_arg0 <= VAR_printf_uxn_opcodes_h_l2043_c28_dbd6_uxn_opcodes_h_l2043_c28_dbd6_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c1_2a34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output;
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_2a34_return_output;
     -- sth2[uxn_opcodes_h_l2044_c41_de4b] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2044_c41_de4b_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2044_c41_de4b_phase <= VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_phase;
     sth2_uxn_opcodes_h_l2044_c41_de4b_ins <= VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_ins;
     sth2_uxn_opcodes_h_l2044_c41_de4b_pc <= VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_pc;
     sth2_uxn_opcodes_h_l2044_c41_de4b_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_previous_stack_read;
     sth2_uxn_opcodes_h_l2044_c41_de4b_previous_ram_read <= VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_previous_ram_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_return_output := sth2_uxn_opcodes_h_l2044_c41_de4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_1962] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c7_efe6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output;
     VAR_printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1962_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue := VAR_sth2_uxn_opcodes_h_l2044_c41_de4b_return_output;
     -- printf_uxn_opcodes_h_l2045_c28_41b5[uxn_opcodes_h_l2045_c28_41b5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_arg0 <= VAR_printf_uxn_opcodes_h_l2045_c28_41b5_uxn_opcodes_h_l2045_c28_41b5_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c7_c988] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c1_9aa1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_c988_return_output;
     VAR_printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_9aa1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_9801] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output;

     -- printf_uxn_opcodes_h_l2046_c28_a9f2[uxn_opcodes_h_l2046_c28_a9f2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_arg0 <= VAR_printf_uxn_opcodes_h_l2046_c28_a9f2_uxn_opcodes_h_l2046_c28_a9f2_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c7_1524] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1524_return_output;
     VAR_printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_9801_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c7_cb45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_7cbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output;

     -- printf_uxn_opcodes_h_l2047_c28_a8cc[uxn_opcodes_h_l2047_c28_a8cc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_arg0 <= VAR_printf_uxn_opcodes_h_l2047_c28_a8cc_uxn_opcodes_h_l2047_c28_a8cc_arg0;
     -- Outputs

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output;
     VAR_printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_7cbf_return_output;
     -- printf_uxn_opcodes_h_l2048_c28_b580[uxn_opcodes_h_l2048_c28_b580] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_arg0 <= VAR_printf_uxn_opcodes_h_l2048_c28_b580_uxn_opcodes_h_l2048_c28_b580_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c7_e636] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c1_f364] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_e636_return_output;
     VAR_printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_f364_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c7_6988] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output;

     -- printf_uxn_opcodes_h_l2049_c28_41f1[uxn_opcodes_h_l2049_c28_41f1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_arg0 <= VAR_printf_uxn_opcodes_h_l2049_c28_41f1_uxn_opcodes_h_l2049_c28_41f1_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c1_6967] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6988_return_output;
     VAR_printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_6967_return_output;
     -- printf_uxn_opcodes_h_l2050_c28_f254[uxn_opcodes_h_l2050_c28_f254] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_arg0 <= VAR_printf_uxn_opcodes_h_l2050_c28_f254_uxn_opcodes_h_l2050_c28_f254_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c7_6bce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c1_60a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output;
     VAR_printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_60a8_return_output;
     -- printf_uxn_opcodes_h_l2051_c28_23f3[uxn_opcodes_h_l2051_c28_23f3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_arg0 <= VAR_printf_uxn_opcodes_h_l2051_c28_23f3_uxn_opcodes_h_l2051_c28_23f3_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c1_8d4a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c7_6947] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_6947_return_output;
     VAR_printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8d4a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c7_cc0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c1_6c56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output;

     -- printf_uxn_opcodes_h_l2052_c28_6391[uxn_opcodes_h_l2052_c28_6391] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_arg0 <= VAR_printf_uxn_opcodes_h_l2052_c28_6391_uxn_opcodes_h_l2052_c28_6391_arg0;
     -- Outputs

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output;
     VAR_printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_6c56_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c1_a9c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output;

     -- printf_uxn_opcodes_h_l2053_c28_b503[uxn_opcodes_h_l2053_c28_b503] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_arg0 <= VAR_printf_uxn_opcodes_h_l2053_c28_b503_uxn_opcodes_h_l2053_c28_b503_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c7_5ea8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output;
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_a9c2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c7_ad65] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_396c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output;

     -- lda2[uxn_opcodes_h_l2054_c41_f847] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2054_c41_f847_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2054_c41_f847_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2054_c41_f847_phase <= VAR_lda2_uxn_opcodes_h_l2054_c41_f847_phase;
     lda2_uxn_opcodes_h_l2054_c41_f847_ins <= VAR_lda2_uxn_opcodes_h_l2054_c41_f847_ins;
     lda2_uxn_opcodes_h_l2054_c41_f847_pc <= VAR_lda2_uxn_opcodes_h_l2054_c41_f847_pc;
     lda2_uxn_opcodes_h_l2054_c41_f847_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2054_c41_f847_previous_stack_read;
     lda2_uxn_opcodes_h_l2054_c41_f847_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2054_c41_f847_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2054_c41_f847_return_output := lda2_uxn_opcodes_h_l2054_c41_f847_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output;
     VAR_printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_396c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue := VAR_lda2_uxn_opcodes_h_l2054_c41_f847_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c7_a858] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output;

     -- printf_uxn_opcodes_h_l2055_c28_6792[uxn_opcodes_h_l2055_c28_6792] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_arg0 <= VAR_printf_uxn_opcodes_h_l2055_c28_6792_uxn_opcodes_h_l2055_c28_6792_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c1_a9b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_a858_return_output;
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_a9b3_return_output;
     -- sta2[uxn_opcodes_h_l2056_c41_0480] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2056_c41_0480_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2056_c41_0480_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2056_c41_0480_phase <= VAR_sta2_uxn_opcodes_h_l2056_c41_0480_phase;
     sta2_uxn_opcodes_h_l2056_c41_0480_ins <= VAR_sta2_uxn_opcodes_h_l2056_c41_0480_ins;
     sta2_uxn_opcodes_h_l2056_c41_0480_pc <= VAR_sta2_uxn_opcodes_h_l2056_c41_0480_pc;
     sta2_uxn_opcodes_h_l2056_c41_0480_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2056_c41_0480_previous_stack_read;
     sta2_uxn_opcodes_h_l2056_c41_0480_previous_ram_read <= VAR_sta2_uxn_opcodes_h_l2056_c41_0480_previous_ram_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2056_c41_0480_return_output := sta2_uxn_opcodes_h_l2056_c41_0480_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c1_4949] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c7_1930] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_1930_return_output;
     VAR_printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_4949_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue := VAR_sta2_uxn_opcodes_h_l2056_c41_0480_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c7_10aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c1_9429] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output;

     -- printf_uxn_opcodes_h_l2057_c28_f21d[uxn_opcodes_h_l2057_c28_f21d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_arg0 <= VAR_printf_uxn_opcodes_h_l2057_c28_f21d_uxn_opcodes_h_l2057_c28_f21d_arg0;
     -- Outputs

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output;
     VAR_printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_9429_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c7_0237] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c1_96bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output;

     -- printf_uxn_opcodes_h_l2058_c28_6117[uxn_opcodes_h_l2058_c28_6117] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_arg0 <= VAR_printf_uxn_opcodes_h_l2058_c28_6117_uxn_opcodes_h_l2058_c28_6117_arg0;
     -- Outputs

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_0237_return_output;
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_96bd_return_output;
     -- deo[uxn_opcodes_h_l2059_c41_c707] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2059_c41_c707_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2059_c41_c707_phase <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_phase;
     deo_uxn_opcodes_h_l2059_c41_c707_ins <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_ins;
     deo_uxn_opcodes_h_l2059_c41_c707_pc <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_pc;
     deo_uxn_opcodes_h_l2059_c41_c707_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_stack_read;
     deo_uxn_opcodes_h_l2059_c41_c707_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_ram_read;
     deo_uxn_opcodes_h_l2059_c41_c707_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2059_c41_c707_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2059_c41_c707_return_output := deo_uxn_opcodes_h_l2059_c41_c707_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c1_bdda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c7_5103] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_5103_return_output;
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_bdda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue := VAR_deo_uxn_opcodes_h_l2059_c41_c707_return_output;
     -- deo2[uxn_opcodes_h_l2060_c41_34cf] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2060_c41_34cf_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2060_c41_34cf_phase <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_phase;
     deo2_uxn_opcodes_h_l2060_c41_34cf_ins <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_ins;
     deo2_uxn_opcodes_h_l2060_c41_34cf_pc <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_pc;
     deo2_uxn_opcodes_h_l2060_c41_34cf_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_stack_read;
     deo2_uxn_opcodes_h_l2060_c41_34cf_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_ram_read;
     deo2_uxn_opcodes_h_l2060_c41_34cf_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_return_output := deo2_uxn_opcodes_h_l2060_c41_34cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c1_ea0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c7_b92f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output;
     VAR_printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_ea0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue := VAR_deo2_uxn_opcodes_h_l2060_c41_34cf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c7_ab1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c1_b068] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output;

     -- printf_uxn_opcodes_h_l2061_c28_fb23[uxn_opcodes_h_l2061_c28_fb23] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_arg0 <= VAR_printf_uxn_opcodes_h_l2061_c28_fb23_uxn_opcodes_h_l2061_c28_fb23_arg0;
     -- Outputs

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output;
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_b068_return_output;
     -- add2[uxn_opcodes_h_l2062_c41_bba2] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2062_c41_bba2_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2062_c41_bba2_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2062_c41_bba2_phase <= VAR_add2_uxn_opcodes_h_l2062_c41_bba2_phase;
     add2_uxn_opcodes_h_l2062_c41_bba2_ins <= VAR_add2_uxn_opcodes_h_l2062_c41_bba2_ins;
     add2_uxn_opcodes_h_l2062_c41_bba2_pc <= VAR_add2_uxn_opcodes_h_l2062_c41_bba2_pc;
     add2_uxn_opcodes_h_l2062_c41_bba2_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2062_c41_bba2_previous_stack_read;
     add2_uxn_opcodes_h_l2062_c41_bba2_previous_ram_read <= VAR_add2_uxn_opcodes_h_l2062_c41_bba2_previous_ram_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2062_c41_bba2_return_output := add2_uxn_opcodes_h_l2062_c41_bba2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c1_5219] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c7_8119] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8119_return_output;
     VAR_printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_5219_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue := VAR_add2_uxn_opcodes_h_l2062_c41_bba2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c1_3269] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output;

     -- printf_uxn_opcodes_h_l2063_c28_c913[uxn_opcodes_h_l2063_c28_c913] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_arg0 <= VAR_printf_uxn_opcodes_h_l2063_c28_c913_uxn_opcodes_h_l2063_c28_c913_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c7_c243] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_c243_return_output;
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_3269_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c1_c7bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c7_054e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output;

     -- sub2[uxn_opcodes_h_l2064_c41_3043] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2064_c41_3043_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2064_c41_3043_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2064_c41_3043_phase <= VAR_sub2_uxn_opcodes_h_l2064_c41_3043_phase;
     sub2_uxn_opcodes_h_l2064_c41_3043_ins <= VAR_sub2_uxn_opcodes_h_l2064_c41_3043_ins;
     sub2_uxn_opcodes_h_l2064_c41_3043_pc <= VAR_sub2_uxn_opcodes_h_l2064_c41_3043_pc;
     sub2_uxn_opcodes_h_l2064_c41_3043_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2064_c41_3043_previous_stack_read;
     sub2_uxn_opcodes_h_l2064_c41_3043_previous_ram_read <= VAR_sub2_uxn_opcodes_h_l2064_c41_3043_previous_ram_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2064_c41_3043_return_output := sub2_uxn_opcodes_h_l2064_c41_3043_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_054e_return_output;
     VAR_printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_c7bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue := VAR_sub2_uxn_opcodes_h_l2064_c41_3043_return_output;
     -- printf_uxn_opcodes_h_l2065_c28_7421[uxn_opcodes_h_l2065_c28_7421] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_arg0 <= VAR_printf_uxn_opcodes_h_l2065_c28_7421_uxn_opcodes_h_l2065_c28_7421_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c7_fcfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c1_b0d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output;
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_b0d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c7_96d9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output;

     -- mul2[uxn_opcodes_h_l2066_c41_271a] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2066_c41_271a_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2066_c41_271a_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2066_c41_271a_phase <= VAR_mul2_uxn_opcodes_h_l2066_c41_271a_phase;
     mul2_uxn_opcodes_h_l2066_c41_271a_ins <= VAR_mul2_uxn_opcodes_h_l2066_c41_271a_ins;
     mul2_uxn_opcodes_h_l2066_c41_271a_pc <= VAR_mul2_uxn_opcodes_h_l2066_c41_271a_pc;
     mul2_uxn_opcodes_h_l2066_c41_271a_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2066_c41_271a_previous_stack_read;
     mul2_uxn_opcodes_h_l2066_c41_271a_previous_ram_read <= VAR_mul2_uxn_opcodes_h_l2066_c41_271a_previous_ram_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2066_c41_271a_return_output := mul2_uxn_opcodes_h_l2066_c41_271a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c1_7d82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output;
     VAR_printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_7d82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue := VAR_mul2_uxn_opcodes_h_l2066_c41_271a_return_output;
     -- printf_uxn_opcodes_h_l2067_c28_7341[uxn_opcodes_h_l2067_c28_7341] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_arg0 <= VAR_printf_uxn_opcodes_h_l2067_c28_7341_uxn_opcodes_h_l2067_c28_7341_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c1_2ade] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c7_e1ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output;
     VAR_printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_2ade_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c1_e3c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c7_3e33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output;

     -- printf_uxn_opcodes_h_l2068_c28_df3b[uxn_opcodes_h_l2068_c28_df3b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_arg0 <= VAR_printf_uxn_opcodes_h_l2068_c28_df3b_uxn_opcodes_h_l2068_c28_df3b_arg0;
     -- Outputs

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output;
     VAR_printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_e3c9_return_output;
     -- printf_uxn_opcodes_h_l2069_c28_42cf[uxn_opcodes_h_l2069_c28_42cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_arg0 <= VAR_printf_uxn_opcodes_h_l2069_c28_42cf_uxn_opcodes_h_l2069_c28_42cf_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c7_be4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c1_2124] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output;
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_2124_return_output;
     -- and2[uxn_opcodes_h_l2070_c41_a5b5] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2070_c41_a5b5_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2070_c41_a5b5_phase <= VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_phase;
     and2_uxn_opcodes_h_l2070_c41_a5b5_ins <= VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_ins;
     and2_uxn_opcodes_h_l2070_c41_a5b5_pc <= VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_pc;
     and2_uxn_opcodes_h_l2070_c41_a5b5_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_previous_stack_read;
     and2_uxn_opcodes_h_l2070_c41_a5b5_previous_ram_read <= VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_previous_ram_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_return_output := and2_uxn_opcodes_h_l2070_c41_a5b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c7_b29b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_5e4c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output;
     VAR_printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_5e4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue := VAR_and2_uxn_opcodes_h_l2070_c41_a5b5_return_output;
     -- printf_uxn_opcodes_h_l2071_c28_51c4[uxn_opcodes_h_l2071_c28_51c4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_arg0 <= VAR_printf_uxn_opcodes_h_l2071_c28_51c4_uxn_opcodes_h_l2071_c28_51c4_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c7_e217] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c1_89da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_e217_return_output;
     VAR_printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_89da_return_output;
     -- printf_uxn_opcodes_h_l2072_c28_88a6[uxn_opcodes_h_l2072_c28_88a6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_arg0 <= VAR_printf_uxn_opcodes_h_l2072_c28_88a6_uxn_opcodes_h_l2072_c28_88a6_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c7_e94b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c1_d33d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output;
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d33d_return_output;
     -- eor[uxn_opcodes_h_l2073_c41_9778] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2073_c41_9778_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2073_c41_9778_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2073_c41_9778_phase <= VAR_eor_uxn_opcodes_h_l2073_c41_9778_phase;
     eor_uxn_opcodes_h_l2073_c41_9778_ins <= VAR_eor_uxn_opcodes_h_l2073_c41_9778_ins;
     eor_uxn_opcodes_h_l2073_c41_9778_pc <= VAR_eor_uxn_opcodes_h_l2073_c41_9778_pc;
     eor_uxn_opcodes_h_l2073_c41_9778_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2073_c41_9778_previous_stack_read;
     eor_uxn_opcodes_h_l2073_c41_9778_previous_ram_read <= VAR_eor_uxn_opcodes_h_l2073_c41_9778_previous_ram_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2073_c41_9778_return_output := eor_uxn_opcodes_h_l2073_c41_9778_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c7_8f47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c1_9afb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output;
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_9afb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue := VAR_eor_uxn_opcodes_h_l2073_c41_9778_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c1_0221] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c7_95e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output;

     -- eor2[uxn_opcodes_h_l2074_c41_453a] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2074_c41_453a_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2074_c41_453a_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2074_c41_453a_phase <= VAR_eor2_uxn_opcodes_h_l2074_c41_453a_phase;
     eor2_uxn_opcodes_h_l2074_c41_453a_ins <= VAR_eor2_uxn_opcodes_h_l2074_c41_453a_ins;
     eor2_uxn_opcodes_h_l2074_c41_453a_pc <= VAR_eor2_uxn_opcodes_h_l2074_c41_453a_pc;
     eor2_uxn_opcodes_h_l2074_c41_453a_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2074_c41_453a_previous_stack_read;
     eor2_uxn_opcodes_h_l2074_c41_453a_previous_ram_read <= VAR_eor2_uxn_opcodes_h_l2074_c41_453a_previous_ram_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2074_c41_453a_return_output := eor2_uxn_opcodes_h_l2074_c41_453a_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output;
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_0221_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue := VAR_eor2_uxn_opcodes_h_l2074_c41_453a_return_output;
     -- sft[uxn_opcodes_h_l2075_c41_4299] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2075_c41_4299_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2075_c41_4299_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2075_c41_4299_phase <= VAR_sft_uxn_opcodes_h_l2075_c41_4299_phase;
     sft_uxn_opcodes_h_l2075_c41_4299_ins <= VAR_sft_uxn_opcodes_h_l2075_c41_4299_ins;
     sft_uxn_opcodes_h_l2075_c41_4299_pc <= VAR_sft_uxn_opcodes_h_l2075_c41_4299_pc;
     sft_uxn_opcodes_h_l2075_c41_4299_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2075_c41_4299_previous_stack_read;
     sft_uxn_opcodes_h_l2075_c41_4299_previous_ram_read <= VAR_sft_uxn_opcodes_h_l2075_c41_4299_previous_ram_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2075_c41_4299_return_output := sft_uxn_opcodes_h_l2075_c41_4299_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c1_ba77] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c1_3f38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_3f38_return_output;
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_ba77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue := VAR_sft_uxn_opcodes_h_l2075_c41_4299_return_output;
     -- printf_uxn_opcodes_h_l2077_c9_24ce[uxn_opcodes_h_l2077_c9_24ce] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_arg0 <= VAR_printf_uxn_opcodes_h_l2077_c9_24ce_uxn_opcodes_h_l2077_c9_24ce_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2076_c41_671e] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2076_c41_671e_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2076_c41_671e_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2076_c41_671e_phase <= VAR_sft2_uxn_opcodes_h_l2076_c41_671e_phase;
     sft2_uxn_opcodes_h_l2076_c41_671e_ins <= VAR_sft2_uxn_opcodes_h_l2076_c41_671e_ins;
     sft2_uxn_opcodes_h_l2076_c41_671e_pc <= VAR_sft2_uxn_opcodes_h_l2076_c41_671e_pc;
     sft2_uxn_opcodes_h_l2076_c41_671e_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2076_c41_671e_previous_stack_read;
     sft2_uxn_opcodes_h_l2076_c41_671e_previous_ram_read <= VAR_sft2_uxn_opcodes_h_l2076_c41_671e_previous_ram_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2076_c41_671e_return_output := sft2_uxn_opcodes_h_l2076_c41_671e_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue := VAR_sft2_uxn_opcodes_h_l2076_c41_671e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2076_c7_95e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_cond;
     opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output := opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_95e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2075_c7_8f47] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_cond;
     opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output := opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_8f47_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2074_c7_e94b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_cond;
     opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output := opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_e94b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2073_c7_e217] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_cond;
     opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output := opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_e217_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2072_c7_b29b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_cond;
     opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output := opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_b29b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2071_c7_be4b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_cond;
     opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output := opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_be4b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2070_c7_3e33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_cond;
     opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output := opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_3e33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2069_c7_e1ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_cond;
     opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output := opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e1ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2068_c7_96d9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_cond;
     opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output := opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_96d9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2067_c7_fcfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_cond;
     opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output := opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_fcfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2066_c7_054e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_cond;
     opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output := opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_054e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2065_c7_c243] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_cond;
     opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output := opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_c243_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2064_c7_8119] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_cond;
     opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output := opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8119_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2063_c7_ab1e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_cond;
     opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output := opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_ab1e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2062_c7_b92f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_cond;
     opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output := opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_b92f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2061_c7_5103] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_cond;
     opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output := opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_5103_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2060_c7_0237] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_cond;
     opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output := opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_0237_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2059_c7_10aa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_cond;
     opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output := opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_10aa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2058_c7_1930] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_cond;
     opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output := opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_1930_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2057_c7_a858] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_cond;
     opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output := opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_a858_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2056_c7_ad65] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_cond;
     opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output := opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_ad65_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2055_c7_5ea8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_cond;
     opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output := opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_5ea8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2054_c7_cc0d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_cond;
     opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output := opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_cc0d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2053_c7_6947] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_cond;
     opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output := opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_6947_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2052_c7_6bce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_cond;
     opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output := opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_6bce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2051_c7_6988] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_cond;
     opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output := opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6988_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2050_c7_e636] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_cond;
     opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output := opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_e636_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2049_c7_cb45] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_cond;
     opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output := opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_cb45_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2048_c7_1524] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_cond;
     opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output := opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1524_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2047_c7_c988] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_cond;
     opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output := opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_c988_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2046_c7_efe6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_cond;
     opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output := opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_efe6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2045_c7_9cce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_cond;
     opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output := opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9cce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2044_c7_1953] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_cond;
     opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output := opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_1953_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2043_c7_80db] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_cond;
     opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output := opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_80db_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2042_c7_2dfe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_cond;
     opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output := opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_2dfe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2041_c7_90e4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_cond;
     opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output := opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_90e4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2040_c7_21ed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_cond;
     opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output := opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_21ed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2039_c7_4c4f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_cond;
     opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output := opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_4c4f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2038_c7_013b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_cond;
     opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output := opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_013b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2037_c7_f6e9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_cond;
     opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output := opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_f6e9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2036_c7_b85e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_cond;
     opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output := opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_b85e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2035_c7_fed1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_cond;
     opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output := opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_fed1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2034_c7_0d41] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_cond;
     opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output := opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_0d41_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2033_c7_d542] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_cond;
     opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output := opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_d542_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2032_c7_1686] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_cond;
     opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output := opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_1686_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2031_c7_afdc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_cond;
     opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output := opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_afdc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2030_c7_10f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_cond;
     opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output := opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_10f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2029_c7_7681] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_cond;
     opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output := opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_7681_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2028_c7_f1fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_cond;
     opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output := opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_f1fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2027_c7_1170] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_cond;
     opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output := opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_1170_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2026_c7_f7d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_cond;
     opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output := opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_f7d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2025_c7_b5b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_cond;
     opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output := opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_b5b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2024_c7_28f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output := opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_28f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2023_c7_eae0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_cond;
     opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output := opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_eae0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2022_c7_46ae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_cond;
     opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output := opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_46ae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2021_c7_f350] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_cond;
     opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output := opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_f350_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2020_c7_bdd9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_cond;
     opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output := opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_bdd9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2019_c7_ac34] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_cond;
     opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output := opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_ac34_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2018_c7_a423] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_cond;
     opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output := opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_a423_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2017_c7_175a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_cond;
     opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output := opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_175a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2016_c7_9764] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_cond;
     opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output := opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_9764_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2015_c7_4e5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_cond;
     opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output := opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_4e5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2014_c7_fa3d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_cond;
     opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output := opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_fa3d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2013_c7_b7b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_cond;
     opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output := opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_b7b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2012_c7_f22c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_cond;
     opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output := opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_f22c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2011_c7_3314] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_cond;
     opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output := opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_3314_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2010_c7_b401] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_cond;
     opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output := opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_b401_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2009_c7_bbcd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_cond;
     opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output := opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_bbcd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2008_c7_5684] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_cond;
     opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output := opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_5684_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2007_c2_85e9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_cond;
     opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output := opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2115_c3_a146] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2115_c3_a146_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2089_c82_d309] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_c82_d309_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2080_l2092_l2089_DUPLICATE_5fea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2080_l2092_l2089_DUPLICATE_5fea_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2130_c32_2365] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2130_c32_2365_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l2122_c23_4d2d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2122_c23_4d2d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l2090_c22_52e5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_52e5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_ed1a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_ed1a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l2118_c3_9adc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2118_c3_9adc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l2126_c30_e124] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2126_c30_e124_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l2087_c18_432e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_432e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2079_c6_ee81] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_ee81_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2121_c34_6e88] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2121_c34_6e88_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2124_c33_1400] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2124_c33_1400_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_ram_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l2129_c31_ab3a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2129_c31_ab3a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.vram_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2128_c33_04f6] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2128_c33_04f6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l2123_c32_1105] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2123_c32_1105_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2127_c34_68f5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2127_c34_68f5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2088_c19_00ca] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_00ca_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2081_l2083_DUPLICATE_d2ed LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2081_l2083_DUPLICATE_d2ed_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l2114_c3_046c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2114_c3_046c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.device_ram_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l2125_c29_057a] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2125_c29_057a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_85e9_return_output.ram_addr;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2081_l2083_DUPLICATE_d2ed_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2081_l2083_DUPLICATE_d2ed_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2118_c3_9adc_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2115_c3_a146_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_ee81_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_ee81_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2080_l2092_l2089_DUPLICATE_5fea_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_432e_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_432e_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_432e_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_00ca_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_00ca_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_00ca_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_ed1a_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_ed1a_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2114_c3_046c_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_c82_d309_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_52e5_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_52e5_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_52e5_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2083_c4_c1cf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_1215 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_1215_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2121_c34_6e88_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2122_c23_4d2d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2123_c32_1105_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2124_c33_1400_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2125_c29_057a_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2126_c30_e124_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2127_c34_68f5_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2128_c33_04f6_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2129_c31_ab3a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2130_c32_2365_return_output);

     -- device_ram_update[uxn_opcodes_h_l2112_c26_6378] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_address0 <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_address0;
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_value;
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_write0_enable;
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_read0_enable;
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_address1 <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_address1;
     device_ram_update_uxn_opcodes_h_l2112_c26_6378_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output := device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output;

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2081_c4_600b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l2081_c4_c7ff := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_600b_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2083_c4_b389 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_c1cf_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;
     VAR_MUX_uxn_opcodes_h_l2089_c19_faed_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_8982_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_1215_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_1215_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l2112_c2_8565 := resize(VAR_device_ram_update_uxn_opcodes_h_l2112_c26_6378_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l2112_c2_8565;
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse := VAR_sp0_uxn_opcodes_h_l2083_c4_b389;
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue := VAR_sp1_uxn_opcodes_h_l2081_c4_c7ff;
     -- sp0_MUX[uxn_opcodes_h_l2080_c3_d6cd] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond;
     sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue;
     sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output := sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c1_95b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2101_c1_82a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2080_c3_d6cd] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_cond;
     sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iftrue;
     sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output := sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_82a4_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_95b2_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_d6cd_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2079_c2_e930] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2079_c2_e930_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_cond;
     sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue;
     sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output := sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2079_c2_e930] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2079_c2_e930_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_cond;
     sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iftrue;
     sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output := sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l2089_c19_faed_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_e930_return_output;
     VAR_MUX_uxn_opcodes_h_l2089_c19_faed_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_e930_return_output;
     -- MUX[uxn_opcodes_h_l2089_c19_faed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2089_c19_faed_cond <= VAR_MUX_uxn_opcodes_h_l2089_c19_faed_cond;
     MUX_uxn_opcodes_h_l2089_c19_faed_iftrue <= VAR_MUX_uxn_opcodes_h_l2089_c19_faed_iftrue;
     MUX_uxn_opcodes_h_l2089_c19_faed_iffalse <= VAR_MUX_uxn_opcodes_h_l2089_c19_faed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2089_c19_faed_return_output := MUX_uxn_opcodes_h_l2089_c19_faed_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_left := VAR_MUX_uxn_opcodes_h_l2089_c19_faed_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2089_c19_e476] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l2089_c2_99df := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_e476_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2089_c2_99df;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_99df, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_99df, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_99df, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_99df, 8);
     -- stack_r_ram_update[uxn_opcodes_h_l2093_c22_d864] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address0;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_address1;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output := stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output;

     -- stack_w_ram_update[uxn_opcodes_h_l2102_c22_6fb3] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address0;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_address1;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output := stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l2093_c3_5623 := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_d864_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l2102_c3_7d3a := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_6fb3_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iftrue := VAR_stack_read_value_uxn_opcodes_h_l2093_c3_5623;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iffalse := VAR_stack_read_value_uxn_opcodes_h_l2102_c3_7d3a;
     -- stack_read_value_MUX[uxn_opcodes_h_l2092_c2_9750] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_cond;
     stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output := stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_9750_return_output;
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
