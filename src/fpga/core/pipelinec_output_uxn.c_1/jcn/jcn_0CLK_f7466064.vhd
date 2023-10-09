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
-- Submodules: 61
entity jcn_0CLK_f7466064 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_f7466064;
architecture arch of jcn_0CLK_f7466064 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l724_c6_3e86]
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l724_c1_6751]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l724_c2_8049]
signal t8_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l724_c2_8049]
signal n8_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_pc_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l724_c2_8049]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l725_c3_e36a[uxn_opcodes_h_l725_c3_e36a]
signal printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l730_c11_97c3]
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal t8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal n8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_8ffd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l733_c11_9b40]
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal t8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal n8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l733_c7_ec1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c11_02e5]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l737_c7_0045]
signal n8_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_pc_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_0045]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l740_c11_43c2]
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l740_c7_b744]
signal n8_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l740_c7_b744]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l740_c7_b744]
signal result_pc_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_b744]
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_b744]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_b744]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_b744]
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l744_c32_5fe9]
signal BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l744_c32_979f]
signal BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l744_c32_9e36]
signal MUX_uxn_opcodes_h_l744_c32_9e36_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l744_c32_9e36_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l744_c32_9e36_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l744_c32_9e36_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l746_c15_92ce]
signal BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l746_c30_e3f8]
signal BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l746_c15_425b]
signal MUX_uxn_opcodes_h_l746_c15_425b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l746_c15_425b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l746_c15_425b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l746_c15_425b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l748_c11_c05b]
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_f1a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_f1a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_f1a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_747d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_left,
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_right,
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output);

-- t8_MUX_uxn_opcodes_h_l724_c2_8049
t8_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l724_c2_8049_cond,
t8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
t8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- n8_MUX_uxn_opcodes_h_l724_c2_8049
n8_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l724_c2_8049_cond,
n8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
n8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_pc_MUX_uxn_opcodes_h_l724_c2_8049
result_pc_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049
result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

-- printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a
printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a : entity work.printf_uxn_opcodes_h_l725_c3_e36a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3
BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_left,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_right,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output);

-- t8_MUX_uxn_opcodes_h_l730_c7_8ffd
t8_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- n8_MUX_uxn_opcodes_h_l730_c7_8ffd
n8_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd
result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40
BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_left,
BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_right,
BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output);

-- t8_MUX_uxn_opcodes_h_l733_c7_ec1b
t8_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- n8_MUX_uxn_opcodes_h_l733_c7_ec1b
n8_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b
result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b
result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5
BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output);

-- n8_MUX_uxn_opcodes_h_l737_c7_0045
n8_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l737_c7_0045_cond,
n8_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
n8_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_pc_MUX_uxn_opcodes_h_l737_c7_0045
result_pc_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2
BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_left,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_right,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output);

-- n8_MUX_uxn_opcodes_h_l740_c7_b744
n8_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l740_c7_b744_cond,
n8_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
n8_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- result_pc_MUX_uxn_opcodes_h_l740_c7_b744
result_pc_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l740_c7_b744_cond,
result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9
BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_left,
BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_right,
BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l744_c32_979f
BIN_OP_GT_uxn_opcodes_h_l744_c32_979f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_left,
BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_right,
BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output);

-- MUX_uxn_opcodes_h_l744_c32_9e36
MUX_uxn_opcodes_h_l744_c32_9e36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l744_c32_9e36_cond,
MUX_uxn_opcodes_h_l744_c32_9e36_iftrue,
MUX_uxn_opcodes_h_l744_c32_9e36_iffalse,
MUX_uxn_opcodes_h_l744_c32_9e36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce
BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_left,
BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_right,
BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8
BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_left,
BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_right,
BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output);

-- MUX_uxn_opcodes_h_l746_c15_425b
MUX_uxn_opcodes_h_l746_c15_425b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l746_c15_425b_cond,
MUX_uxn_opcodes_h_l746_c15_425b_iftrue,
MUX_uxn_opcodes_h_l746_c15_425b_iffalse,
MUX_uxn_opcodes_h_l746_c15_425b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b
BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_left,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_right,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output,
 t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output,
 t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output,
 t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output,
 n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output,
 n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output,
 BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output,
 MUX_uxn_opcodes_h_l744_c32_9e36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output,
 MUX_uxn_opcodes_h_l746_c15_425b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_3285 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l731_c3_f52c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_4842 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_2840 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l737_c7_0045_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l744_c32_9e36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l744_c32_9e36_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l744_c32_9e36_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l744_c32_9e36_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l746_c15_425b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l746_c15_425b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l746_c15_425b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l746_c35_3619_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l746_c15_425b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l720_l754_DUPLICATE_b5e7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l731_c3_f52c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l731_c3_f52c;
     VAR_MUX_uxn_opcodes_h_l744_c32_9e36_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_4842 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_4842;
     VAR_MUX_uxn_opcodes_h_l744_c32_9e36_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_2840 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_2840;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_3285 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_3285;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue := to_unsigned(1, 1);

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
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l746_c15_425b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l748_c11_c05b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_left;
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output := BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l746_c35_3619] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l746_c35_3619_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_AND[uxn_opcodes_h_l744_c32_5fe9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_left;
     BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output := BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l746_c15_92ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l733_c11_9b40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_left;
     BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output := BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l730_c11_97c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l740_c11_43c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l724_c6_3e86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_left;
     BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output := BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l737_c7_0045_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c11_02e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output := result.pc;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l744_c32_5fe9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3e86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_97c3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_9b40_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_02e5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_43c2_return_output;
     VAR_MUX_uxn_opcodes_h_l746_c15_425b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c15_92ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_c05b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l746_c35_3619_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_4ed9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l740_l737_l733_l730_l724_DUPLICATE_c4f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l748_l740_l737_l733_l730_DUPLICATE_98f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_18ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l748_l737_l733_l730_l724_DUPLICATE_3d95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l730_l740_l733_l737_DUPLICATE_c45b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l737_c7_0045_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l746_c30_e3f8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_f1a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_f1a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     n8_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     n8_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output := n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- t8_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_f1a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l744_c32_979f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_left;
     BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output := BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l724_c1_6751] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l744_c32_9e36_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l744_c32_979f_return_output;
     VAR_MUX_uxn_opcodes_h_l746_c15_425b_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l746_c30_e3f8_return_output)),16);
     VAR_printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_6751_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_n8_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_f1a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     -- n8_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     n8_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     n8_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output := n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- printf_uxn_opcodes_h_l725_c3_e36a[uxn_opcodes_h_l725_c3_e36a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l725_c3_e36a_uxn_opcodes_h_l725_c3_e36a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- t8_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- MUX[uxn_opcodes_h_l744_c32_9e36] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l744_c32_9e36_cond <= VAR_MUX_uxn_opcodes_h_l744_c32_9e36_cond;
     MUX_uxn_opcodes_h_l744_c32_9e36_iftrue <= VAR_MUX_uxn_opcodes_h_l744_c32_9e36_iftrue;
     MUX_uxn_opcodes_h_l744_c32_9e36_iffalse <= VAR_MUX_uxn_opcodes_h_l744_c32_9e36_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l744_c32_9e36_return_output := MUX_uxn_opcodes_h_l744_c32_9e36_return_output;

     -- MUX[uxn_opcodes_h_l746_c15_425b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l746_c15_425b_cond <= VAR_MUX_uxn_opcodes_h_l746_c15_425b_cond;
     MUX_uxn_opcodes_h_l746_c15_425b_iftrue <= VAR_MUX_uxn_opcodes_h_l746_c15_425b_iftrue;
     MUX_uxn_opcodes_h_l746_c15_425b_iffalse <= VAR_MUX_uxn_opcodes_h_l746_c15_425b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l746_c15_425b_return_output := MUX_uxn_opcodes_h_l746_c15_425b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := VAR_MUX_uxn_opcodes_h_l744_c32_9e36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iftrue := VAR_MUX_uxn_opcodes_h_l746_c15_425b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_t8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     -- t8_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     t8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     t8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output := t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output := result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- n8_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_b744] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_b744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l724_c2_8049_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- n8_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_0045] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_n8_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_0045_return_output;
     -- n8_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     n8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     n8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output := n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l733_c7_ec1b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_cond;
     result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output := result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l724_c2_8049_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ec1b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l730_c7_8ffd] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_cond;
     result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iftrue;
     result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output := result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_8ffd_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l724_c2_8049] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l720_l754_DUPLICATE_b5e7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l720_l754_DUPLICATE_b5e7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_747d(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_8049_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_8049_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l720_l754_DUPLICATE_b5e7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l720_l754_DUPLICATE_b5e7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
