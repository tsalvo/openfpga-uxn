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
-- Submodules: 64
entity eor_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_fd2391e7;
architecture arch of eor_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1039_c6_fe15]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_0a4d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c2_fdb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1040_c3_cdfb[uxn_opcodes_h_l1040_c3_cdfb]
signal printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_0079]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_4ccd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_d199]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_f6ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_605b]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal n8_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1052_c7_9d54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_b41d]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_e3d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1059_c32_b160]
signal BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1059_c32_565c]
signal BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1059_c32_d265]
signal MUX_uxn_opcodes_h_l1059_c32_d265_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1059_c32_d265_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1059_c32_d265_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1059_c32_d265_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_56df]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1061_c7_b999]
signal result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1061_c7_b999]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1061_c7_b999]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1061_c7_b999]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1061_c7_b999]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1065_c24_e753]
signal BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_e6fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_6c69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_6c69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15
BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output);

-- n8_MUX_uxn_opcodes_h_l1039_c2_fdb0
n8_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- t8_MUX_uxn_opcodes_h_l1039_c2_fdb0
t8_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

-- printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb
printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb : entity work.printf_uxn_opcodes_h_l1040_c3_cdfb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output);

-- n8_MUX_uxn_opcodes_h_l1045_c7_4ccd
n8_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- t8_MUX_uxn_opcodes_h_l1045_c7_4ccd
t8_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output);

-- n8_MUX_uxn_opcodes_h_l1048_c7_f6ca
n8_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- t8_MUX_uxn_opcodes_h_l1048_c7_f6ca
t8_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output);

-- n8_MUX_uxn_opcodes_h_l1052_c7_9d54
n8_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output);

-- n8_MUX_uxn_opcodes_h_l1055_c7_e3d0
n8_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160
BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_left,
BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_right,
BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c
BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_left,
BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_right,
BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output);

-- MUX_uxn_opcodes_h_l1059_c32_d265
MUX_uxn_opcodes_h_l1059_c32_d265 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1059_c32_d265_cond,
MUX_uxn_opcodes_h_l1059_c32_d265_iftrue,
MUX_uxn_opcodes_h_l1059_c32_d265_iffalse,
MUX_uxn_opcodes_h_l1059_c32_d265_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999
result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_cond,
result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999
result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753
BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_left,
BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_right,
BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output,
 n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output,
 n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output,
 n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output,
 n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output,
 n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output,
 MUX_uxn_opcodes_h_l1059_c32_d265_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1042_c3_63be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_5e13 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1050_c3_1cbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_42b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1059_c32_d265_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1059_c32_d265_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1059_c32_d265_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1059_c32_d265_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_cd5f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1055_l1061_DUPLICATE_7907_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1035_l1072_DUPLICATE_7aa2_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1042_c3_63be := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1042_c3_63be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1050_c3_1cbb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1050_c3_1cbb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1059_c32_d265_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1059_c32_d265_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_5e13 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_5e13;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_42b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_42b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_cd5f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_cd5f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c6_fe15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_0079] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1065_c24_e753] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_left;
     BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output := BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_d199] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1059_c32_b160] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_left;
     BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output := BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_56df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_605b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1055_l1061_DUPLICATE_7907 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1055_l1061_DUPLICATE_7907_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_b41d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_e6fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1059_c32_b160_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c6_fe15_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_0079_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_d199_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_605b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_b41d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_56df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e6fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c24_e753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_DUPLICATE_42cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1067_DUPLICATE_f4d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1061_l1052_l1048_l1045_l1039_DUPLICATE_7579_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1045_l1055_l1048_l1052_DUPLICATE_236c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1052_l1048_l1045_l1039_l1067_DUPLICATE_e34d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1055_l1061_DUPLICATE_7907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1055_l1061_DUPLICATE_7907_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1061_l1055_l1052_l1048_l1045_l1039_DUPLICATE_8531_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1059_c32_565c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_left;
     BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output := BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_6c69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output;

     -- n8_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1061_c7_b999] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1061_c7_b999] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;

     -- t8_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_6c69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1061_c7_b999] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output := result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_0a4d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1059_c32_d265_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1059_c32_565c_return_output;
     VAR_printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_0a4d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_6c69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     -- t8_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- printf_uxn_opcodes_h_l1040_c3_cdfb[uxn_opcodes_h_l1040_c3_cdfb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1040_c3_cdfb_uxn_opcodes_h_l1040_c3_cdfb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- MUX[uxn_opcodes_h_l1059_c32_d265] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1059_c32_d265_cond <= VAR_MUX_uxn_opcodes_h_l1059_c32_d265_cond;
     MUX_uxn_opcodes_h_l1059_c32_d265_iftrue <= VAR_MUX_uxn_opcodes_h_l1059_c32_d265_iftrue;
     MUX_uxn_opcodes_h_l1059_c32_d265_iffalse <= VAR_MUX_uxn_opcodes_h_l1059_c32_d265_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1059_c32_d265_return_output := MUX_uxn_opcodes_h_l1059_c32_d265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1061_c7_b999] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;

     -- n8_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1061_c7_b999] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue := VAR_MUX_uxn_opcodes_h_l1059_c32_d265_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_b999_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_e3d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- t8_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_e3d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- n8_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1052_c7_9d54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9d54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_f6ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;

     -- n8_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_f6ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_4ccd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_4ccd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c2_fdb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1035_l1072_DUPLICATE_7aa2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1035_l1072_DUPLICATE_7aa2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c2_fdb0_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1035_l1072_DUPLICATE_7aa2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1035_l1072_DUPLICATE_7aa2_return_output;
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
