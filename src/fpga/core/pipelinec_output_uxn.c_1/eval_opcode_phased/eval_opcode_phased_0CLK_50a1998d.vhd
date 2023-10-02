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
-- BIN_OP_AND[uxn_opcodes_h_l2002_c10_17f5]
signal BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2002_c10_ed1d]
signal BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2002_c41_e63a]
signal BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2002_c57_2a94]
signal CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2002_c10_c31b]
signal MUX_uxn_opcodes_h_l2002_c10_c31b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2002_c10_c31b_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2002_c10_c31b_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2002_c10_c31b_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2003_c18_6ca9]
signal BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2003_c18_79e4]
signal BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2003_c18_1f82]
signal MUX_uxn_opcodes_h_l2003_c18_1f82_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2003_c18_1f82_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2003_c18_1f82_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2003_c18_1f82_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2005_c2_63fd[uxn_opcodes_h_l2005_c2_63fd]
signal printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2007_c6_20cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c7_35a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2007_c2_9281]
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_4a9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c1_bb7c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c7_0c6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2008_c7_35a8]
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2008_c41_cbac]
signal jci_uxn_opcodes_h_l2008_c41_cbac_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_cbac_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_cbac_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_cbac_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_cbac_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2008_c41_cbac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_8341]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c1_217a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c7_c1ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2009_c7_0c6d]
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2009_c41_fdab]
signal jmi_uxn_opcodes_h_l2009_c41_fdab_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_fdab_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_fdab_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_fdab_previous_stack_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_fdab_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2009_c41_fdab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_14a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c1_04ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c7_de34]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2010_c7_c1ff]
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2010_c41_8485]
signal jsi_uxn_opcodes_h_l2010_c41_8485_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_8485_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_8485_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_8485_previous_stack_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_8485_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2010_c41_8485_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2011_c11_36d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c1_ca59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c7_8c4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2011_c7_de34]
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2011_c41_1842]
signal lit_uxn_opcodes_h_l2011_c41_1842_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_1842_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_1842_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_1842_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_1842_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2011_c41_1842_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_3768]
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c1_3448]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c7_9cdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2012_c7_8c4e]
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2012_c41_94f0]
signal lit2_uxn_opcodes_h_l2012_c41_94f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_94f0_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_94f0_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_94f0_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_94f0_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2012_c41_94f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_62d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c1_993c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c7_75dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2013_c7_9cdd]
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2013_c41_8973]
signal lit_uxn_opcodes_h_l2013_c41_8973_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_8973_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_8973_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_8973_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_8973_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2013_c41_8973_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2014_c11_4205]
signal BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c1_5cf8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c7_c186]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2014_c7_75dd]
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2014_c41_7440]
signal lit2_uxn_opcodes_h_l2014_c41_7440_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_7440_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_7440_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_7440_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_7440_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2014_c41_7440_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_ce5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c1_4808]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c7_4c3c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2015_c7_c186]
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2015_c28_e058[uxn_opcodes_h_l2015_c28_e058]
signal printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_3d12]
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c1_ac39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c7_cf1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2016_c7_4c3c]
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2016_c41_a2fa]
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_pc : unsigned(15 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_ram_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_3405]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c1_51fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c7_e445]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2017_c7_cf1a]
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2017_c41_2602]
signal pop_uxn_opcodes_h_l2017_c41_2602_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_2602_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_2602_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_2602_pc : unsigned(15 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_2602_previous_stack_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_2602_previous_ram_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2017_c41_2602_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_bd18]
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c1_e54c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c7_f474]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2018_c7_e445]
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2018_c41_3191]
signal pop2_uxn_opcodes_h_l2018_c41_3191_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_3191_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_3191_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_3191_pc : unsigned(15 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_3191_previous_stack_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_3191_previous_ram_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2018_c41_3191_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_6d8a]
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c1_a664]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c7_3cd6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2019_c7_f474]
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2019_c41_2df4]
signal nip_uxn_opcodes_h_l2019_c41_2df4_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_2df4_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_2df4_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_2df4_pc : unsigned(15 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_2df4_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_2df4_previous_ram_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2019_c41_2df4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_9d5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c1_e4a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c7_1b63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2020_c7_3cd6]
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2020_c28_cf79[uxn_opcodes_h_l2020_c28_cf79]
signal printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_9ad1]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c1_5dea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c7_851d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2021_c7_1b63]
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2021_c41_7a0a]
signal swp_uxn_opcodes_h_l2021_c41_7a0a_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_7a0a_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_7a0a_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_7a0a_pc : unsigned(15 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_7a0a_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_7a0a_previous_ram_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2021_c41_7a0a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2022_c11_05af]
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c1_90e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c7_f361]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2022_c7_851d]
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2022_c41_5f76]
signal swp2_uxn_opcodes_h_l2022_c41_5f76_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_5f76_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_5f76_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_5f76_pc : unsigned(15 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_5f76_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_5f76_previous_ram_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2022_c41_5f76_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2023_c11_a6b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c1_ec8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c7_36cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2023_c7_f361]
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2023_c28_9aa9[uxn_opcodes_h_l2023_c28_9aa9]
signal printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_93da]
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c1_eaa0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c7_0235]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2024_c7_36cb]
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2024_c41_8b80]
signal rot2_uxn_opcodes_h_l2024_c41_8b80_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_8b80_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_8b80_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_8b80_pc : unsigned(15 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_8b80_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_8b80_previous_ram_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2024_c41_8b80_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_0d8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c1_61e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c7_c32c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2025_c7_0235]
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2025_c28_7ce3[uxn_opcodes_h_l2025_c28_7ce3]
signal printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_0f90]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c1_6fc1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c7_3a54]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2026_c7_c32c]
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2026_c41_e19d]
signal dup2_uxn_opcodes_h_l2026_c41_e19d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_e19d_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_e19d_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_e19d_pc : unsigned(15 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_e19d_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_e19d_previous_ram_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2026_c41_e19d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2027_c11_3a5f]
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c1_bbef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c7_1db2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2027_c7_3a54]
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2027_c28_0fab[uxn_opcodes_h_l2027_c28_0fab]
signal printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2028_c11_51fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c1_31a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c7_a616]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2028_c7_1db2]
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2028_c41_f771]
signal ovr2_uxn_opcodes_h_l2028_c41_f771_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_f771_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_f771_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_f771_pc : unsigned(15 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_f771_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_f771_previous_ram_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2028_c41_f771_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_1ce1]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c1_a124]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c7_8e7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2029_c7_a616]
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2029_c41_47f5]
signal equ_uxn_opcodes_h_l2029_c41_47f5_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_47f5_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_47f5_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_47f5_pc : unsigned(15 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_47f5_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_47f5_previous_ram_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2029_c41_47f5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_1017]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c1_0645]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c7_1e70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2030_c7_8e7e]
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2030_c41_b91c]
signal equ2_uxn_opcodes_h_l2030_c41_b91c_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_b91c_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_b91c_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_b91c_pc : unsigned(15 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_b91c_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_b91c_previous_ram_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2030_c41_b91c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_b392]
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_a7fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c7_dceb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2031_c7_1e70]
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2031_c28_fd0d[uxn_opcodes_h_l2031_c28_fd0d]
signal printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_2e36]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_9600]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c7_4e50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2032_c7_dceb]
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2032_c28_8173[uxn_opcodes_h_l2032_c28_8173]
signal printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_c9eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c1_5108]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c7_94a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2033_c7_4e50]
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2033_c28_f299[uxn_opcodes_h_l2033_c28_f299]
signal printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_cdf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c1_fb98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c7_2bd8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2034_c7_94a6]
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2034_c41_e485]
signal gth2_uxn_opcodes_h_l2034_c41_e485_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_e485_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_e485_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_e485_pc : unsigned(15 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_e485_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_e485_previous_ram_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2034_c41_e485_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_efbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c1_b482]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c7_9a94]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2035_c7_2bd8]
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2035_c28_612a[uxn_opcodes_h_l2035_c28_612a]
signal printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2036_c11_9955]
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c1_8be5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c7_c0cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2036_c7_9a94]
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2036_c41_8854]
signal lth2_uxn_opcodes_h_l2036_c41_8854_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_8854_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_8854_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_8854_pc : unsigned(15 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_8854_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_8854_previous_ram_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2036_c41_8854_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_36d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c1_fb36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c7_41b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2037_c7_c0cd]
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2037_c28_75f2[uxn_opcodes_h_l2037_c28_75f2]
signal printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_8e2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_d0f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c7_1924]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2038_c7_41b5]
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2038_c41_def1]
signal jmp2_uxn_opcodes_h_l2038_c41_def1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_def1_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_def1_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_def1_pc : unsigned(15 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_def1_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_def1_previous_ram_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2038_c41_def1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_be21]
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c1_0f1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c7_ca7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2039_c7_1924]
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2039_c28_2043[uxn_opcodes_h_l2039_c28_2043]
signal printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_6c74]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_8b00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c7_6ca3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2040_c7_ca7d]
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2040_c28_e512[uxn_opcodes_h_l2040_c28_e512]
signal printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_9956]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c1_996a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c7_e72a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2041_c7_6ca3]
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2041_c28_9a6b[uxn_opcodes_h_l2041_c28_9a6b]
signal printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_32e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c1_049b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c7_2f3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2042_c7_e72a]
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2042_c28_13b6[uxn_opcodes_h_l2042_c28_13b6]
signal printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_e456]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_164a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c7_35d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2043_c7_2f3a]
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2043_c28_a3ff[uxn_opcodes_h_l2043_c28_a3ff]
signal printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_fa7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c1_a8f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c7_d23c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2044_c7_35d6]
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2044_c41_3bc0]
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_pc : unsigned(15 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_ram_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_e70f]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_1943]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c7_bb81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2045_c7_d23c]
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2045_c28_529b[uxn_opcodes_h_l2045_c28_529b]
signal printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_5c93]
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c1_4205]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c7_a380]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2046_c7_bb81]
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2046_c28_2cd9[uxn_opcodes_h_l2046_c28_2cd9]
signal printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_3cac]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_07d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c7_8ee1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2047_c7_a380]
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2047_c28_2da9[uxn_opcodes_h_l2047_c28_2da9]
signal printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_5060]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_48be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c7_4290]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2048_c7_8ee1]
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2048_c28_1e3d[uxn_opcodes_h_l2048_c28_1e3d]
signal printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2049_c11_80c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c1_6263]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c7_b733]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2049_c7_4290]
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2049_c28_87db[uxn_opcodes_h_l2049_c28_87db]
signal printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_0447]
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c1_25f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c7_6612]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2050_c7_b733]
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2050_c28_4c89[uxn_opcodes_h_l2050_c28_4c89]
signal printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_ba71]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c1_dd0f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c7_286b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2051_c7_6612]
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2051_c28_94bf[uxn_opcodes_h_l2051_c28_94bf]
signal printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_d0d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c1_8c41]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c7_aeb7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2052_c7_286b]
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2052_c28_2602[uxn_opcodes_h_l2052_c28_2602]
signal printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_2566]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c1_5516]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c7_5884]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2053_c7_aeb7]
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2053_c28_fce6[uxn_opcodes_h_l2053_c28_fce6]
signal printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_a87e]
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c1_4b30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c7_939d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2054_c7_5884]
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2054_c41_3f71]
signal lda2_uxn_opcodes_h_l2054_c41_3f71_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_3f71_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_3f71_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_3f71_pc : unsigned(15 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_3f71_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_3f71_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2054_c41_3f71_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_cec3]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_2a1b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c7_90ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2055_c7_939d]
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2055_c28_d98a[uxn_opcodes_h_l2055_c28_d98a]
signal printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_e1a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c1_d20d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c7_5398]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2056_c7_90ba]
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2056_c41_5614]
signal sta2_uxn_opcodes_h_l2056_c41_5614_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_5614_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_5614_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_5614_pc : unsigned(15 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_5614_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_5614_previous_ram_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2056_c41_5614_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_60a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c1_1e6d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c7_e578]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2057_c7_5398]
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2057_c28_0670[uxn_opcodes_h_l2057_c28_0670]
signal printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_0235]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c1_b051]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c7_c9f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2058_c7_e578]
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2058_c28_b16d[uxn_opcodes_h_l2058_c28_b16d]
signal printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_7550]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c1_2905]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c7_c6f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2059_c7_c9f8]
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2059_c41_d225]
signal deo_uxn_opcodes_h_l2059_c41_d225_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_pc : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2059_c41_d225_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_fe5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c1_046f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c7_7aef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2060_c7_c6f9]
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2060_c41_721f]
signal deo2_uxn_opcodes_h_l2060_c41_721f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_pc : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2060_c41_721f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_2942]
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c1_1045]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c7_7637]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2061_c7_7aef]
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2061_c28_a9ba[uxn_opcodes_h_l2061_c28_a9ba]
signal printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_b918]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c1_6158]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c7_6b15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2062_c7_7637]
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2062_c41_0baf]
signal add2_uxn_opcodes_h_l2062_c41_0baf_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_0baf_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_0baf_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_0baf_pc : unsigned(15 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_0baf_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_0baf_previous_ram_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2062_c41_0baf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_7dfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c1_debe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c7_8c17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2063_c7_6b15]
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2063_c28_6d53[uxn_opcodes_h_l2063_c28_6d53]
signal printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_235d]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c1_9dcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c7_38e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2064_c7_8c17]
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2064_c41_5872]
signal sub2_uxn_opcodes_h_l2064_c41_5872_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_5872_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_5872_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_5872_pc : unsigned(15 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_5872_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_5872_previous_ram_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2064_c41_5872_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_8039]
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c1_2bfb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c7_eda8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2065_c7_38e5]
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2065_c28_749d[uxn_opcodes_h_l2065_c28_749d]
signal printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_e6a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c1_eea1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c7_025a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2066_c7_eda8]
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2066_c41_8b41]
signal mul2_uxn_opcodes_h_l2066_c41_8b41_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_8b41_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_8b41_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_8b41_pc : unsigned(15 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_8b41_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_8b41_previous_ram_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2066_c41_8b41_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_f22e]
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c1_6762]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c7_883c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2067_c7_025a]
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2067_c28_3de8[uxn_opcodes_h_l2067_c28_3de8]
signal printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_b0c7]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c1_c05f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c7_b7ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2068_c7_883c]
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2068_c28_f1e6[uxn_opcodes_h_l2068_c28_f1e6]
signal printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_6d30]
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c1_cc5e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c7_7cfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2069_c7_b7ac]
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2069_c28_5cb5[uxn_opcodes_h_l2069_c28_5cb5]
signal printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2070_c11_425f]
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c1_3738]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c7_6895]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2070_c7_7cfc]
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2070_c41_20c3]
signal and2_uxn_opcodes_h_l2070_c41_20c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_20c3_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_20c3_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_20c3_pc : unsigned(15 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_20c3_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_20c3_previous_ram_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2070_c41_20c3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_e0e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_1d51]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c7_d342]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2071_c7_6895]
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2071_c28_32ef[uxn_opcodes_h_l2071_c28_32ef]
signal printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_9a29]
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c1_54a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c7_bb72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2072_c7_d342]
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2072_c28_999d[uxn_opcodes_h_l2072_c28_999d]
signal printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_28ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c1_f239]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c7_8e8c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2073_c7_bb72]
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2073_c41_39c0]
signal eor_uxn_opcodes_h_l2073_c41_39c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_39c0_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_39c0_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_39c0_pc : unsigned(15 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_39c0_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_39c0_previous_ram_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2073_c41_39c0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_6f64]
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c1_376b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c7_7de3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2074_c7_8e8c]
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2074_c41_5baf]
signal eor2_uxn_opcodes_h_l2074_c41_5baf_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_5baf_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_5baf_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_5baf_pc : unsigned(15 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_5baf_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_5baf_previous_ram_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2074_c41_5baf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_a590]
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c1_2db2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c7_7f88]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2075_c7_7de3]
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2075_c41_3a50]
signal sft_uxn_opcodes_h_l2075_c41_3a50_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_3a50_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_3a50_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_3a50_pc : unsigned(15 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_3a50_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_3a50_previous_ram_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2075_c41_3a50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_e1dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c1_e393]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c1_58f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2076_c7_7f88]
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2076_c41_6336]
signal sft2_uxn_opcodes_h_l2076_c41_6336_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_6336_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_6336_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_6336_pc : unsigned(15 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_6336_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_6336_previous_ram_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2076_c41_6336_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2077_c9_7303[uxn_opcodes_h_l2077_c9_7303]
signal printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2079_c2_7cbc]
signal sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2079_c2_7cbc]
signal sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2080_c3_751a]
signal sp0_MUX_uxn_opcodes_h_l2080_c3_751a_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2080_c3_751a]
signal sp1_MUX_uxn_opcodes_h_l2080_c3_751a_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2081_c4_1ca4]
signal BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2083_c4_95da]
signal BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2089_c19_3df7]
signal MUX_uxn_opcodes_h_l2089_c19_3df7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2089_c19_3df7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2089_c19_3df7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2089_c19_3df7_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2089_c19_8a50]
signal BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c1_055f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2101_c1_9588]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l2092_c2_44d9]
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l2093_c22_06cb]
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l2102_c22_4e28]
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l2112_c26_e2c0]
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5
BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_left,
BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_right,
BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d
BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_left,
BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_right,
BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a
BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_left,
BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_right,
BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94
CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_x,
CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output);

-- MUX_uxn_opcodes_h_l2002_c10_c31b
MUX_uxn_opcodes_h_l2002_c10_c31b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2002_c10_c31b_cond,
MUX_uxn_opcodes_h_l2002_c10_c31b_iftrue,
MUX_uxn_opcodes_h_l2002_c10_c31b_iffalse,
MUX_uxn_opcodes_h_l2002_c10_c31b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9
BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_left,
BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_right,
BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4
BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_left,
BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_right,
BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output);

-- MUX_uxn_opcodes_h_l2003_c18_1f82
MUX_uxn_opcodes_h_l2003_c18_1f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2003_c18_1f82_cond,
MUX_uxn_opcodes_h_l2003_c18_1f82_iftrue,
MUX_uxn_opcodes_h_l2003_c18_1f82_iffalse,
MUX_uxn_opcodes_h_l2003_c18_1f82_return_output);

-- printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd
printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd : entity work.printf_uxn_opcodes_h_l2005_c2_63fd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg0,
printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg1,
printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2007_c2_9281
opc_result_MUX_uxn_opcodes_h_l2007_c2_9281 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_cond,
opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iftrue,
opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iffalse,
opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8
opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_cond,
opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output);

-- jci_uxn_opcodes_h_l2008_c41_cbac
jci_uxn_opcodes_h_l2008_c41_cbac : entity work.jci_0CLK_a538d920 port map (
clk,
jci_uxn_opcodes_h_l2008_c41_cbac_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2008_c41_cbac_phase,
jci_uxn_opcodes_h_l2008_c41_cbac_pc,
jci_uxn_opcodes_h_l2008_c41_cbac_previous_stack_read,
jci_uxn_opcodes_h_l2008_c41_cbac_previous_ram_read,
jci_uxn_opcodes_h_l2008_c41_cbac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d
opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond,
opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output);

-- jmi_uxn_opcodes_h_l2009_c41_fdab
jmi_uxn_opcodes_h_l2009_c41_fdab : entity work.jmi_0CLK_d14e7b0e port map (
clk,
jmi_uxn_opcodes_h_l2009_c41_fdab_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2009_c41_fdab_phase,
jmi_uxn_opcodes_h_l2009_c41_fdab_pc,
jmi_uxn_opcodes_h_l2009_c41_fdab_previous_stack_read,
jmi_uxn_opcodes_h_l2009_c41_fdab_previous_ram_read,
jmi_uxn_opcodes_h_l2009_c41_fdab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff
opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond,
opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output);

-- jsi_uxn_opcodes_h_l2010_c41_8485
jsi_uxn_opcodes_h_l2010_c41_8485 : entity work.jsi_0CLK_85c87c86 port map (
clk,
jsi_uxn_opcodes_h_l2010_c41_8485_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2010_c41_8485_phase,
jsi_uxn_opcodes_h_l2010_c41_8485_pc,
jsi_uxn_opcodes_h_l2010_c41_8485_previous_stack_read,
jsi_uxn_opcodes_h_l2010_c41_8485_previous_ram_read,
jsi_uxn_opcodes_h_l2010_c41_8485_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2011_c7_de34
opc_result_MUX_uxn_opcodes_h_l2011_c7_de34 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_cond,
opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue,
opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse,
opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output);

-- lit_uxn_opcodes_h_l2011_c41_1842
lit_uxn_opcodes_h_l2011_c41_1842 : entity work.lit_0CLK_0852fa80 port map (
clk,
lit_uxn_opcodes_h_l2011_c41_1842_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2011_c41_1842_phase,
lit_uxn_opcodes_h_l2011_c41_1842_pc,
lit_uxn_opcodes_h_l2011_c41_1842_previous_stack_read,
lit_uxn_opcodes_h_l2011_c41_1842_previous_ram_read,
lit_uxn_opcodes_h_l2011_c41_1842_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_left,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_right,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e
opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond,
opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output);

-- lit2_uxn_opcodes_h_l2012_c41_94f0
lit2_uxn_opcodes_h_l2012_c41_94f0 : entity work.lit2_0CLK_83f22136 port map (
clk,
lit2_uxn_opcodes_h_l2012_c41_94f0_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2012_c41_94f0_phase,
lit2_uxn_opcodes_h_l2012_c41_94f0_pc,
lit2_uxn_opcodes_h_l2012_c41_94f0_previous_stack_read,
lit2_uxn_opcodes_h_l2012_c41_94f0_previous_ram_read,
lit2_uxn_opcodes_h_l2012_c41_94f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd
opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond,
opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output);

-- lit_uxn_opcodes_h_l2013_c41_8973
lit_uxn_opcodes_h_l2013_c41_8973 : entity work.lit_0CLK_0852fa80 port map (
clk,
lit_uxn_opcodes_h_l2013_c41_8973_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2013_c41_8973_phase,
lit_uxn_opcodes_h_l2013_c41_8973_pc,
lit_uxn_opcodes_h_l2013_c41_8973_previous_stack_read,
lit_uxn_opcodes_h_l2013_c41_8973_previous_ram_read,
lit_uxn_opcodes_h_l2013_c41_8973_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_left,
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_right,
BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd
opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_cond,
opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output);

-- lit2_uxn_opcodes_h_l2014_c41_7440
lit2_uxn_opcodes_h_l2014_c41_7440 : entity work.lit2_0CLK_83f22136 port map (
clk,
lit2_uxn_opcodes_h_l2014_c41_7440_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2014_c41_7440_phase,
lit2_uxn_opcodes_h_l2014_c41_7440_pc,
lit2_uxn_opcodes_h_l2014_c41_7440_previous_stack_read,
lit2_uxn_opcodes_h_l2014_c41_7440_previous_ram_read,
lit2_uxn_opcodes_h_l2014_c41_7440_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2015_c7_c186
opc_result_MUX_uxn_opcodes_h_l2015_c7_c186 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_cond,
opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue,
opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse,
opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output);

-- printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058
printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058 : entity work.printf_uxn_opcodes_h_l2015_c28_e058_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_left,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_right,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c
opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond,
opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output);

-- inc2_uxn_opcodes_h_l2016_c41_a2fa
inc2_uxn_opcodes_h_l2016_c41_a2fa : entity work.inc2_0CLK_0852fa80 port map (
clk,
inc2_uxn_opcodes_h_l2016_c41_a2fa_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2016_c41_a2fa_phase,
inc2_uxn_opcodes_h_l2016_c41_a2fa_ins,
inc2_uxn_opcodes_h_l2016_c41_a2fa_pc,
inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_stack_read,
inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_ram_read,
inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a
opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond,
opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output);

-- pop_uxn_opcodes_h_l2017_c41_2602
pop_uxn_opcodes_h_l2017_c41_2602 : entity work.pop_0CLK_25d197a7 port map (
clk,
pop_uxn_opcodes_h_l2017_c41_2602_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2017_c41_2602_phase,
pop_uxn_opcodes_h_l2017_c41_2602_ins,
pop_uxn_opcodes_h_l2017_c41_2602_pc,
pop_uxn_opcodes_h_l2017_c41_2602_previous_stack_read,
pop_uxn_opcodes_h_l2017_c41_2602_previous_ram_read,
pop_uxn_opcodes_h_l2017_c41_2602_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_left,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_right,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2018_c7_e445
opc_result_MUX_uxn_opcodes_h_l2018_c7_e445 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_cond,
opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue,
opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse,
opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output);

-- pop2_uxn_opcodes_h_l2018_c41_3191
pop2_uxn_opcodes_h_l2018_c41_3191 : entity work.pop2_0CLK_25d197a7 port map (
clk,
pop2_uxn_opcodes_h_l2018_c41_3191_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2018_c41_3191_phase,
pop2_uxn_opcodes_h_l2018_c41_3191_ins,
pop2_uxn_opcodes_h_l2018_c41_3191_pc,
pop2_uxn_opcodes_h_l2018_c41_3191_previous_stack_read,
pop2_uxn_opcodes_h_l2018_c41_3191_previous_ram_read,
pop2_uxn_opcodes_h_l2018_c41_3191_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_left,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_right,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2019_c7_f474
opc_result_MUX_uxn_opcodes_h_l2019_c7_f474 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_cond,
opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue,
opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse,
opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output);

-- nip_uxn_opcodes_h_l2019_c41_2df4
nip_uxn_opcodes_h_l2019_c41_2df4 : entity work.nip_0CLK_4351dde2 port map (
clk,
nip_uxn_opcodes_h_l2019_c41_2df4_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2019_c41_2df4_phase,
nip_uxn_opcodes_h_l2019_c41_2df4_ins,
nip_uxn_opcodes_h_l2019_c41_2df4_pc,
nip_uxn_opcodes_h_l2019_c41_2df4_previous_stack_read,
nip_uxn_opcodes_h_l2019_c41_2df4_previous_ram_read,
nip_uxn_opcodes_h_l2019_c41_2df4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6
opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond,
opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output);

-- printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79
printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79 : entity work.printf_uxn_opcodes_h_l2020_c28_cf79_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63
opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_cond,
opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue,
opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse,
opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output);

-- swp_uxn_opcodes_h_l2021_c41_7a0a
swp_uxn_opcodes_h_l2021_c41_7a0a : entity work.swp_0CLK_a45e5d62 port map (
clk,
swp_uxn_opcodes_h_l2021_c41_7a0a_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2021_c41_7a0a_phase,
swp_uxn_opcodes_h_l2021_c41_7a0a_ins,
swp_uxn_opcodes_h_l2021_c41_7a0a_pc,
swp_uxn_opcodes_h_l2021_c41_7a0a_previous_stack_read,
swp_uxn_opcodes_h_l2021_c41_7a0a_previous_ram_read,
swp_uxn_opcodes_h_l2021_c41_7a0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_left,
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_right,
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2022_c7_851d
opc_result_MUX_uxn_opcodes_h_l2022_c7_851d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_cond,
opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output);

-- swp2_uxn_opcodes_h_l2022_c41_5f76
swp2_uxn_opcodes_h_l2022_c41_5f76 : entity work.swp2_0CLK_6f1dc0f8 port map (
clk,
swp2_uxn_opcodes_h_l2022_c41_5f76_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2022_c41_5f76_phase,
swp2_uxn_opcodes_h_l2022_c41_5f76_ins,
swp2_uxn_opcodes_h_l2022_c41_5f76_pc,
swp2_uxn_opcodes_h_l2022_c41_5f76_previous_stack_read,
swp2_uxn_opcodes_h_l2022_c41_5f76_previous_ram_read,
swp2_uxn_opcodes_h_l2022_c41_5f76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2023_c7_f361
opc_result_MUX_uxn_opcodes_h_l2023_c7_f361 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_cond,
opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue,
opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse,
opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output);

-- printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9
printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9 : entity work.printf_uxn_opcodes_h_l2023_c28_9aa9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_left,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_right,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb
opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_cond,
opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output);

-- rot2_uxn_opcodes_h_l2024_c41_8b80
rot2_uxn_opcodes_h_l2024_c41_8b80 : entity work.rot2_0CLK_113f14d9 port map (
clk,
rot2_uxn_opcodes_h_l2024_c41_8b80_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2024_c41_8b80_phase,
rot2_uxn_opcodes_h_l2024_c41_8b80_ins,
rot2_uxn_opcodes_h_l2024_c41_8b80_pc,
rot2_uxn_opcodes_h_l2024_c41_8b80_previous_stack_read,
rot2_uxn_opcodes_h_l2024_c41_8b80_previous_ram_read,
rot2_uxn_opcodes_h_l2024_c41_8b80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2025_c7_0235
opc_result_MUX_uxn_opcodes_h_l2025_c7_0235 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_cond,
opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue,
opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse,
opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output);

-- printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3
printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3 : entity work.printf_uxn_opcodes_h_l2025_c28_7ce3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c
opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_cond,
opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output);

-- dup2_uxn_opcodes_h_l2026_c41_e19d
dup2_uxn_opcodes_h_l2026_c41_e19d : entity work.dup2_0CLK_a05d6369 port map (
clk,
dup2_uxn_opcodes_h_l2026_c41_e19d_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2026_c41_e19d_phase,
dup2_uxn_opcodes_h_l2026_c41_e19d_ins,
dup2_uxn_opcodes_h_l2026_c41_e19d_pc,
dup2_uxn_opcodes_h_l2026_c41_e19d_previous_stack_read,
dup2_uxn_opcodes_h_l2026_c41_e19d_previous_ram_read,
dup2_uxn_opcodes_h_l2026_c41_e19d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_left,
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_right,
BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54
opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_cond,
opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue,
opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse,
opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output);

-- printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab
printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab : entity work.printf_uxn_opcodes_h_l2027_c28_0fab_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2
opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_cond,
opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output);

-- ovr2_uxn_opcodes_h_l2028_c41_f771
ovr2_uxn_opcodes_h_l2028_c41_f771 : entity work.ovr2_0CLK_57eb5902 port map (
clk,
ovr2_uxn_opcodes_h_l2028_c41_f771_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2028_c41_f771_phase,
ovr2_uxn_opcodes_h_l2028_c41_f771_ins,
ovr2_uxn_opcodes_h_l2028_c41_f771_pc,
ovr2_uxn_opcodes_h_l2028_c41_f771_previous_stack_read,
ovr2_uxn_opcodes_h_l2028_c41_f771_previous_ram_read,
ovr2_uxn_opcodes_h_l2028_c41_f771_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2029_c7_a616
opc_result_MUX_uxn_opcodes_h_l2029_c7_a616 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_cond,
opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue,
opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse,
opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output);

-- equ_uxn_opcodes_h_l2029_c41_47f5
equ_uxn_opcodes_h_l2029_c41_47f5 : entity work.equ_0CLK_67fe881f port map (
clk,
equ_uxn_opcodes_h_l2029_c41_47f5_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2029_c41_47f5_phase,
equ_uxn_opcodes_h_l2029_c41_47f5_ins,
equ_uxn_opcodes_h_l2029_c41_47f5_pc,
equ_uxn_opcodes_h_l2029_c41_47f5_previous_stack_read,
equ_uxn_opcodes_h_l2029_c41_47f5_previous_ram_read,
equ_uxn_opcodes_h_l2029_c41_47f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e
opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond,
opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output);

-- equ2_uxn_opcodes_h_l2030_c41_b91c
equ2_uxn_opcodes_h_l2030_c41_b91c : entity work.equ2_0CLK_5fcb251d port map (
clk,
equ2_uxn_opcodes_h_l2030_c41_b91c_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2030_c41_b91c_phase,
equ2_uxn_opcodes_h_l2030_c41_b91c_ins,
equ2_uxn_opcodes_h_l2030_c41_b91c_pc,
equ2_uxn_opcodes_h_l2030_c41_b91c_previous_stack_read,
equ2_uxn_opcodes_h_l2030_c41_b91c_previous_ram_read,
equ2_uxn_opcodes_h_l2030_c41_b91c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_left,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_right,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70
opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_cond,
opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue,
opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse,
opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output);

-- printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d
printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d : entity work.printf_uxn_opcodes_h_l2031_c28_fd0d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb
opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_cond,
opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output);

-- printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173
printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173 : entity work.printf_uxn_opcodes_h_l2032_c28_8173_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50
opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_cond,
opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue,
opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse,
opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output);

-- printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299
printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299 : entity work.printf_uxn_opcodes_h_l2033_c28_f299_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6
opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_cond,
opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output);

-- gth2_uxn_opcodes_h_l2034_c41_e485
gth2_uxn_opcodes_h_l2034_c41_e485 : entity work.gth2_0CLK_5fcb251d port map (
clk,
gth2_uxn_opcodes_h_l2034_c41_e485_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2034_c41_e485_phase,
gth2_uxn_opcodes_h_l2034_c41_e485_ins,
gth2_uxn_opcodes_h_l2034_c41_e485_pc,
gth2_uxn_opcodes_h_l2034_c41_e485_previous_stack_read,
gth2_uxn_opcodes_h_l2034_c41_e485_previous_ram_read,
gth2_uxn_opcodes_h_l2034_c41_e485_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8
opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond,
opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output);

-- printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a
printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a : entity work.printf_uxn_opcodes_h_l2035_c28_612a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_left,
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_right,
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94
opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_cond,
opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue,
opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse,
opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output);

-- lth2_uxn_opcodes_h_l2036_c41_8854
lth2_uxn_opcodes_h_l2036_c41_8854 : entity work.lth2_0CLK_5fcb251d port map (
clk,
lth2_uxn_opcodes_h_l2036_c41_8854_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2036_c41_8854_phase,
lth2_uxn_opcodes_h_l2036_c41_8854_ins,
lth2_uxn_opcodes_h_l2036_c41_8854_pc,
lth2_uxn_opcodes_h_l2036_c41_8854_previous_stack_read,
lth2_uxn_opcodes_h_l2036_c41_8854_previous_ram_read,
lth2_uxn_opcodes_h_l2036_c41_8854_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd
opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond,
opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output);

-- printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2
printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2 : entity work.printf_uxn_opcodes_h_l2037_c28_75f2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5
opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_cond,
opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output);

-- jmp2_uxn_opcodes_h_l2038_c41_def1
jmp2_uxn_opcodes_h_l2038_c41_def1 : entity work.jmp2_0CLK_06911bbe port map (
clk,
jmp2_uxn_opcodes_h_l2038_c41_def1_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2038_c41_def1_phase,
jmp2_uxn_opcodes_h_l2038_c41_def1_ins,
jmp2_uxn_opcodes_h_l2038_c41_def1_pc,
jmp2_uxn_opcodes_h_l2038_c41_def1_previous_stack_read,
jmp2_uxn_opcodes_h_l2038_c41_def1_previous_ram_read,
jmp2_uxn_opcodes_h_l2038_c41_def1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_left,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_right,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2039_c7_1924
opc_result_MUX_uxn_opcodes_h_l2039_c7_1924 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_cond,
opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue,
opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse,
opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output);

-- printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043
printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043 : entity work.printf_uxn_opcodes_h_l2039_c28_2043_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d
opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond,
opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output);

-- printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512
printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512 : entity work.printf_uxn_opcodes_h_l2040_c28_e512_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3
opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond,
opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output);

-- printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b
printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b : entity work.printf_uxn_opcodes_h_l2041_c28_9a6b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a
opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_cond,
opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output);

-- printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6
printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6 : entity work.printf_uxn_opcodes_h_l2042_c28_13b6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a
opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond,
opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output);

-- printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff
printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff : entity work.printf_uxn_opcodes_h_l2043_c28_a3ff_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6
opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_cond,
opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output);

-- sth2_uxn_opcodes_h_l2044_c41_3bc0
sth2_uxn_opcodes_h_l2044_c41_3bc0 : entity work.sth2_0CLK_9c3c4e32 port map (
clk,
sth2_uxn_opcodes_h_l2044_c41_3bc0_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2044_c41_3bc0_phase,
sth2_uxn_opcodes_h_l2044_c41_3bc0_ins,
sth2_uxn_opcodes_h_l2044_c41_3bc0_pc,
sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_stack_read,
sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_ram_read,
sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c
opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_cond,
opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output);

-- printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b
printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b : entity work.printf_uxn_opcodes_h_l2045_c28_529b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_left,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_right,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81
opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_cond,
opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue,
opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse,
opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output);

-- printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9
printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9 : entity work.printf_uxn_opcodes_h_l2046_c28_2cd9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2047_c7_a380
opc_result_MUX_uxn_opcodes_h_l2047_c7_a380 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_cond,
opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue,
opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse,
opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output);

-- printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9
printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9 : entity work.printf_uxn_opcodes_h_l2047_c28_2da9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1
opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond,
opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output);

-- printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d
printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d : entity work.printf_uxn_opcodes_h_l2048_c28_1e3d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2049_c7_4290
opc_result_MUX_uxn_opcodes_h_l2049_c7_4290 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_cond,
opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue,
opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse,
opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output);

-- printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db
printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db : entity work.printf_uxn_opcodes_h_l2049_c28_87db_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_left,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_right,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2050_c7_b733
opc_result_MUX_uxn_opcodes_h_l2050_c7_b733 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_cond,
opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue,
opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse,
opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output);

-- printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89
printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89 : entity work.printf_uxn_opcodes_h_l2050_c28_4c89_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2051_c7_6612
opc_result_MUX_uxn_opcodes_h_l2051_c7_6612 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_cond,
opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue,
opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse,
opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output);

-- printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf
printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf : entity work.printf_uxn_opcodes_h_l2051_c28_94bf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2052_c7_286b
opc_result_MUX_uxn_opcodes_h_l2052_c7_286b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_cond,
opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output);

-- printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602
printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602 : entity work.printf_uxn_opcodes_h_l2052_c28_2602_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7
opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond,
opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output);

-- printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6
printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6 : entity work.printf_uxn_opcodes_h_l2053_c28_fce6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_left,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_right,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2054_c7_5884
opc_result_MUX_uxn_opcodes_h_l2054_c7_5884 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_cond,
opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue,
opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse,
opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output);

-- lda2_uxn_opcodes_h_l2054_c41_3f71
lda2_uxn_opcodes_h_l2054_c41_3f71 : entity work.lda2_0CLK_084aa6da port map (
clk,
lda2_uxn_opcodes_h_l2054_c41_3f71_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2054_c41_3f71_phase,
lda2_uxn_opcodes_h_l2054_c41_3f71_ins,
lda2_uxn_opcodes_h_l2054_c41_3f71_pc,
lda2_uxn_opcodes_h_l2054_c41_3f71_previous_stack_read,
lda2_uxn_opcodes_h_l2054_c41_3f71_previous_ram_read,
lda2_uxn_opcodes_h_l2054_c41_3f71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2055_c7_939d
opc_result_MUX_uxn_opcodes_h_l2055_c7_939d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_cond,
opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output);

-- printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a
printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a : entity work.printf_uxn_opcodes_h_l2055_c28_d98a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba
opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_cond,
opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output);

-- sta2_uxn_opcodes_h_l2056_c41_5614
sta2_uxn_opcodes_h_l2056_c41_5614 : entity work.sta2_0CLK_df540198 port map (
clk,
sta2_uxn_opcodes_h_l2056_c41_5614_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2056_c41_5614_phase,
sta2_uxn_opcodes_h_l2056_c41_5614_ins,
sta2_uxn_opcodes_h_l2056_c41_5614_pc,
sta2_uxn_opcodes_h_l2056_c41_5614_previous_stack_read,
sta2_uxn_opcodes_h_l2056_c41_5614_previous_ram_read,
sta2_uxn_opcodes_h_l2056_c41_5614_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2057_c7_5398
opc_result_MUX_uxn_opcodes_h_l2057_c7_5398 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_cond,
opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue,
opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse,
opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output);

-- printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670
printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670 : entity work.printf_uxn_opcodes_h_l2057_c28_0670_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2058_c7_e578
opc_result_MUX_uxn_opcodes_h_l2058_c7_e578 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_cond,
opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue,
opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse,
opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output);

-- printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d
printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d : entity work.printf_uxn_opcodes_h_l2058_c28_b16d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8
opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond,
opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output);

-- deo_uxn_opcodes_h_l2059_c41_d225
deo_uxn_opcodes_h_l2059_c41_d225 : entity work.deo_0CLK_feda93f5 port map (
clk,
deo_uxn_opcodes_h_l2059_c41_d225_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2059_c41_d225_phase,
deo_uxn_opcodes_h_l2059_c41_d225_ins,
deo_uxn_opcodes_h_l2059_c41_d225_pc,
deo_uxn_opcodes_h_l2059_c41_d225_previous_stack_read,
deo_uxn_opcodes_h_l2059_c41_d225_previous_ram_read,
deo_uxn_opcodes_h_l2059_c41_d225_previous_device_ram_read,
deo_uxn_opcodes_h_l2059_c41_d225_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9
opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond,
opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output);

-- deo2_uxn_opcodes_h_l2060_c41_721f
deo2_uxn_opcodes_h_l2060_c41_721f : entity work.deo2_0CLK_29335e8f port map (
clk,
deo2_uxn_opcodes_h_l2060_c41_721f_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2060_c41_721f_phase,
deo2_uxn_opcodes_h_l2060_c41_721f_ins,
deo2_uxn_opcodes_h_l2060_c41_721f_pc,
deo2_uxn_opcodes_h_l2060_c41_721f_previous_stack_read,
deo2_uxn_opcodes_h_l2060_c41_721f_previous_ram_read,
deo2_uxn_opcodes_h_l2060_c41_721f_previous_device_ram_read,
deo2_uxn_opcodes_h_l2060_c41_721f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_left,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_right,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef
opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_cond,
opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output);

-- printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba
printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba : entity work.printf_uxn_opcodes_h_l2061_c28_a9ba_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2062_c7_7637
opc_result_MUX_uxn_opcodes_h_l2062_c7_7637 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_cond,
opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue,
opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse,
opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output);

-- add2_uxn_opcodes_h_l2062_c41_0baf
add2_uxn_opcodes_h_l2062_c41_0baf : entity work.add2_0CLK_b14a5a36 port map (
clk,
add2_uxn_opcodes_h_l2062_c41_0baf_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2062_c41_0baf_phase,
add2_uxn_opcodes_h_l2062_c41_0baf_ins,
add2_uxn_opcodes_h_l2062_c41_0baf_pc,
add2_uxn_opcodes_h_l2062_c41_0baf_previous_stack_read,
add2_uxn_opcodes_h_l2062_c41_0baf_previous_ram_read,
add2_uxn_opcodes_h_l2062_c41_0baf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15
opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_cond,
opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue,
opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse,
opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output);

-- printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53
printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53 : entity work.printf_uxn_opcodes_h_l2063_c28_6d53_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17
opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_cond,
opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output);

-- sub2_uxn_opcodes_h_l2064_c41_5872
sub2_uxn_opcodes_h_l2064_c41_5872 : entity work.sub2_0CLK_b14a5a36 port map (
clk,
sub2_uxn_opcodes_h_l2064_c41_5872_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2064_c41_5872_phase,
sub2_uxn_opcodes_h_l2064_c41_5872_ins,
sub2_uxn_opcodes_h_l2064_c41_5872_pc,
sub2_uxn_opcodes_h_l2064_c41_5872_previous_stack_read,
sub2_uxn_opcodes_h_l2064_c41_5872_previous_ram_read,
sub2_uxn_opcodes_h_l2064_c41_5872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_left,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_right,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5
opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_cond,
opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output);

-- printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d
printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d : entity work.printf_uxn_opcodes_h_l2065_c28_749d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8
opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_cond,
opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output);

-- mul2_uxn_opcodes_h_l2066_c41_8b41
mul2_uxn_opcodes_h_l2066_c41_8b41 : entity work.mul2_0CLK_b14a5a36 port map (
clk,
mul2_uxn_opcodes_h_l2066_c41_8b41_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2066_c41_8b41_phase,
mul2_uxn_opcodes_h_l2066_c41_8b41_ins,
mul2_uxn_opcodes_h_l2066_c41_8b41_pc,
mul2_uxn_opcodes_h_l2066_c41_8b41_previous_stack_read,
mul2_uxn_opcodes_h_l2066_c41_8b41_previous_ram_read,
mul2_uxn_opcodes_h_l2066_c41_8b41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_left,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_right,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2067_c7_025a
opc_result_MUX_uxn_opcodes_h_l2067_c7_025a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_cond,
opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output);

-- printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8
printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8 : entity work.printf_uxn_opcodes_h_l2067_c28_3de8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2068_c7_883c
opc_result_MUX_uxn_opcodes_h_l2068_c7_883c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_cond,
opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output);

-- printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6
printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6 : entity work.printf_uxn_opcodes_h_l2068_c28_f1e6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_left,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_right,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac
opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond,
opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output);

-- printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5
printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5 : entity work.printf_uxn_opcodes_h_l2069_c28_5cb5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_left,
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_right,
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc
opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond,
opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output);

-- and2_uxn_opcodes_h_l2070_c41_20c3
and2_uxn_opcodes_h_l2070_c41_20c3 : entity work.and2_0CLK_b14a5a36 port map (
clk,
and2_uxn_opcodes_h_l2070_c41_20c3_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2070_c41_20c3_phase,
and2_uxn_opcodes_h_l2070_c41_20c3_ins,
and2_uxn_opcodes_h_l2070_c41_20c3_pc,
and2_uxn_opcodes_h_l2070_c41_20c3_previous_stack_read,
and2_uxn_opcodes_h_l2070_c41_20c3_previous_ram_read,
and2_uxn_opcodes_h_l2070_c41_20c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2071_c7_6895
opc_result_MUX_uxn_opcodes_h_l2071_c7_6895 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_cond,
opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue,
opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse,
opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output);

-- printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef
printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef : entity work.printf_uxn_opcodes_h_l2071_c28_32ef_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_left,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_right,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2072_c7_d342
opc_result_MUX_uxn_opcodes_h_l2072_c7_d342 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_cond,
opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue,
opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse,
opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output);

-- printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d
printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d : entity work.printf_uxn_opcodes_h_l2072_c28_999d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72
opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_cond,
opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue,
opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse,
opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output);

-- eor_uxn_opcodes_h_l2073_c41_39c0
eor_uxn_opcodes_h_l2073_c41_39c0 : entity work.eor_0CLK_06911bbe port map (
clk,
eor_uxn_opcodes_h_l2073_c41_39c0_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2073_c41_39c0_phase,
eor_uxn_opcodes_h_l2073_c41_39c0_ins,
eor_uxn_opcodes_h_l2073_c41_39c0_pc,
eor_uxn_opcodes_h_l2073_c41_39c0_previous_stack_read,
eor_uxn_opcodes_h_l2073_c41_39c0_previous_ram_read,
eor_uxn_opcodes_h_l2073_c41_39c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_left,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_right,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c
opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond,
opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output);

-- eor2_uxn_opcodes_h_l2074_c41_5baf
eor2_uxn_opcodes_h_l2074_c41_5baf : entity work.eor2_0CLK_b14a5a36 port map (
clk,
eor2_uxn_opcodes_h_l2074_c41_5baf_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2074_c41_5baf_phase,
eor2_uxn_opcodes_h_l2074_c41_5baf_ins,
eor2_uxn_opcodes_h_l2074_c41_5baf_pc,
eor2_uxn_opcodes_h_l2074_c41_5baf_previous_stack_read,
eor2_uxn_opcodes_h_l2074_c41_5baf_previous_ram_read,
eor2_uxn_opcodes_h_l2074_c41_5baf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_left,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_right,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3
opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_cond,
opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output);

-- sft_uxn_opcodes_h_l2075_c41_3a50
sft_uxn_opcodes_h_l2075_c41_3a50 : entity work.sft_0CLK_0d42d320 port map (
clk,
sft_uxn_opcodes_h_l2075_c41_3a50_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2075_c41_3a50_phase,
sft_uxn_opcodes_h_l2075_c41_3a50_ins,
sft_uxn_opcodes_h_l2075_c41_3a50_pc,
sft_uxn_opcodes_h_l2075_c41_3a50_previous_stack_read,
sft_uxn_opcodes_h_l2075_c41_3a50_previous_ram_read,
sft_uxn_opcodes_h_l2075_c41_3a50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88
opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_cond,
opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue,
opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse,
opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output);

-- sft2_uxn_opcodes_h_l2076_c41_6336
sft2_uxn_opcodes_h_l2076_c41_6336 : entity work.sft2_0CLK_51ffd248 port map (
clk,
sft2_uxn_opcodes_h_l2076_c41_6336_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2076_c41_6336_phase,
sft2_uxn_opcodes_h_l2076_c41_6336_ins,
sft2_uxn_opcodes_h_l2076_c41_6336_pc,
sft2_uxn_opcodes_h_l2076_c41_6336_previous_stack_read,
sft2_uxn_opcodes_h_l2076_c41_6336_previous_ram_read,
sft2_uxn_opcodes_h_l2076_c41_6336_return_output);

-- printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303
printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303 : entity work.printf_uxn_opcodes_h_l2077_c9_7303_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_arg0);

-- sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc
sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond,
sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue,
sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse,
sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output);

-- sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc
sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond,
sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue,
sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse,
sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output);

-- sp0_MUX_uxn_opcodes_h_l2080_c3_751a
sp0_MUX_uxn_opcodes_h_l2080_c3_751a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2080_c3_751a_cond,
sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue,
sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse,
sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output);

-- sp1_MUX_uxn_opcodes_h_l2080_c3_751a
sp1_MUX_uxn_opcodes_h_l2080_c3_751a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2080_c3_751a_cond,
sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue,
sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse,
sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_left,
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_right,
BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_left,
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_right,
BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output);

-- MUX_uxn_opcodes_h_l2089_c19_3df7
MUX_uxn_opcodes_h_l2089_c19_3df7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2089_c19_3df7_cond,
MUX_uxn_opcodes_h_l2089_c19_3df7_iftrue,
MUX_uxn_opcodes_h_l2089_c19_3df7_iffalse,
MUX_uxn_opcodes_h_l2089_c19_3df7_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_left,
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_right,
BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_cond,
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address0,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_value,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address1,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28 : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address0,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_value,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address1,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output);

-- device_ram_update_uxn_opcodes_h_l2112_c26_e2c0
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address0,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_value,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_enable,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read0_enable,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address1,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read1_enable,
device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output,
 CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output,
 MUX_uxn_opcodes_h_l2002_c10_c31b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output,
 MUX_uxn_opcodes_h_l2003_c18_1f82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output,
 jci_uxn_opcodes_h_l2008_c41_cbac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output,
 jmi_uxn_opcodes_h_l2009_c41_fdab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output,
 opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output,
 jsi_uxn_opcodes_h_l2010_c41_8485_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output,
 lit_uxn_opcodes_h_l2011_c41_1842_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output,
 lit2_uxn_opcodes_h_l2012_c41_94f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output,
 lit_uxn_opcodes_h_l2013_c41_8973_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output,
 opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output,
 lit2_uxn_opcodes_h_l2014_c41_7440_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output,
 inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output,
 opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output,
 pop_uxn_opcodes_h_l2017_c41_2602_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output,
 opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output,
 pop2_uxn_opcodes_h_l2018_c41_3191_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output,
 nip_uxn_opcodes_h_l2019_c41_2df4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output,
 opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output,
 swp_uxn_opcodes_h_l2021_c41_7a0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output,
 opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output,
 swp2_uxn_opcodes_h_l2022_c41_5f76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output,
 opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output,
 rot2_uxn_opcodes_h_l2024_c41_8b80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output,
 opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output,
 dup2_uxn_opcodes_h_l2026_c41_e19d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output,
 opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output,
 ovr2_uxn_opcodes_h_l2028_c41_f771_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output,
 equ_uxn_opcodes_h_l2029_c41_47f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output,
 opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output,
 equ2_uxn_opcodes_h_l2030_c41_b91c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output,
 opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output,
 gth2_uxn_opcodes_h_l2034_c41_e485_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output,
 opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output,
 lth2_uxn_opcodes_h_l2036_c41_8854_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output,
 opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output,
 jmp2_uxn_opcodes_h_l2038_c41_def1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output,
 sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output,
 opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output,
 opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output,
 opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output,
 opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output,
 opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output,
 opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output,
 lda2_uxn_opcodes_h_l2054_c41_3f71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output,
 opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output,
 sta2_uxn_opcodes_h_l2056_c41_5614_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output,
 opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output,
 deo_uxn_opcodes_h_l2059_c41_d225_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output,
 deo2_uxn_opcodes_h_l2060_c41_721f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output,
 opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output,
 opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output,
 add2_uxn_opcodes_h_l2062_c41_0baf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output,
 opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output,
 sub2_uxn_opcodes_h_l2064_c41_5872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output,
 mul2_uxn_opcodes_h_l2066_c41_8b41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output,
 opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output,
 and2_uxn_opcodes_h_l2070_c41_20c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output,
 opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output,
 opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output,
 eor_uxn_opcodes_h_l2073_c41_39c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output,
 eor2_uxn_opcodes_h_l2074_c41_5baf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output,
 opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output,
 sft_uxn_opcodes_h_l2075_c41_3a50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output,
 sft2_uxn_opcodes_h_l2076_c41_6336_return_output,
 sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output,
 sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output,
 sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output,
 sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output,
 MUX_uxn_opcodes_h_l2089_c19_3df7_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output,
 stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output,
 stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output,
 device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2002_c2_0ae5 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c30_902a_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c57_d35d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2007_c2_9281_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_cbac_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_cbac_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_cbac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_cbac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_cbac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2008_c41_cbac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_8485_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_8485_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_8485_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_8485_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_8485_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2010_c41_8485_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_1842_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_1842_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_1842_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_1842_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_1842_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2011_c41_1842_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_8973_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_8973_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_8973_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_8973_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_8973_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2013_c41_8973_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_7440_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_7440_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_7440_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_7440_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_7440_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2014_c41_7440_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2015_c7_c186_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_pc : unsigned(15 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_ram_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_pc : unsigned(15 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2017_c41_2602_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_pc : unsigned(15 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2018_c41_3191_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_pc : unsigned(15 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2019_c41_2df4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2020_c7_3cd6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_pc : unsigned(15 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_pc : unsigned(15 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2023_c7_f361_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_pc : unsigned(15 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_previous_ram_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2025_c7_0235_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_pc : unsigned(15 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2027_c7_3a54_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_pc : unsigned(15 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_pc : unsigned(15 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2029_c41_47f5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_pc : unsigned(15 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2031_c7_1e70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2032_c7_dceb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2033_c7_4e50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_pc : unsigned(15 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_previous_ram_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2034_c41_e485_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2035_c7_2bd8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_pc : unsigned(15 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2036_c41_8854_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2037_c7_c0cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_pc : unsigned(15 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2039_c7_1924_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2040_c7_ca7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2041_c7_6ca3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2042_c7_e72a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2043_c7_2f3a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_pc : unsigned(15 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_d23c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2046_c7_bb81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_a380_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2048_c7_8ee1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_4290_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2050_c7_b733_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2051_c7_6612_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2052_c7_286b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2053_c7_aeb7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_pc : unsigned(15 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_939d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_pc : unsigned(15 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2056_c41_5614_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_5398_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2058_c7_e578_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_pc : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2059_c41_d225_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_pc : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2060_c41_721f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_7aef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_pc : unsigned(15 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2062_c41_0baf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_6b15_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_pc : unsigned(15 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2064_c41_5872_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_38e5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_pc : unsigned(15 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_previous_ram_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_025a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_883c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_b7ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_pc : unsigned(15 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2070_c41_20c3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_6895_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_d342_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_pc : unsigned(15 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2073_c41_39c0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_pc : unsigned(15 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_pc : unsigned(15 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2075_c41_3a50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_pc : unsigned(15 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2076_c41_6336_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_51f2_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2083_c4_cee1 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2081_c4_28c2 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_8616_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_8b3b_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_c82_aa30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_57ad_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2093_c3_5b08 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2102_c3_4c68 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l2112_c2_4004 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2114_c3_97e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2115_c3_b816_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2118_c3_510d_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2121_c34_796b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2122_c23_6f5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2123_c32_1edd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2124_c33_1ed1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2125_c29_164e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2126_c30_48df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2127_c34_8f83_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2128_c33_65f4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2129_c31_d413_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2130_c32_6cf5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_b002_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2083_l2081_DUPLICATE_2c90_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_57f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_bff1_return_output : eval_opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_right := to_unsigned(51, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_right := to_unsigned(3072, 12);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_right := to_unsigned(52, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_right := to_unsigned(2048, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_right := to_unsigned(1536, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_right := to_unsigned(22, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iffalse := to_unsigned(0, 1);
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_right := to_unsigned(37, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_right := to_unsigned(7, 3);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_right := to_unsigned(26, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_right := to_unsigned(39, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse := opc_result;
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_pc := VAR_pc;
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_pc := VAR_pc;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_pc := VAR_pc;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_pc := VAR_pc;
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_pc := VAR_pc;
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_pc := VAR_pc;
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_pc := VAR_pc;
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_pc := VAR_pc;
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_pc := VAR_pc;
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_pc := VAR_pc;
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_pc := VAR_pc;
     VAR_jci_uxn_opcodes_h_l2008_c41_cbac_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_pc := VAR_pc;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2010_c41_8485_pc := VAR_pc;
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2014_c41_7440_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2011_c41_1842_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2013_c41_8973_pc := VAR_pc;
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_pc := VAR_pc;
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_pc := VAR_pc;
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_pc := VAR_pc;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_pc := VAR_pc;
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_pc := VAR_pc;
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_pc := VAR_pc;
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_pc := VAR_pc;
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_pc := VAR_pc;
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_pc := VAR_pc;
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_pc := VAR_pc;
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_pc := VAR_pc;
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_pc := VAR_pc;
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_pc := VAR_pc;
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2008_c41_cbac_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2010_c41_8485_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2014_c41_7440_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2011_c41_1842_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2013_c41_8973_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_phase := VAR_phase;
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_previous_ram_read := VAR_previous_ram_read;
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_previous_ram_read := VAR_previous_ram_read;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_ram_read := VAR_previous_ram_read;
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_previous_ram_read := VAR_previous_ram_read;
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_previous_ram_read := VAR_previous_ram_read;
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_previous_ram_read := VAR_previous_ram_read;
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_previous_ram_read := VAR_previous_ram_read;
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_previous_ram_read := VAR_previous_ram_read;
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_previous_ram_read := VAR_previous_ram_read;
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2008_c41_cbac_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_previous_ram_read := VAR_previous_ram_read;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2010_c41_8485_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2014_c41_7440_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2011_c41_1842_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2013_c41_8973_previous_ram_read := VAR_previous_ram_read;
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_previous_ram_read := VAR_previous_ram_read;
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_previous_ram_read := VAR_previous_ram_read;
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_previous_ram_read := VAR_previous_ram_read;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_previous_ram_read := VAR_previous_ram_read;
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_previous_ram_read := VAR_previous_ram_read;
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_previous_ram_read := VAR_previous_ram_read;
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_previous_ram_read := VAR_previous_ram_read;
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_previous_ram_read := VAR_previous_ram_read;
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_previous_ram_read := VAR_previous_ram_read;
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_previous_ram_read := VAR_previous_ram_read;
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_ram_read := VAR_previous_ram_read;
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_previous_ram_read := VAR_previous_ram_read;
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_previous_ram_read := VAR_previous_ram_read;
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_previous_ram_read := VAR_previous_ram_read;
     REG_VAR_sp := sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2008_c41_cbac_previous_stack_read := stack_read_value;
     VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_previous_stack_read := stack_read_value;
     VAR_jsi_uxn_opcodes_h_l2010_c41_8485_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l2014_c41_7440_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l2011_c41_1842_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l2013_c41_8973_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_previous_stack_read := stack_read_value;
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_previous_stack_read := stack_read_value;
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2023_c7_f361] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2023_c7_f361_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2052_c7_286b] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2052_c7_286b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2065_c7_38e5] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_38e5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2072_c7_d342] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_d342_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2040_c7_ca7d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2040_c7_ca7d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2071_c7_6895] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_6895_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2003_c18_6ca9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_left;
     BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output := BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2015_c7_c186] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2015_c7_c186_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2046_c7_bb81] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2046_c7_bb81_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2041_c7_6ca3] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2041_c7_6ca3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2002_c57_d35d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c57_d35d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2068_c7_883c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_883c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2035_c7_2bd8] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2035_c7_2bd8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2002_c10_17f5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_left;
     BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output := BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2063_c7_6b15] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_6b15_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2032_c7_dceb] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2032_c7_dceb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2007_c2_9281] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2007_c2_9281_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2048_c7_8ee1] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2048_c7_8ee1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2050_c7_b733] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2050_c7_b733_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2043_c7_2f3a] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2043_c7_2f3a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2002_c41_e63a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_left;
     BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output := BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2057_c7_5398] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_5398_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2047_c7_a380] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_a380_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2049_c7_4290] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_4290_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2037_c7_c0cd] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2037_c7_c0cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2061_c7_7aef] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_7aef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2033_c7_4e50] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2033_c7_4e50_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2039_c7_1924] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2039_c7_1924_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2069_c7_b7ac] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_b7ac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2058_c7_e578] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2058_c7_e578_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2055_c7_939d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_939d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2031_c7_1e70] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2031_c7_1e70_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2020_c7_3cd6] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2020_c7_3cd6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2027_c7_3a54] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2027_c7_3a54_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2053_c7_aeb7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2053_c7_aeb7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2045_c7_d23c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_d23c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2067_c7_025a] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_025a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2042_c7_e72a] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2042_c7_e72a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2051_c7_6612] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2051_c7_6612_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2025_c7_0235] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2025_c7_0235_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c10_17f5_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2003_c18_6ca9_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c57_d35d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2007_c2_9281_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2015_c7_c186_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2020_c7_3cd6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2023_c7_f361_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2025_c7_0235_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2027_c7_3a54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2031_c7_1e70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2032_c7_dceb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2033_c7_4e50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2035_c7_2bd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2037_c7_c0cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2039_c7_1924_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2040_c7_ca7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2041_c7_6ca3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2042_c7_e72a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2043_c7_2f3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_d23c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2046_c7_bb81_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_a380_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2048_c7_8ee1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_4290_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2050_c7_b733_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2051_c7_6612_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2052_c7_286b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2053_c7_aeb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_939d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_5398_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2058_c7_e578_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_7aef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_6b15_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_38e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_025a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_883c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_b7ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_6895_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_d342_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2003_c18_79e4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_left;
     BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output := BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l2002_c57_2a94] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output := CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2002_c30_902a] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c30_902a_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2002_c41_e63a_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2002_c10_ed1d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_left;
     BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output := BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2002_c10_ed1d_return_output;
     VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2003_c18_79e4_return_output;
     VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2002_c30_902a_return_output;
     VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2002_c57_2a94_return_output;
     -- MUX[uxn_opcodes_h_l2002_c10_c31b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2002_c10_c31b_cond <= VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_cond;
     MUX_uxn_opcodes_h_l2002_c10_c31b_iftrue <= VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_iftrue;
     MUX_uxn_opcodes_h_l2002_c10_c31b_iffalse <= VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_return_output := MUX_uxn_opcodes_h_l2002_c10_c31b_return_output;

     -- MUX[uxn_opcodes_h_l2003_c18_1f82] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2003_c18_1f82_cond <= VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_cond;
     MUX_uxn_opcodes_h_l2003_c18_1f82_iftrue <= VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_iftrue;
     MUX_uxn_opcodes_h_l2003_c18_1f82_iffalse <= VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_return_output := MUX_uxn_opcodes_h_l2003_c18_1f82_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2002_c2_0ae5 := VAR_MUX_uxn_opcodes_h_l2002_c10_c31b_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_left := VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l2003_c18_1f82_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_left := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2002_c2_0ae5;
     VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg1 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     VAR_printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_arg0 := resize(VAR_opc_uxn_opcodes_h_l2002_c2_0ae5, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_6f64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_1017] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_b918] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2023_c11_a6b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_4a9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_cdf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_bd18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_0447] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_left;
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output := BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_2566] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2014_c11_4205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_left;
     BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output := BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_d0d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_8039] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_left;
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output := BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2049_c11_80c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_1ce1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_e1dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_3405] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_a87e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_be21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_fe5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_7550] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_6d30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_b392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_left;
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output := BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_e0e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_0f90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_3d12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_left;
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output := BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_f22e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_9a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_e1a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_b0c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_efbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_e6a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_235d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_8e2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2036_c11_9955] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_left;
     BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output := BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_9956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_8341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2070_c11_425f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_14a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_3768] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_left;
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output := BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_a590] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_left;
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output := BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_9ad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_e456] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_32e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_5c93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_3cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_6c74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_6d8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2027_c11_3a5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_2e36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_e70f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2022_c11_05af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2028_c11_51fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2011_c11_36d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_9d5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_fa7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_ba71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_c9eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_5060] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output;

     -- printf_uxn_opcodes_h_l2005_c2_63fd[uxn_opcodes_h_l2005_c2_63fd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg0 <= VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg0;
     printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg1 <= VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg1;
     printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg2 <= VAR_printf_uxn_opcodes_h_l2005_c2_63fd_uxn_opcodes_h_l2005_c2_63fd_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_36d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2007_c6_20cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_ce5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_28ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_7dfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_60a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_0235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_0d8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_93da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_2942] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_left;
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output := BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_cec3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_62d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c6_20cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_4a9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8341_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_14a0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_36d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_3768_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_62d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2014_c11_4205_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_ce5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_3d12_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3405_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_bd18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_6d8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_9d5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_9ad1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_05af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2023_c11_a6b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_93da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0d8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_0f90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c11_3a5f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_51fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_1ce1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_1017_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_b392_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_2e36_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_c9eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_cdf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_efbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_9955_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_36d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_8e2e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_be21_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6c74_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_9956_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_32e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_e456_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_fa7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_e70f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5c93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_3cac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_5060_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_80c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_0447_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_ba71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d0d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_2566_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_a87e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_cec3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_e1a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_60a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_0235_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_7550_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_fe5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_2942_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b918_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_7dfb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_235d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_8039_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_e6a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_f22e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_b0c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_6d30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_425f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_e0e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_9a29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_28ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_6f64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_a590_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_e1dd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c7_35a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2008_c1_bb7c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c7_0c6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output;
     VAR_jci_uxn_opcodes_h_l2008_c41_cbac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2008_c1_bb7c_return_output;
     -- jci[uxn_opcodes_h_l2008_c41_cbac] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2008_c41_cbac_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2008_c41_cbac_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2008_c41_cbac_phase <= VAR_jci_uxn_opcodes_h_l2008_c41_cbac_phase;
     jci_uxn_opcodes_h_l2008_c41_cbac_pc <= VAR_jci_uxn_opcodes_h_l2008_c41_cbac_pc;
     jci_uxn_opcodes_h_l2008_c41_cbac_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2008_c41_cbac_previous_stack_read;
     jci_uxn_opcodes_h_l2008_c41_cbac_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2008_c41_cbac_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2008_c41_cbac_return_output := jci_uxn_opcodes_h_l2008_c41_cbac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c7_c1ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2009_c1_217a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output;
     VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2009_c1_217a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue := VAR_jci_uxn_opcodes_h_l2008_c41_cbac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c7_de34] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2010_c1_04ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output;

     -- jmi[uxn_opcodes_h_l2009_c41_fdab] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2009_c41_fdab_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2009_c41_fdab_phase <= VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_phase;
     jmi_uxn_opcodes_h_l2009_c41_fdab_pc <= VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_pc;
     jmi_uxn_opcodes_h_l2009_c41_fdab_previous_stack_read <= VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_previous_stack_read;
     jmi_uxn_opcodes_h_l2009_c41_fdab_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_return_output := jmi_uxn_opcodes_h_l2009_c41_fdab_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c7_de34_return_output;
     VAR_jsi_uxn_opcodes_h_l2010_c41_8485_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2010_c1_04ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue := VAR_jmi_uxn_opcodes_h_l2009_c41_fdab_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c7_8c4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output;

     -- jsi[uxn_opcodes_h_l2010_c41_8485] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2010_c41_8485_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2010_c41_8485_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2010_c41_8485_phase <= VAR_jsi_uxn_opcodes_h_l2010_c41_8485_phase;
     jsi_uxn_opcodes_h_l2010_c41_8485_pc <= VAR_jsi_uxn_opcodes_h_l2010_c41_8485_pc;
     jsi_uxn_opcodes_h_l2010_c41_8485_previous_stack_read <= VAR_jsi_uxn_opcodes_h_l2010_c41_8485_previous_stack_read;
     jsi_uxn_opcodes_h_l2010_c41_8485_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2010_c41_8485_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2010_c41_8485_return_output := jsi_uxn_opcodes_h_l2010_c41_8485_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2011_c1_ca59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output;
     VAR_lit_uxn_opcodes_h_l2011_c41_1842_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2011_c1_ca59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue := VAR_jsi_uxn_opcodes_h_l2010_c41_8485_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c7_9cdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2012_c1_3448] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output;

     -- lit[uxn_opcodes_h_l2011_c41_1842] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2011_c41_1842_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2011_c41_1842_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2011_c41_1842_phase <= VAR_lit_uxn_opcodes_h_l2011_c41_1842_phase;
     lit_uxn_opcodes_h_l2011_c41_1842_pc <= VAR_lit_uxn_opcodes_h_l2011_c41_1842_pc;
     lit_uxn_opcodes_h_l2011_c41_1842_previous_stack_read <= VAR_lit_uxn_opcodes_h_l2011_c41_1842_previous_stack_read;
     lit_uxn_opcodes_h_l2011_c41_1842_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2011_c41_1842_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2011_c41_1842_return_output := lit_uxn_opcodes_h_l2011_c41_1842_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output;
     VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2012_c1_3448_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue := VAR_lit_uxn_opcodes_h_l2011_c41_1842_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2013_c1_993c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output;

     -- lit2[uxn_opcodes_h_l2012_c41_94f0] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2012_c41_94f0_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2012_c41_94f0_phase <= VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_phase;
     lit2_uxn_opcodes_h_l2012_c41_94f0_pc <= VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_pc;
     lit2_uxn_opcodes_h_l2012_c41_94f0_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_previous_stack_read;
     lit2_uxn_opcodes_h_l2012_c41_94f0_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_return_output := lit2_uxn_opcodes_h_l2012_c41_94f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c7_75dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output;
     VAR_lit_uxn_opcodes_h_l2013_c41_8973_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2013_c1_993c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue := VAR_lit2_uxn_opcodes_h_l2012_c41_94f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c7_c186] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2014_c1_5cf8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output;

     -- lit[uxn_opcodes_h_l2013_c41_8973] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2013_c41_8973_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2013_c41_8973_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2013_c41_8973_phase <= VAR_lit_uxn_opcodes_h_l2013_c41_8973_phase;
     lit_uxn_opcodes_h_l2013_c41_8973_pc <= VAR_lit_uxn_opcodes_h_l2013_c41_8973_pc;
     lit_uxn_opcodes_h_l2013_c41_8973_previous_stack_read <= VAR_lit_uxn_opcodes_h_l2013_c41_8973_previous_stack_read;
     lit_uxn_opcodes_h_l2013_c41_8973_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2013_c41_8973_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2013_c41_8973_return_output := lit_uxn_opcodes_h_l2013_c41_8973_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c7_c186_return_output;
     VAR_lit2_uxn_opcodes_h_l2014_c41_7440_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2014_c1_5cf8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue := VAR_lit_uxn_opcodes_h_l2013_c41_8973_return_output;
     -- lit2[uxn_opcodes_h_l2014_c41_7440] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2014_c41_7440_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2014_c41_7440_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2014_c41_7440_phase <= VAR_lit2_uxn_opcodes_h_l2014_c41_7440_phase;
     lit2_uxn_opcodes_h_l2014_c41_7440_pc <= VAR_lit2_uxn_opcodes_h_l2014_c41_7440_pc;
     lit2_uxn_opcodes_h_l2014_c41_7440_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l2014_c41_7440_previous_stack_read;
     lit2_uxn_opcodes_h_l2014_c41_7440_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2014_c41_7440_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2014_c41_7440_return_output := lit2_uxn_opcodes_h_l2014_c41_7440_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2015_c1_4808] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c7_4c3c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output;
     VAR_printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2015_c1_4808_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue := VAR_lit2_uxn_opcodes_h_l2014_c41_7440_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c7_cf1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output;

     -- printf_uxn_opcodes_h_l2015_c28_e058[uxn_opcodes_h_l2015_c28_e058] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_arg0 <= VAR_printf_uxn_opcodes_h_l2015_c28_e058_uxn_opcodes_h_l2015_c28_e058_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2016_c1_ac39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output;
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2016_c1_ac39_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2017_c1_51fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c7_e445] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output;

     -- inc2[uxn_opcodes_h_l2016_c41_a2fa] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2016_c41_a2fa_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2016_c41_a2fa_phase <= VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_phase;
     inc2_uxn_opcodes_h_l2016_c41_a2fa_ins <= VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_ins;
     inc2_uxn_opcodes_h_l2016_c41_a2fa_pc <= VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_pc;
     inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_stack_read;
     inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_ram_read <= VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_previous_ram_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output := inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c7_e445_return_output;
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2017_c1_51fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue := VAR_inc2_uxn_opcodes_h_l2016_c41_a2fa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c7_f474] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output;

     -- pop[uxn_opcodes_h_l2017_c41_2602] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2017_c41_2602_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2017_c41_2602_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2017_c41_2602_phase <= VAR_pop_uxn_opcodes_h_l2017_c41_2602_phase;
     pop_uxn_opcodes_h_l2017_c41_2602_ins <= VAR_pop_uxn_opcodes_h_l2017_c41_2602_ins;
     pop_uxn_opcodes_h_l2017_c41_2602_pc <= VAR_pop_uxn_opcodes_h_l2017_c41_2602_pc;
     pop_uxn_opcodes_h_l2017_c41_2602_previous_stack_read <= VAR_pop_uxn_opcodes_h_l2017_c41_2602_previous_stack_read;
     pop_uxn_opcodes_h_l2017_c41_2602_previous_ram_read <= VAR_pop_uxn_opcodes_h_l2017_c41_2602_previous_ram_read;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2017_c41_2602_return_output := pop_uxn_opcodes_h_l2017_c41_2602_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2018_c1_e54c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c7_f474_return_output;
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2018_c1_e54c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue := VAR_pop_uxn_opcodes_h_l2017_c41_2602_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c7_3cd6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2019_c1_a664] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output;

     -- pop2[uxn_opcodes_h_l2018_c41_3191] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2018_c41_3191_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2018_c41_3191_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2018_c41_3191_phase <= VAR_pop2_uxn_opcodes_h_l2018_c41_3191_phase;
     pop2_uxn_opcodes_h_l2018_c41_3191_ins <= VAR_pop2_uxn_opcodes_h_l2018_c41_3191_ins;
     pop2_uxn_opcodes_h_l2018_c41_3191_pc <= VAR_pop2_uxn_opcodes_h_l2018_c41_3191_pc;
     pop2_uxn_opcodes_h_l2018_c41_3191_previous_stack_read <= VAR_pop2_uxn_opcodes_h_l2018_c41_3191_previous_stack_read;
     pop2_uxn_opcodes_h_l2018_c41_3191_previous_ram_read <= VAR_pop2_uxn_opcodes_h_l2018_c41_3191_previous_ram_read;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2018_c41_3191_return_output := pop2_uxn_opcodes_h_l2018_c41_3191_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output;
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2019_c1_a664_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue := VAR_pop2_uxn_opcodes_h_l2018_c41_3191_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2020_c1_e4a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output;

     -- nip[uxn_opcodes_h_l2019_c41_2df4] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2019_c41_2df4_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2019_c41_2df4_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2019_c41_2df4_phase <= VAR_nip_uxn_opcodes_h_l2019_c41_2df4_phase;
     nip_uxn_opcodes_h_l2019_c41_2df4_ins <= VAR_nip_uxn_opcodes_h_l2019_c41_2df4_ins;
     nip_uxn_opcodes_h_l2019_c41_2df4_pc <= VAR_nip_uxn_opcodes_h_l2019_c41_2df4_pc;
     nip_uxn_opcodes_h_l2019_c41_2df4_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2019_c41_2df4_previous_stack_read;
     nip_uxn_opcodes_h_l2019_c41_2df4_previous_ram_read <= VAR_nip_uxn_opcodes_h_l2019_c41_2df4_previous_ram_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2019_c41_2df4_return_output := nip_uxn_opcodes_h_l2019_c41_2df4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c7_1b63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output;
     VAR_printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2020_c1_e4a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue := VAR_nip_uxn_opcodes_h_l2019_c41_2df4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c7_851d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2021_c1_5dea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output;

     -- printf_uxn_opcodes_h_l2020_c28_cf79[uxn_opcodes_h_l2020_c28_cf79] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_arg0 <= VAR_printf_uxn_opcodes_h_l2020_c28_cf79_uxn_opcodes_h_l2020_c28_cf79_arg0;
     -- Outputs

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c7_851d_return_output;
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2021_c1_5dea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c7_f361] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output;

     -- swp[uxn_opcodes_h_l2021_c41_7a0a] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2021_c41_7a0a_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2021_c41_7a0a_phase <= VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_phase;
     swp_uxn_opcodes_h_l2021_c41_7a0a_ins <= VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_ins;
     swp_uxn_opcodes_h_l2021_c41_7a0a_pc <= VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_pc;
     swp_uxn_opcodes_h_l2021_c41_7a0a_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_previous_stack_read;
     swp_uxn_opcodes_h_l2021_c41_7a0a_previous_ram_read <= VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_previous_ram_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_return_output := swp_uxn_opcodes_h_l2021_c41_7a0a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2022_c1_90e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c7_f361_return_output;
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2022_c1_90e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue := VAR_swp_uxn_opcodes_h_l2021_c41_7a0a_return_output;
     -- swp2[uxn_opcodes_h_l2022_c41_5f76] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2022_c41_5f76_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2022_c41_5f76_phase <= VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_phase;
     swp2_uxn_opcodes_h_l2022_c41_5f76_ins <= VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_ins;
     swp2_uxn_opcodes_h_l2022_c41_5f76_pc <= VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_pc;
     swp2_uxn_opcodes_h_l2022_c41_5f76_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_previous_stack_read;
     swp2_uxn_opcodes_h_l2022_c41_5f76_previous_ram_read <= VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_previous_ram_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_return_output := swp2_uxn_opcodes_h_l2022_c41_5f76_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2023_c1_ec8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c7_36cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output;
     VAR_printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2023_c1_ec8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue := VAR_swp2_uxn_opcodes_h_l2022_c41_5f76_return_output;
     -- printf_uxn_opcodes_h_l2023_c28_9aa9[uxn_opcodes_h_l2023_c28_9aa9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_arg0 <= VAR_printf_uxn_opcodes_h_l2023_c28_9aa9_uxn_opcodes_h_l2023_c28_9aa9_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c1_eaa0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c7_0235] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c7_0235_return_output;
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_eaa0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c7_c32c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output;

     -- rot2[uxn_opcodes_h_l2024_c41_8b80] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2024_c41_8b80_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2024_c41_8b80_phase <= VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_phase;
     rot2_uxn_opcodes_h_l2024_c41_8b80_ins <= VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_ins;
     rot2_uxn_opcodes_h_l2024_c41_8b80_pc <= VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_pc;
     rot2_uxn_opcodes_h_l2024_c41_8b80_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_previous_stack_read;
     rot2_uxn_opcodes_h_l2024_c41_8b80_previous_ram_read <= VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_previous_ram_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_return_output := rot2_uxn_opcodes_h_l2024_c41_8b80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2025_c1_61e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output;
     VAR_printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2025_c1_61e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue := VAR_rot2_uxn_opcodes_h_l2024_c41_8b80_return_output;
     -- printf_uxn_opcodes_h_l2025_c28_7ce3[uxn_opcodes_h_l2025_c28_7ce3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_arg0 <= VAR_printf_uxn_opcodes_h_l2025_c28_7ce3_uxn_opcodes_h_l2025_c28_7ce3_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c7_3a54] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2026_c1_6fc1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output;
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2026_c1_6fc1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c7_1db2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2027_c1_bbef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output;

     -- dup2[uxn_opcodes_h_l2026_c41_e19d] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2026_c41_e19d_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2026_c41_e19d_phase <= VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_phase;
     dup2_uxn_opcodes_h_l2026_c41_e19d_ins <= VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_ins;
     dup2_uxn_opcodes_h_l2026_c41_e19d_pc <= VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_pc;
     dup2_uxn_opcodes_h_l2026_c41_e19d_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_previous_stack_read;
     dup2_uxn_opcodes_h_l2026_c41_e19d_previous_ram_read <= VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_previous_ram_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_return_output := dup2_uxn_opcodes_h_l2026_c41_e19d_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output;
     VAR_printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2027_c1_bbef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue := VAR_dup2_uxn_opcodes_h_l2026_c41_e19d_return_output;
     -- printf_uxn_opcodes_h_l2027_c28_0fab[uxn_opcodes_h_l2027_c28_0fab] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_arg0 <= VAR_printf_uxn_opcodes_h_l2027_c28_0fab_uxn_opcodes_h_l2027_c28_0fab_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2028_c1_31a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c7_a616] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c7_a616_return_output;
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2028_c1_31a5_return_output;
     -- ovr2[uxn_opcodes_h_l2028_c41_f771] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2028_c41_f771_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2028_c41_f771_phase <= VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_phase;
     ovr2_uxn_opcodes_h_l2028_c41_f771_ins <= VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_ins;
     ovr2_uxn_opcodes_h_l2028_c41_f771_pc <= VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_pc;
     ovr2_uxn_opcodes_h_l2028_c41_f771_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_previous_stack_read;
     ovr2_uxn_opcodes_h_l2028_c41_f771_previous_ram_read <= VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_previous_ram_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_return_output := ovr2_uxn_opcodes_h_l2028_c41_f771_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c7_8e7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2029_c1_a124] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output;
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2029_c1_a124_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue := VAR_ovr2_uxn_opcodes_h_l2028_c41_f771_return_output;
     -- equ[uxn_opcodes_h_l2029_c41_47f5] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2029_c41_47f5_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2029_c41_47f5_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2029_c41_47f5_phase <= VAR_equ_uxn_opcodes_h_l2029_c41_47f5_phase;
     equ_uxn_opcodes_h_l2029_c41_47f5_ins <= VAR_equ_uxn_opcodes_h_l2029_c41_47f5_ins;
     equ_uxn_opcodes_h_l2029_c41_47f5_pc <= VAR_equ_uxn_opcodes_h_l2029_c41_47f5_pc;
     equ_uxn_opcodes_h_l2029_c41_47f5_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2029_c41_47f5_previous_stack_read;
     equ_uxn_opcodes_h_l2029_c41_47f5_previous_ram_read <= VAR_equ_uxn_opcodes_h_l2029_c41_47f5_previous_ram_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2029_c41_47f5_return_output := equ_uxn_opcodes_h_l2029_c41_47f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c1_0645] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c7_1e70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output;
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_0645_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue := VAR_equ_uxn_opcodes_h_l2029_c41_47f5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_a7fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output;

     -- equ2[uxn_opcodes_h_l2030_c41_b91c] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2030_c41_b91c_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2030_c41_b91c_phase <= VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_phase;
     equ2_uxn_opcodes_h_l2030_c41_b91c_ins <= VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_ins;
     equ2_uxn_opcodes_h_l2030_c41_b91c_pc <= VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_pc;
     equ2_uxn_opcodes_h_l2030_c41_b91c_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_previous_stack_read;
     equ2_uxn_opcodes_h_l2030_c41_b91c_previous_ram_read <= VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_previous_ram_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_return_output := equ2_uxn_opcodes_h_l2030_c41_b91c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c7_dceb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output;
     VAR_printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_a7fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue := VAR_equ2_uxn_opcodes_h_l2030_c41_b91c_return_output;
     -- printf_uxn_opcodes_h_l2031_c28_fd0d[uxn_opcodes_h_l2031_c28_fd0d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_arg0 <= VAR_printf_uxn_opcodes_h_l2031_c28_fd0d_uxn_opcodes_h_l2031_c28_fd0d_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c7_4e50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_9600] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output;
     VAR_printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9600_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c7_94a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c1_5108] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output;

     -- printf_uxn_opcodes_h_l2032_c28_8173[uxn_opcodes_h_l2032_c28_8173] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_arg0 <= VAR_printf_uxn_opcodes_h_l2032_c28_8173_uxn_opcodes_h_l2032_c28_8173_arg0;
     -- Outputs

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output;
     VAR_printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5108_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c1_fb98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c7_2bd8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output;

     -- printf_uxn_opcodes_h_l2033_c28_f299[uxn_opcodes_h_l2033_c28_f299] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_arg0 <= VAR_printf_uxn_opcodes_h_l2033_c28_f299_uxn_opcodes_h_l2033_c28_f299_arg0;
     -- Outputs

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output;
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_fb98_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c7_9a94] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c1_b482] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output;

     -- gth2[uxn_opcodes_h_l2034_c41_e485] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2034_c41_e485_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2034_c41_e485_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2034_c41_e485_phase <= VAR_gth2_uxn_opcodes_h_l2034_c41_e485_phase;
     gth2_uxn_opcodes_h_l2034_c41_e485_ins <= VAR_gth2_uxn_opcodes_h_l2034_c41_e485_ins;
     gth2_uxn_opcodes_h_l2034_c41_e485_pc <= VAR_gth2_uxn_opcodes_h_l2034_c41_e485_pc;
     gth2_uxn_opcodes_h_l2034_c41_e485_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2034_c41_e485_previous_stack_read;
     gth2_uxn_opcodes_h_l2034_c41_e485_previous_ram_read <= VAR_gth2_uxn_opcodes_h_l2034_c41_e485_previous_ram_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2034_c41_e485_return_output := gth2_uxn_opcodes_h_l2034_c41_e485_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output;
     VAR_printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_b482_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue := VAR_gth2_uxn_opcodes_h_l2034_c41_e485_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c7_c0cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output;

     -- printf_uxn_opcodes_h_l2035_c28_612a[uxn_opcodes_h_l2035_c28_612a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_arg0 <= VAR_printf_uxn_opcodes_h_l2035_c28_612a_uxn_opcodes_h_l2035_c28_612a_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c1_8be5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output;
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_8be5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c7_41b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c1_fb36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output;

     -- lth2[uxn_opcodes_h_l2036_c41_8854] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2036_c41_8854_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2036_c41_8854_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2036_c41_8854_phase <= VAR_lth2_uxn_opcodes_h_l2036_c41_8854_phase;
     lth2_uxn_opcodes_h_l2036_c41_8854_ins <= VAR_lth2_uxn_opcodes_h_l2036_c41_8854_ins;
     lth2_uxn_opcodes_h_l2036_c41_8854_pc <= VAR_lth2_uxn_opcodes_h_l2036_c41_8854_pc;
     lth2_uxn_opcodes_h_l2036_c41_8854_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2036_c41_8854_previous_stack_read;
     lth2_uxn_opcodes_h_l2036_c41_8854_previous_ram_read <= VAR_lth2_uxn_opcodes_h_l2036_c41_8854_previous_ram_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2036_c41_8854_return_output := lth2_uxn_opcodes_h_l2036_c41_8854_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output;
     VAR_printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_fb36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue := VAR_lth2_uxn_opcodes_h_l2036_c41_8854_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c7_1924] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_d0f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output;

     -- printf_uxn_opcodes_h_l2037_c28_75f2[uxn_opcodes_h_l2037_c28_75f2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_arg0 <= VAR_printf_uxn_opcodes_h_l2037_c28_75f2_uxn_opcodes_h_l2037_c28_75f2_arg0;
     -- Outputs

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_1924_return_output;
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_d0f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c1_0f1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output;

     -- jmp2[uxn_opcodes_h_l2038_c41_def1] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2038_c41_def1_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2038_c41_def1_phase <= VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_phase;
     jmp2_uxn_opcodes_h_l2038_c41_def1_ins <= VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_ins;
     jmp2_uxn_opcodes_h_l2038_c41_def1_pc <= VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_pc;
     jmp2_uxn_opcodes_h_l2038_c41_def1_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_previous_stack_read;
     jmp2_uxn_opcodes_h_l2038_c41_def1_previous_ram_read <= VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_previous_ram_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_return_output := jmp2_uxn_opcodes_h_l2038_c41_def1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c7_ca7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output;
     VAR_printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_0f1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue := VAR_jmp2_uxn_opcodes_h_l2038_c41_def1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c7_6ca3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_8b00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output;

     -- printf_uxn_opcodes_h_l2039_c28_2043[uxn_opcodes_h_l2039_c28_2043] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_arg0 <= VAR_printf_uxn_opcodes_h_l2039_c28_2043_uxn_opcodes_h_l2039_c28_2043_arg0;
     -- Outputs

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output;
     VAR_printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_8b00_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c1_996a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c7_e72a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output;

     -- printf_uxn_opcodes_h_l2040_c28_e512[uxn_opcodes_h_l2040_c28_e512] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_arg0 <= VAR_printf_uxn_opcodes_h_l2040_c28_e512_uxn_opcodes_h_l2040_c28_e512_arg0;
     -- Outputs

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output;
     VAR_printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_996a_return_output;
     -- printf_uxn_opcodes_h_l2041_c28_9a6b[uxn_opcodes_h_l2041_c28_9a6b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_arg0 <= VAR_printf_uxn_opcodes_h_l2041_c28_9a6b_uxn_opcodes_h_l2041_c28_9a6b_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c1_049b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c7_2f3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output;
     VAR_printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_049b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_164a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output;

     -- printf_uxn_opcodes_h_l2042_c28_13b6[uxn_opcodes_h_l2042_c28_13b6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_arg0 <= VAR_printf_uxn_opcodes_h_l2042_c28_13b6_uxn_opcodes_h_l2042_c28_13b6_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c7_35d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output;
     VAR_printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_164a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c7_d23c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c1_a8f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output;

     -- printf_uxn_opcodes_h_l2043_c28_a3ff[uxn_opcodes_h_l2043_c28_a3ff] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_arg0 <= VAR_printf_uxn_opcodes_h_l2043_c28_a3ff_uxn_opcodes_h_l2043_c28_a3ff_arg0;
     -- Outputs

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output;
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_a8f5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c7_bb81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output;

     -- sth2[uxn_opcodes_h_l2044_c41_3bc0] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2044_c41_3bc0_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2044_c41_3bc0_phase <= VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_phase;
     sth2_uxn_opcodes_h_l2044_c41_3bc0_ins <= VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_ins;
     sth2_uxn_opcodes_h_l2044_c41_3bc0_pc <= VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_pc;
     sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_stack_read;
     sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_ram_read <= VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_previous_ram_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output := sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_1943] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output;
     VAR_printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_1943_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue := VAR_sth2_uxn_opcodes_h_l2044_c41_3bc0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c7_a380] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output;

     -- printf_uxn_opcodes_h_l2045_c28_529b[uxn_opcodes_h_l2045_c28_529b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_arg0 <= VAR_printf_uxn_opcodes_h_l2045_c28_529b_uxn_opcodes_h_l2045_c28_529b_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c1_4205] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_a380_return_output;
     VAR_printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_4205_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_07d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output;

     -- printf_uxn_opcodes_h_l2046_c28_2cd9[uxn_opcodes_h_l2046_c28_2cd9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_arg0 <= VAR_printf_uxn_opcodes_h_l2046_c28_2cd9_uxn_opcodes_h_l2046_c28_2cd9_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c7_8ee1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output;
     VAR_printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_07d3_return_output;
     -- printf_uxn_opcodes_h_l2047_c28_2da9[uxn_opcodes_h_l2047_c28_2da9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_arg0 <= VAR_printf_uxn_opcodes_h_l2047_c28_2da9_uxn_opcodes_h_l2047_c28_2da9_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c7_4290] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_48be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_4290_return_output;
     VAR_printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_48be_return_output;
     -- printf_uxn_opcodes_h_l2048_c28_1e3d[uxn_opcodes_h_l2048_c28_1e3d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_arg0 <= VAR_printf_uxn_opcodes_h_l2048_c28_1e3d_uxn_opcodes_h_l2048_c28_1e3d_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c1_6263] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c7_b733] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_b733_return_output;
     VAR_printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_6263_return_output;
     -- printf_uxn_opcodes_h_l2049_c28_87db[uxn_opcodes_h_l2049_c28_87db] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_arg0 <= VAR_printf_uxn_opcodes_h_l2049_c28_87db_uxn_opcodes_h_l2049_c28_87db_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c1_25f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c7_6612] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_6612_return_output;
     VAR_printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_25f0_return_output;
     -- printf_uxn_opcodes_h_l2050_c28_4c89[uxn_opcodes_h_l2050_c28_4c89] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_arg0 <= VAR_printf_uxn_opcodes_h_l2050_c28_4c89_uxn_opcodes_h_l2050_c28_4c89_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c7_286b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c1_dd0f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_286b_return_output;
     VAR_printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_dd0f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c1_8c41] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output;

     -- printf_uxn_opcodes_h_l2051_c28_94bf[uxn_opcodes_h_l2051_c28_94bf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_arg0 <= VAR_printf_uxn_opcodes_h_l2051_c28_94bf_uxn_opcodes_h_l2051_c28_94bf_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c7_aeb7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output;
     VAR_printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_8c41_return_output;
     -- printf_uxn_opcodes_h_l2052_c28_2602[uxn_opcodes_h_l2052_c28_2602] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_arg0 <= VAR_printf_uxn_opcodes_h_l2052_c28_2602_uxn_opcodes_h_l2052_c28_2602_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c7_5884] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c1_5516] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_5884_return_output;
     VAR_printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5516_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c1_4b30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c7_939d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output;

     -- printf_uxn_opcodes_h_l2053_c28_fce6[uxn_opcodes_h_l2053_c28_fce6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_arg0 <= VAR_printf_uxn_opcodes_h_l2053_c28_fce6_uxn_opcodes_h_l2053_c28_fce6_arg0;
     -- Outputs

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_939d_return_output;
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_4b30_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c7_90ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_2a1b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output;

     -- lda2[uxn_opcodes_h_l2054_c41_3f71] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2054_c41_3f71_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2054_c41_3f71_phase <= VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_phase;
     lda2_uxn_opcodes_h_l2054_c41_3f71_ins <= VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_ins;
     lda2_uxn_opcodes_h_l2054_c41_3f71_pc <= VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_pc;
     lda2_uxn_opcodes_h_l2054_c41_3f71_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_previous_stack_read;
     lda2_uxn_opcodes_h_l2054_c41_3f71_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_return_output := lda2_uxn_opcodes_h_l2054_c41_3f71_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output;
     VAR_printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2a1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue := VAR_lda2_uxn_opcodes_h_l2054_c41_3f71_return_output;
     -- printf_uxn_opcodes_h_l2055_c28_d98a[uxn_opcodes_h_l2055_c28_d98a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_arg0 <= VAR_printf_uxn_opcodes_h_l2055_c28_d98a_uxn_opcodes_h_l2055_c28_d98a_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c1_d20d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c7_5398] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_5398_return_output;
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_d20d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c7_e578] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c1_1e6d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output;

     -- sta2[uxn_opcodes_h_l2056_c41_5614] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2056_c41_5614_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2056_c41_5614_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2056_c41_5614_phase <= VAR_sta2_uxn_opcodes_h_l2056_c41_5614_phase;
     sta2_uxn_opcodes_h_l2056_c41_5614_ins <= VAR_sta2_uxn_opcodes_h_l2056_c41_5614_ins;
     sta2_uxn_opcodes_h_l2056_c41_5614_pc <= VAR_sta2_uxn_opcodes_h_l2056_c41_5614_pc;
     sta2_uxn_opcodes_h_l2056_c41_5614_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2056_c41_5614_previous_stack_read;
     sta2_uxn_opcodes_h_l2056_c41_5614_previous_ram_read <= VAR_sta2_uxn_opcodes_h_l2056_c41_5614_previous_ram_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2056_c41_5614_return_output := sta2_uxn_opcodes_h_l2056_c41_5614_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_e578_return_output;
     VAR_printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_1e6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue := VAR_sta2_uxn_opcodes_h_l2056_c41_5614_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c1_b051] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c7_c9f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output;

     -- printf_uxn_opcodes_h_l2057_c28_0670[uxn_opcodes_h_l2057_c28_0670] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_arg0 <= VAR_printf_uxn_opcodes_h_l2057_c28_0670_uxn_opcodes_h_l2057_c28_0670_arg0;
     -- Outputs

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output;
     VAR_printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b051_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c1_2905] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c7_c6f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output;

     -- printf_uxn_opcodes_h_l2058_c28_b16d[uxn_opcodes_h_l2058_c28_b16d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_arg0 <= VAR_printf_uxn_opcodes_h_l2058_c28_b16d_uxn_opcodes_h_l2058_c28_b16d_arg0;
     -- Outputs

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output;
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_2905_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c1_046f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c7_7aef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output;

     -- deo[uxn_opcodes_h_l2059_c41_d225] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2059_c41_d225_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2059_c41_d225_phase <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_phase;
     deo_uxn_opcodes_h_l2059_c41_d225_ins <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_ins;
     deo_uxn_opcodes_h_l2059_c41_d225_pc <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_pc;
     deo_uxn_opcodes_h_l2059_c41_d225_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_stack_read;
     deo_uxn_opcodes_h_l2059_c41_d225_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_ram_read;
     deo_uxn_opcodes_h_l2059_c41_d225_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2059_c41_d225_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2059_c41_d225_return_output := deo_uxn_opcodes_h_l2059_c41_d225_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output;
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_046f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue := VAR_deo_uxn_opcodes_h_l2059_c41_d225_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c7_7637] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c1_1045] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output;

     -- deo2[uxn_opcodes_h_l2060_c41_721f] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2060_c41_721f_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2060_c41_721f_phase <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_phase;
     deo2_uxn_opcodes_h_l2060_c41_721f_ins <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_ins;
     deo2_uxn_opcodes_h_l2060_c41_721f_pc <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_pc;
     deo2_uxn_opcodes_h_l2060_c41_721f_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_stack_read;
     deo2_uxn_opcodes_h_l2060_c41_721f_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_ram_read;
     deo2_uxn_opcodes_h_l2060_c41_721f_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2060_c41_721f_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2060_c41_721f_return_output := deo2_uxn_opcodes_h_l2060_c41_721f_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_7637_return_output;
     VAR_printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_1045_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue := VAR_deo2_uxn_opcodes_h_l2060_c41_721f_return_output;
     -- printf_uxn_opcodes_h_l2061_c28_a9ba[uxn_opcodes_h_l2061_c28_a9ba] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_arg0 <= VAR_printf_uxn_opcodes_h_l2061_c28_a9ba_uxn_opcodes_h_l2061_c28_a9ba_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c1_6158] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c7_6b15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output;
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_6158_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c7_8c17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output;

     -- add2[uxn_opcodes_h_l2062_c41_0baf] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2062_c41_0baf_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2062_c41_0baf_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2062_c41_0baf_phase <= VAR_add2_uxn_opcodes_h_l2062_c41_0baf_phase;
     add2_uxn_opcodes_h_l2062_c41_0baf_ins <= VAR_add2_uxn_opcodes_h_l2062_c41_0baf_ins;
     add2_uxn_opcodes_h_l2062_c41_0baf_pc <= VAR_add2_uxn_opcodes_h_l2062_c41_0baf_pc;
     add2_uxn_opcodes_h_l2062_c41_0baf_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2062_c41_0baf_previous_stack_read;
     add2_uxn_opcodes_h_l2062_c41_0baf_previous_ram_read <= VAR_add2_uxn_opcodes_h_l2062_c41_0baf_previous_ram_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2062_c41_0baf_return_output := add2_uxn_opcodes_h_l2062_c41_0baf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c1_debe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output;
     VAR_printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_debe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue := VAR_add2_uxn_opcodes_h_l2062_c41_0baf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c1_9dcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c7_38e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output;

     -- printf_uxn_opcodes_h_l2063_c28_6d53[uxn_opcodes_h_l2063_c28_6d53] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_arg0 <= VAR_printf_uxn_opcodes_h_l2063_c28_6d53_uxn_opcodes_h_l2063_c28_6d53_arg0;
     -- Outputs

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output;
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_9dcf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c7_eda8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output;

     -- sub2[uxn_opcodes_h_l2064_c41_5872] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2064_c41_5872_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2064_c41_5872_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2064_c41_5872_phase <= VAR_sub2_uxn_opcodes_h_l2064_c41_5872_phase;
     sub2_uxn_opcodes_h_l2064_c41_5872_ins <= VAR_sub2_uxn_opcodes_h_l2064_c41_5872_ins;
     sub2_uxn_opcodes_h_l2064_c41_5872_pc <= VAR_sub2_uxn_opcodes_h_l2064_c41_5872_pc;
     sub2_uxn_opcodes_h_l2064_c41_5872_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2064_c41_5872_previous_stack_read;
     sub2_uxn_opcodes_h_l2064_c41_5872_previous_ram_read <= VAR_sub2_uxn_opcodes_h_l2064_c41_5872_previous_ram_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2064_c41_5872_return_output := sub2_uxn_opcodes_h_l2064_c41_5872_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c1_2bfb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output;
     VAR_printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_2bfb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue := VAR_sub2_uxn_opcodes_h_l2064_c41_5872_return_output;
     -- printf_uxn_opcodes_h_l2065_c28_749d[uxn_opcodes_h_l2065_c28_749d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_arg0 <= VAR_printf_uxn_opcodes_h_l2065_c28_749d_uxn_opcodes_h_l2065_c28_749d_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c1_eea1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c7_025a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_025a_return_output;
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_eea1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c1_6762] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output;

     -- mul2[uxn_opcodes_h_l2066_c41_8b41] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2066_c41_8b41_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2066_c41_8b41_phase <= VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_phase;
     mul2_uxn_opcodes_h_l2066_c41_8b41_ins <= VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_ins;
     mul2_uxn_opcodes_h_l2066_c41_8b41_pc <= VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_pc;
     mul2_uxn_opcodes_h_l2066_c41_8b41_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_previous_stack_read;
     mul2_uxn_opcodes_h_l2066_c41_8b41_previous_ram_read <= VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_previous_ram_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_return_output := mul2_uxn_opcodes_h_l2066_c41_8b41_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c7_883c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_883c_return_output;
     VAR_printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_6762_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue := VAR_mul2_uxn_opcodes_h_l2066_c41_8b41_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c7_b7ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c1_c05f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output;

     -- printf_uxn_opcodes_h_l2067_c28_3de8[uxn_opcodes_h_l2067_c28_3de8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_arg0 <= VAR_printf_uxn_opcodes_h_l2067_c28_3de8_uxn_opcodes_h_l2067_c28_3de8_arg0;
     -- Outputs

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output;
     VAR_printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_c05f_return_output;
     -- printf_uxn_opcodes_h_l2068_c28_f1e6[uxn_opcodes_h_l2068_c28_f1e6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_arg0 <= VAR_printf_uxn_opcodes_h_l2068_c28_f1e6_uxn_opcodes_h_l2068_c28_f1e6_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c7_7cfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c1_cc5e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output;
     VAR_printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_cc5e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c1_3738] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output;

     -- printf_uxn_opcodes_h_l2069_c28_5cb5[uxn_opcodes_h_l2069_c28_5cb5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_arg0 <= VAR_printf_uxn_opcodes_h_l2069_c28_5cb5_uxn_opcodes_h_l2069_c28_5cb5_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c7_6895] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_6895_return_output;
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_3738_return_output;
     -- and2[uxn_opcodes_h_l2070_c41_20c3] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2070_c41_20c3_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2070_c41_20c3_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2070_c41_20c3_phase <= VAR_and2_uxn_opcodes_h_l2070_c41_20c3_phase;
     and2_uxn_opcodes_h_l2070_c41_20c3_ins <= VAR_and2_uxn_opcodes_h_l2070_c41_20c3_ins;
     and2_uxn_opcodes_h_l2070_c41_20c3_pc <= VAR_and2_uxn_opcodes_h_l2070_c41_20c3_pc;
     and2_uxn_opcodes_h_l2070_c41_20c3_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2070_c41_20c3_previous_stack_read;
     and2_uxn_opcodes_h_l2070_c41_20c3_previous_ram_read <= VAR_and2_uxn_opcodes_h_l2070_c41_20c3_previous_ram_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2070_c41_20c3_return_output := and2_uxn_opcodes_h_l2070_c41_20c3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_1d51] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c7_d342] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_d342_return_output;
     VAR_printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_1d51_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue := VAR_and2_uxn_opcodes_h_l2070_c41_20c3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c7_bb72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c1_54a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output;

     -- printf_uxn_opcodes_h_l2071_c28_32ef[uxn_opcodes_h_l2071_c28_32ef] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_arg0 <= VAR_printf_uxn_opcodes_h_l2071_c28_32ef_uxn_opcodes_h_l2071_c28_32ef_arg0;
     -- Outputs

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output;
     VAR_printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_54a5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c1_f239] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c7_8e8c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output;

     -- printf_uxn_opcodes_h_l2072_c28_999d[uxn_opcodes_h_l2072_c28_999d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_arg0 <= VAR_printf_uxn_opcodes_h_l2072_c28_999d_uxn_opcodes_h_l2072_c28_999d_arg0;
     -- Outputs

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output;
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_f239_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c1_376b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c7_7de3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output;

     -- eor[uxn_opcodes_h_l2073_c41_39c0] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2073_c41_39c0_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2073_c41_39c0_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2073_c41_39c0_phase <= VAR_eor_uxn_opcodes_h_l2073_c41_39c0_phase;
     eor_uxn_opcodes_h_l2073_c41_39c0_ins <= VAR_eor_uxn_opcodes_h_l2073_c41_39c0_ins;
     eor_uxn_opcodes_h_l2073_c41_39c0_pc <= VAR_eor_uxn_opcodes_h_l2073_c41_39c0_pc;
     eor_uxn_opcodes_h_l2073_c41_39c0_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2073_c41_39c0_previous_stack_read;
     eor_uxn_opcodes_h_l2073_c41_39c0_previous_ram_read <= VAR_eor_uxn_opcodes_h_l2073_c41_39c0_previous_ram_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2073_c41_39c0_return_output := eor_uxn_opcodes_h_l2073_c41_39c0_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output;
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_376b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue := VAR_eor_uxn_opcodes_h_l2073_c41_39c0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c7_7f88] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c1_2db2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output;

     -- eor2[uxn_opcodes_h_l2074_c41_5baf] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2074_c41_5baf_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2074_c41_5baf_phase <= VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_phase;
     eor2_uxn_opcodes_h_l2074_c41_5baf_ins <= VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_ins;
     eor2_uxn_opcodes_h_l2074_c41_5baf_pc <= VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_pc;
     eor2_uxn_opcodes_h_l2074_c41_5baf_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_previous_stack_read;
     eor2_uxn_opcodes_h_l2074_c41_5baf_previous_ram_read <= VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_previous_ram_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_return_output := eor2_uxn_opcodes_h_l2074_c41_5baf_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output;
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_2db2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue := VAR_eor2_uxn_opcodes_h_l2074_c41_5baf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c1_e393] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c1_58f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output;

     -- sft[uxn_opcodes_h_l2075_c41_3a50] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2075_c41_3a50_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2075_c41_3a50_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2075_c41_3a50_phase <= VAR_sft_uxn_opcodes_h_l2075_c41_3a50_phase;
     sft_uxn_opcodes_h_l2075_c41_3a50_ins <= VAR_sft_uxn_opcodes_h_l2075_c41_3a50_ins;
     sft_uxn_opcodes_h_l2075_c41_3a50_pc <= VAR_sft_uxn_opcodes_h_l2075_c41_3a50_pc;
     sft_uxn_opcodes_h_l2075_c41_3a50_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2075_c41_3a50_previous_stack_read;
     sft_uxn_opcodes_h_l2075_c41_3a50_previous_ram_read <= VAR_sft_uxn_opcodes_h_l2075_c41_3a50_previous_ram_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2075_c41_3a50_return_output := sft_uxn_opcodes_h_l2075_c41_3a50_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_58f2_return_output;
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_e393_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue := VAR_sft_uxn_opcodes_h_l2075_c41_3a50_return_output;
     -- printf_uxn_opcodes_h_l2077_c9_7303[uxn_opcodes_h_l2077_c9_7303] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_arg0 <= VAR_printf_uxn_opcodes_h_l2077_c9_7303_uxn_opcodes_h_l2077_c9_7303_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2076_c41_6336] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2076_c41_6336_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2076_c41_6336_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2076_c41_6336_phase <= VAR_sft2_uxn_opcodes_h_l2076_c41_6336_phase;
     sft2_uxn_opcodes_h_l2076_c41_6336_ins <= VAR_sft2_uxn_opcodes_h_l2076_c41_6336_ins;
     sft2_uxn_opcodes_h_l2076_c41_6336_pc <= VAR_sft2_uxn_opcodes_h_l2076_c41_6336_pc;
     sft2_uxn_opcodes_h_l2076_c41_6336_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2076_c41_6336_previous_stack_read;
     sft2_uxn_opcodes_h_l2076_c41_6336_previous_ram_read <= VAR_sft2_uxn_opcodes_h_l2076_c41_6336_previous_ram_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2076_c41_6336_return_output := sft2_uxn_opcodes_h_l2076_c41_6336_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue := VAR_sft2_uxn_opcodes_h_l2076_c41_6336_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2076_c7_7f88] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_cond;
     opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output := opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_7f88_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2075_c7_7de3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_cond;
     opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output := opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_7de3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2074_c7_8e8c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_cond;
     opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output := opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_8e8c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2073_c7_bb72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_cond;
     opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output := opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_bb72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2072_c7_d342] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_cond;
     opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output := opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_d342_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2071_c7_6895] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_cond;
     opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output := opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_6895_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2070_c7_7cfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_cond;
     opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output := opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_7cfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2069_c7_b7ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_cond;
     opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output := opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_b7ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2068_c7_883c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_cond;
     opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output := opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_883c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2067_c7_025a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_cond;
     opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output := opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_025a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2066_c7_eda8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_cond;
     opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output := opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_eda8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2065_c7_38e5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_cond;
     opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output := opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_38e5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2064_c7_8c17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_cond;
     opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output := opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_8c17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2063_c7_6b15] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_cond;
     opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output := opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_6b15_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2062_c7_7637] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_cond;
     opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output := opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_7637_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2061_c7_7aef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_cond;
     opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output := opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_7aef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2060_c7_c6f9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_cond;
     opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output := opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_c6f9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2059_c7_c9f8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_cond;
     opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output := opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_c9f8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2058_c7_e578] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_cond;
     opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output := opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_e578_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2057_c7_5398] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_cond;
     opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output := opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_5398_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2056_c7_90ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_cond;
     opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output := opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_90ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2055_c7_939d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_cond;
     opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output := opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_939d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2054_c7_5884] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_cond;
     opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output := opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_5884_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2053_c7_aeb7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_cond;
     opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output := opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_aeb7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2052_c7_286b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_cond;
     opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output := opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_286b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2051_c7_6612] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_cond;
     opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output := opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_6612_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2050_c7_b733] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_cond;
     opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output := opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_b733_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2049_c7_4290] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_cond;
     opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output := opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_4290_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2048_c7_8ee1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_cond;
     opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output := opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_8ee1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2047_c7_a380] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_cond;
     opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output := opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_a380_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2046_c7_bb81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_cond;
     opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output := opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_bb81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2045_c7_d23c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_cond;
     opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output := opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_d23c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2044_c7_35d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_cond;
     opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output := opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_35d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2043_c7_2f3a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_cond;
     opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output := opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_2f3a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2042_c7_e72a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_cond;
     opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output := opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_e72a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2041_c7_6ca3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_cond;
     opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output := opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_6ca3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2040_c7_ca7d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_cond;
     opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output := opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_ca7d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2039_c7_1924] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_cond;
     opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output := opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_1924_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2038_c7_41b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_cond;
     opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output := opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_41b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2037_c7_c0cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_cond;
     opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output := opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_c0cd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2036_c7_9a94] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_cond;
     opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output := opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_9a94_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2035_c7_2bd8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_cond;
     opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output := opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_2bd8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2034_c7_94a6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_cond;
     opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output := opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_94a6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2033_c7_4e50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_cond;
     opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output := opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_4e50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2032_c7_dceb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_cond;
     opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output := opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_dceb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2031_c7_1e70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_cond;
     opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output := opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_1e70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2030_c7_8e7e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_cond;
     opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output := opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_8e7e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2029_c7_a616] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_cond;
     opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output := opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c7_a616_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2028_c7_1db2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_cond;
     opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output := opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2028_c7_1db2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2027_c7_3a54] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_cond;
     opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output := opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2027_c7_3a54_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2026_c7_c32c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_cond;
     opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output := opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2026_c7_c32c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2025_c7_0235] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_cond;
     opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output := opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2025_c7_0235_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2024_c7_36cb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_cond;
     opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output := opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2024_c7_36cb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2023_c7_f361] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_cond;
     opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output := opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2023_c7_f361_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2022_c7_851d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_cond;
     opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output := opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2022_c7_851d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2021_c7_1b63] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_cond;
     opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output := opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2021_c7_1b63_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2020_c7_3cd6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_cond;
     opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output := opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2020_c7_3cd6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2019_c7_f474] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_cond;
     opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output := opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2019_c7_f474_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2018_c7_e445] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_cond;
     opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output := opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2018_c7_e445_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2017_c7_cf1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_cond;
     opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output := opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2017_c7_cf1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2016_c7_4c3c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_cond;
     opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output := opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2016_c7_4c3c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2015_c7_c186] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_cond;
     opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output := opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2015_c7_c186_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2014_c7_75dd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_cond;
     opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output := opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2014_c7_75dd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2013_c7_9cdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_cond;
     opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output := opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2013_c7_9cdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2012_c7_8c4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_cond;
     opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output := opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2012_c7_8c4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2011_c7_de34] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_cond;
     opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output := opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2011_c7_de34_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2010_c7_c1ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output := opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2010_c7_c1ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2009_c7_0c6d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_cond;
     opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output := opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2009_c7_0c6d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2008_c7_35a8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_cond;
     opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output := opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2008_c7_35a8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2007_c2_9281] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_cond;
     opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output := opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2130_c32_6cf5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2130_c32_6cf5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_opc_done;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l2129_c31_d413] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2129_c31_d413_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.vram_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2083_l2081_DUPLICATE_2c90 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2083_l2081_DUPLICATE_2c90_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2128_c33_65f4] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2128_c33_65f4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l2126_c30_48df] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2126_c30_48df_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l2087_c18_8616] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_8616_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_b002 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_b002_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2127_c34_8f83] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2127_c34_8f83_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2079_c6_51f2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_51f2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2121_c34_796b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2121_c34_796b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2088_c19_8b3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_8b3b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2124_c33_1ed1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2124_c33_1ed1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l2125_c29_164e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2125_c29_164e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l2123_c32_1edd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2123_c32_1edd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2089_c82_aa30] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_c82_aa30_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2115_c3_b816] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2115_c3_b816_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l2122_c23_6f5d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2122_c23_6f5d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_57f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_57f4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l2118_c3_510d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2118_c3_510d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l2090_c22_57ad] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_57ad_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l2114_c3_97e3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2114_c3_97e3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2007_c2_9281_return_output.device_ram_value;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2083_l2081_DUPLICATE_2c90_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2083_l2081_DUPLICATE_2c90_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2118_c3_510d_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2115_c3_b816_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_51f2_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2079_c6_51f2_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2092_l2089_l2080_DUPLICATE_b002_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_8616_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_8616_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2087_c18_8616_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_8b3b_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_8b3b_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2088_c19_8b3b_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_57f4_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2117_l2113_DUPLICATE_57f4_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2114_c3_97e3_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_c82_aa30_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_57ad_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_57ad_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2090_c22_57ad_return_output;
     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_bff1 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_bff1_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2121_c34_796b_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2122_c23_6f5d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2123_c32_1edd_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2124_c33_1ed1_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2125_c29_164e_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2126_c30_48df_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2127_c34_8f83_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2128_c33_65f4_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2129_c31_d413_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2130_c32_6cf5_return_output);

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2083_c4_95da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output;

     -- device_ram_update[uxn_opcodes_h_l2112_c26_e2c0] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address0 <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address0;
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_value;
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_write0_enable;
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read0_enable;
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address1 <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_address1;
     device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output := device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2081_c4_1ca4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l2081_c4_28c2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2081_c4_1ca4_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2083_c4_cee1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2083_c4_95da_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;
     VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2080_l2089_l2092_DUPLICATE_3571_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_bff1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2132_l1985_DUPLICATE_bff1_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l2112_c2_4004 := resize(VAR_device_ram_update_uxn_opcodes_h_l2112_c26_e2c0_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l2112_c2_4004;
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse := VAR_sp0_uxn_opcodes_h_l2083_c4_cee1;
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue := VAR_sp1_uxn_opcodes_h_l2081_c4_28c2;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2101_c1_9588] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2080_c3_751a] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2080_c3_751a_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_cond;
     sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue;
     sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output := sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2080_c3_751a] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2080_c3_751a_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_cond;
     sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iftrue;
     sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output := sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c1_055f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2101_c1_9588_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_055f_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2080_c3_751a_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2080_c3_751a_return_output;
     -- sp1_MUX[uxn_opcodes_h_l2079_c2_7cbc] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond;
     sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue;
     sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output := sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2079_c2_7cbc] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_cond;
     sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iftrue;
     sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output := sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output;
     VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2079_c2_7cbc_return_output;
     -- MUX[uxn_opcodes_h_l2089_c19_3df7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2089_c19_3df7_cond <= VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_cond;
     MUX_uxn_opcodes_h_l2089_c19_3df7_iftrue <= VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_iftrue;
     MUX_uxn_opcodes_h_l2089_c19_3df7_iffalse <= VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_return_output := MUX_uxn_opcodes_h_l2089_c19_3df7_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_left := VAR_MUX_uxn_opcodes_h_l2089_c19_3df7_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2089_c19_8a50] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l2089_c19_8a50_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2089_c2_a5d2, 8);
     -- stack_r_ram_update[uxn_opcodes_h_l2093_c22_06cb] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address0;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_address1;
     stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output := stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output;

     -- stack_w_ram_update[uxn_opcodes_h_l2102_c22_4e28] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address0;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_address1;
     stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output := stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l2093_c3_5b08 := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l2093_c22_06cb_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l2102_c3_4c68 := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l2102_c22_4e28_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iftrue := VAR_stack_read_value_uxn_opcodes_h_l2093_c3_5b08;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iffalse := VAR_stack_read_value_uxn_opcodes_h_l2102_c3_4c68;
     -- stack_read_value_MUX[uxn_opcodes_h_l2092_c2_44d9] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_cond;
     stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output := stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l2092_c2_44d9_return_output;
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
