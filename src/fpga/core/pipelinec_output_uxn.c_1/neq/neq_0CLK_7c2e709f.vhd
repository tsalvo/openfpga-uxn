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
-- Submodules: 65
entity neq_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_7c2e709f;
architecture arch of neq_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1188_c6_66da]
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1188_c1_f2a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1188_c2_4684]
signal t8_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1188_c2_4684]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1188_c2_4684]
signal n8_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1189_c3_ba20[uxn_opcodes_h_l1189_c3_ba20]
signal printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_493c]
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1194_c7_0330]
signal t8_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1194_c7_0330]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1194_c7_0330]
signal n8_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_7e4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1197_c7_0793]
signal t8_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1197_c7_0793]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1197_c7_0793]
signal n8_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1201_c11_17c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1201_c7_ba1c]
signal n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1204_c11_7c12]
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1204_c7_bec5]
signal n8_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1208_c32_f0fa]
signal BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1208_c32_2e33]
signal BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1208_c32_b326]
signal MUX_uxn_opcodes_h_l1208_c32_b326_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1208_c32_b326_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1208_c32_b326_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1208_c32_b326_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_1431]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_1f27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_1f27]
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_1f27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_1f27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_1f27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c24_3ae1]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1214_c24_7da2]
signal MUX_uxn_opcodes_h_l1214_c24_7da2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1214_c24_7da2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1214_c24_7da2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1214_c24_7da2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_be67]
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_4218]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_4218]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da
BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_left,
BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_right,
BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output);

-- t8_MUX_uxn_opcodes_h_l1188_c2_4684
t8_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
t8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
t8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684
result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- n8_MUX_uxn_opcodes_h_l1188_c2_4684
n8_MUX_uxn_opcodes_h_l1188_c2_4684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1188_c2_4684_cond,
n8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue,
n8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse,
n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

-- printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20
printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20 : entity work.printf_uxn_opcodes_h_l1189_c3_ba20_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_left,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_right,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output);

-- t8_MUX_uxn_opcodes_h_l1194_c7_0330
t8_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
t8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
t8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- n8_MUX_uxn_opcodes_h_l1194_c7_0330
n8_MUX_uxn_opcodes_h_l1194_c7_0330 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1194_c7_0330_cond,
n8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue,
n8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse,
n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output);

-- t8_MUX_uxn_opcodes_h_l1197_c7_0793
t8_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
t8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
t8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- n8_MUX_uxn_opcodes_h_l1197_c7_0793
n8_MUX_uxn_opcodes_h_l1197_c7_0793 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1197_c7_0793_cond,
n8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue,
n8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse,
n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- n8_MUX_uxn_opcodes_h_l1201_c7_ba1c
n8_MUX_uxn_opcodes_h_l1201_c7_ba1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond,
n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue,
n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse,
n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_left,
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_right,
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- n8_MUX_uxn_opcodes_h_l1204_c7_bec5
n8_MUX_uxn_opcodes_h_l1204_c7_bec5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1204_c7_bec5_cond,
n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue,
n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse,
n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa
BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_left,
BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_right,
BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33
BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_left,
BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_right,
BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output);

-- MUX_uxn_opcodes_h_l1208_c32_b326
MUX_uxn_opcodes_h_l1208_c32_b326 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1208_c32_b326_cond,
MUX_uxn_opcodes_h_l1208_c32_b326_iftrue,
MUX_uxn_opcodes_h_l1208_c32_b326_iffalse,
MUX_uxn_opcodes_h_l1208_c32_b326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_cond,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1
BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output);

-- MUX_uxn_opcodes_h_l1214_c24_7da2
MUX_uxn_opcodes_h_l1214_c24_7da2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1214_c24_7da2_cond,
MUX_uxn_opcodes_h_l1214_c24_7da2_iftrue,
MUX_uxn_opcodes_h_l1214_c24_7da2_iffalse,
MUX_uxn_opcodes_h_l1214_c24_7da2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_left,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_right,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output,
 t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output,
 t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output,
 t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output,
 MUX_uxn_opcodes_h_l1208_c32_b326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output,
 MUX_uxn_opcodes_h_l1214_c24_7da2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1191_c3_92af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_e7b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_cbf9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_f360 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1208_c32_b326_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1208_c32_b326_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1208_c32_b326_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1208_c32_b326_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1213_c3_d991 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1210_l1204_DUPLICATE_6840_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1221_l1184_DUPLICATE_9c33_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_e7b3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_e7b3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1191_c3_92af := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1191_c3_92af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_f360 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_f360;
     VAR_MUX_uxn_opcodes_h_l1208_c32_b326_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_cbf9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_cbf9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1208_c32_b326_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1213_c3_d991 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1213_c3_d991;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1201_c11_17c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_be67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_left;
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output := BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_493c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1210_l1204_DUPLICATE_6840 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1210_l1204_DUPLICATE_6840_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1188_c6_66da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_7e4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c24_3ae1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_1431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1204_c11_7c12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1208_c32_f0fa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_left;
     BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output := BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1208_c32_f0fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c6_66da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_493c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_7e4d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_17c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_1431_return_output;
     VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c24_3ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_be67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1204_DUPLICATE_e687_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1216_l1210_l1204_DUPLICATE_24ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_DUPLICATE_3316_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1201_l1194_l1204_l1197_DUPLICATE_3796_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1216_l1204_DUPLICATE_ec3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1210_l1204_DUPLICATE_6840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1210_l1204_DUPLICATE_6840_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1201_l1197_l1194_l1188_l1210_l1204_DUPLICATE_cb3d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_1f27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_1f27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;

     -- n8_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     t8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     t8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_4218] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_4218] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output;

     -- MUX[uxn_opcodes_h_l1214_c24_7da2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1214_c24_7da2_cond <= VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_cond;
     MUX_uxn_opcodes_h_l1214_c24_7da2_iftrue <= VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_iftrue;
     MUX_uxn_opcodes_h_l1214_c24_7da2_iffalse <= VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_return_output := MUX_uxn_opcodes_h_l1214_c24_7da2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1208_c32_2e33] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_left;
     BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output := BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1188_c1_f2a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1208_c32_b326_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1208_c32_2e33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue := VAR_MUX_uxn_opcodes_h_l1214_c24_7da2_return_output;
     VAR_printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1188_c1_f2a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_4218_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_4218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_1f27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- MUX[uxn_opcodes_h_l1208_c32_b326] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1208_c32_b326_cond <= VAR_MUX_uxn_opcodes_h_l1208_c32_b326_cond;
     MUX_uxn_opcodes_h_l1208_c32_b326_iftrue <= VAR_MUX_uxn_opcodes_h_l1208_c32_b326_iftrue;
     MUX_uxn_opcodes_h_l1208_c32_b326_iffalse <= VAR_MUX_uxn_opcodes_h_l1208_c32_b326_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1208_c32_b326_return_output := MUX_uxn_opcodes_h_l1208_c32_b326_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_1f27] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output := result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;

     -- printf_uxn_opcodes_h_l1189_c3_ba20[uxn_opcodes_h_l1189_c3_ba20] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1189_c3_ba20_uxn_opcodes_h_l1189_c3_ba20_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_1f27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;

     -- t8_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     t8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     t8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue := VAR_MUX_uxn_opcodes_h_l1208_c32_b326_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_1f27_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- t8_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     t8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     t8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     n8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     n8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1204_c7_bec5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_bec5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1201_c7_ba1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     n8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     n8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_ba1c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- n8_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     n8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     n8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_0793] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_0793_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_0330] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_0330_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1188_c2_4684] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1221_l1184_DUPLICATE_9c33 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1221_l1184_DUPLICATE_9c33_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c2_4684_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c2_4684_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1221_l1184_DUPLICATE_9c33_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1221_l1184_DUPLICATE_9c33_return_output;
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
