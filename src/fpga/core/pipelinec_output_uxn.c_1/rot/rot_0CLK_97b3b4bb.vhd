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
-- Submodules: 82
entity rot_0CLK_97b3b4bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_97b3b4bb;
architecture arch of rot_0CLK_97b3b4bb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2820_c6_3306]
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_5589]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal t8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal n8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2820_c2_bc82]
signal l8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2821_c3_e3d3[uxn_opcodes_h_l2821_c3_e3d3]
signal printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_f712]
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal t8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal n8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2825_c7_df4b]
signal l8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_7d9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal t8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal n8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2828_c7_ba34]
signal l8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_c4ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal n8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2832_c7_a31d]
signal l8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2835_c11_91e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2835_c7_2206]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2835_c7_2206]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2835_c7_2206]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2835_c7_2206]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2835_c7_2206]
signal result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2835_c7_2206]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2835_c7_2206]
signal n8_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2835_c7_2206]
signal l8_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_a431]
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2839_c7_e479]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2839_c7_e479]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2839_c7_e479]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2839_c7_e479]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2839_c7_e479]
signal result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2839_c7_e479]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : signed(3 downto 0);

-- l8_MUX[uxn_opcodes_h_l2839_c7_e479]
signal l8_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_c051]
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : signed(3 downto 0);

-- l8_MUX[uxn_opcodes_h_l2842_c7_1ded]
signal l8_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2845_c30_d511]
signal sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_ff14]
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_5cef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2850_c7_5cef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_5cef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_5cef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2850_c7_5cef]
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_9e95]
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2855_c7_0031]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2855_c7_0031]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2855_c7_0031]
signal result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2855_c7_0031]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2859_c11_1645]
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2859_c7_229a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2859_c7_229a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_left,
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_right,
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82
result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- t8_MUX_uxn_opcodes_h_l2820_c2_bc82
t8_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- n8_MUX_uxn_opcodes_h_l2820_c2_bc82
n8_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- l8_MUX_uxn_opcodes_h_l2820_c2_bc82
l8_MUX_uxn_opcodes_h_l2820_c2_bc82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond,
l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue,
l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse,
l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

-- printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3
printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3 : entity work.printf_uxn_opcodes_h_l2821_c3_e3d3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_left,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_right,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b
result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- t8_MUX_uxn_opcodes_h_l2825_c7_df4b
t8_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- n8_MUX_uxn_opcodes_h_l2825_c7_df4b
n8_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- l8_MUX_uxn_opcodes_h_l2825_c7_df4b
l8_MUX_uxn_opcodes_h_l2825_c7_df4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond,
l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue,
l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse,
l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34
result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- t8_MUX_uxn_opcodes_h_l2828_c7_ba34
t8_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- n8_MUX_uxn_opcodes_h_l2828_c7_ba34
n8_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- l8_MUX_uxn_opcodes_h_l2828_c7_ba34
l8_MUX_uxn_opcodes_h_l2828_c7_ba34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond,
l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue,
l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse,
l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d
result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- n8_MUX_uxn_opcodes_h_l2832_c7_a31d
n8_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- l8_MUX_uxn_opcodes_h_l2832_c7_a31d
l8_MUX_uxn_opcodes_h_l2832_c7_a31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond,
l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue,
l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse,
l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206
result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206
result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206
result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206
result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206
result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- n8_MUX_uxn_opcodes_h_l2835_c7_2206
n8_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
n8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
n8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- l8_MUX_uxn_opcodes_h_l2835_c7_2206
l8_MUX_uxn_opcodes_h_l2835_c7_2206 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2835_c7_2206_cond,
l8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue,
l8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse,
l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_left,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_right,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479
result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- l8_MUX_uxn_opcodes_h_l2839_c7_e479
l8_MUX_uxn_opcodes_h_l2839_c7_e479 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2839_c7_e479_cond,
l8_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue,
l8_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse,
l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_left,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_right,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded
result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- l8_MUX_uxn_opcodes_h_l2842_c7_1ded
l8_MUX_uxn_opcodes_h_l2842_c7_1ded : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2842_c7_1ded_cond,
l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue,
l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse,
l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2845_c30_d511
sp_relative_shift_uxn_opcodes_h_l2845_c30_d511 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_ins,
sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_x,
sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_y,
sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_left,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_right,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_cond,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_left,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_right,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031
result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_cond,
result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_left,
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_right,
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a
result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a
result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output,
 sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_d8ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_f1e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_c42d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2833_c3_33b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2837_c3_06c9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2840_c3_5a85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_928e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2852_c3_fc30 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2856_c3_1366 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2855_c7_0031_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2864_l2816_DUPLICATE_00d2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_d8ff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_d8ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_f1e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_f1e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2837_c3_06c9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2837_c3_06c9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_928e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_928e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2833_c3_33b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2833_c3_33b7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2840_c3_5a85 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2840_c3_5a85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2856_c3_1366 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2856_c3_1366;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_c42d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_c42d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2852_c3_fc30 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2852_c3_fc30;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_c051] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_left;
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output := BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2859_c11_1645] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_left;
     BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output := BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2845_c30_d511] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_ins;
     sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_x;
     sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output := sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2820_c6_3306] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_left;
     BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output := BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_f712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_left;
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output := BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_a431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_left;
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output := BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2855_c7_0031] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2855_c7_0031_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_9e95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2835_c11_91e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_ff14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_7d9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_c4ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_3306_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_f712_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_7d9f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_c4ed_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_91e6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_a431_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_c051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_ff14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_9e95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_1645_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2842_l2839_l2835_l2832_l2828_l2825_DUPLICATE_bf36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2842_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_1bbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2828_l2825_DUPLICATE_01ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2820_l2839_l2835_l2832_l2859_l2828_l2855_l2825_DUPLICATE_977c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2839_l2835_l2832_l2828_l2855_l2825_DUPLICATE_af2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2855_c7_0031_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2845_c30_d511_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2859_c7_229a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_5589] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output;

     -- t8_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2855_c7_0031] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output := result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;

     -- l8_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2859_c7_229a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     n8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     n8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2850_c7_5cef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2855_c7_0031] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_5589_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2859_c7_229a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2859_c7_229a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2850_c7_5cef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output := result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- n8_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- t8_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2855_c7_0031] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2855_c7_0031] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;

     -- printf_uxn_opcodes_h_l2821_c3_e3d3[uxn_opcodes_h_l2821_c3_e3d3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2821_c3_e3d3_uxn_opcodes_h_l2821_c3_e3d3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- l8_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     l8_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     l8_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_5cef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0031_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- n8_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- l8_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     l8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     l8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_5cef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_5cef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;

     -- t8_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_5cef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;
     -- n8_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- l8_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2842_c7_1ded] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_1ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- l8_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2839_c7_e479] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;

     -- n8_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_e479_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- l8_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2835_c7_2206] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2835_c7_2206_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     -- l8_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_a31d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_a31d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2828_c7_ba34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_ba34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2825_c7_df4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_df4b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c2_bc82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2864_l2816_DUPLICATE_00d2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2864_l2816_DUPLICATE_00d2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_bc82_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2864_l2816_DUPLICATE_00d2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2864_l2816_DUPLICATE_00d2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
