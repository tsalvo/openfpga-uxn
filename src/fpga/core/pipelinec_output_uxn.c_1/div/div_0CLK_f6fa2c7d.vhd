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
-- Submodules: 66
entity div_0CLK_f6fa2c7d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_f6fa2c7d;
architecture arch of div_0CLK_f6fa2c7d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2393_c6_2931]
signal BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2393_c1_498c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2393_c2_d957]
signal t8_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2393_c2_d957]
signal n8_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2393_c2_d957]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2394_c3_3fe2[uxn_opcodes_h_l2394_c3_3fe2]
signal printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_118b]
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2399_c7_df72]
signal t8_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2399_c7_df72]
signal n8_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2399_c7_df72]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_507b]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2402_c7_383a]
signal t8_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2402_c7_383a]
signal n8_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2402_c7_383a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2406_c11_856d]
signal BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal n8_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2406_c7_5f55]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_6a5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2409_c7_f832]
signal n8_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2409_c7_f832]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2413_c32_4e7d]
signal BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2413_c32_235f]
signal BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2413_c32_0fbc]
signal MUX_uxn_opcodes_h_l2413_c32_0fbc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2413_c32_0fbc_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2413_c32_0fbc_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2415_c11_f8ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2415_c7_3195]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2415_c7_3195]
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2415_c7_3195]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2415_c7_3195]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2415_c7_3195]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2419_c24_9fb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2419_c38_0514]
signal BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l2419_c24_74c5]
signal MUX_uxn_opcodes_h_l2419_c24_74c5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2419_c24_74c5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2419_c24_74c5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2419_c24_74c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2421_c11_4089]
signal BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2421_c7_3ebe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2421_c7_3ebe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931
BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_left,
BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_right,
BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output);

-- t8_MUX_uxn_opcodes_h_l2393_c2_d957
t8_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
t8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
t8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- n8_MUX_uxn_opcodes_h_l2393_c2_d957
n8_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
n8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
n8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957
result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

-- printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2
printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2 : entity work.printf_uxn_opcodes_h_l2394_c3_3fe2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_left,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_right,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output);

-- t8_MUX_uxn_opcodes_h_l2399_c7_df72
t8_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
t8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
t8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- n8_MUX_uxn_opcodes_h_l2399_c7_df72
n8_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
n8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
n8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72
result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output);

-- t8_MUX_uxn_opcodes_h_l2402_c7_383a
t8_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
t8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
t8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- n8_MUX_uxn_opcodes_h_l2402_c7_383a
n8_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
n8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
n8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d
BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_left,
BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_right,
BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output);

-- n8_MUX_uxn_opcodes_h_l2406_c7_5f55
n8_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55
result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55
result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55
result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55
result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55
result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55
result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output);

-- n8_MUX_uxn_opcodes_h_l2409_c7_f832
n8_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
n8_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
n8_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d
BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_left,
BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_right,
BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f
BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_left,
BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_right,
BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output);

-- MUX_uxn_opcodes_h_l2413_c32_0fbc
MUX_uxn_opcodes_h_l2413_c32_0fbc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2413_c32_0fbc_cond,
MUX_uxn_opcodes_h_l2413_c32_0fbc_iftrue,
MUX_uxn_opcodes_h_l2413_c32_0fbc_iffalse,
MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_cond,
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5
BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514
BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514 : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_left,
BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_right,
BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output);

-- MUX_uxn_opcodes_h_l2419_c24_74c5
MUX_uxn_opcodes_h_l2419_c24_74c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2419_c24_74c5_cond,
MUX_uxn_opcodes_h_l2419_c24_74c5_iftrue,
MUX_uxn_opcodes_h_l2419_c24_74c5_iffalse,
MUX_uxn_opcodes_h_l2419_c24_74c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089
BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_left,
BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_right,
BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe
result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe
result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output,
 t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output,
 t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output,
 t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output,
 n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output,
 n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output,
 MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output,
 MUX_uxn_opcodes_h_l2419_c24_74c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_85f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_7721 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2404_c3_f06b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_cab3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_08f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2409_l2415_DUPLICATE_d75a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2426_l2389_DUPLICATE_33d4_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_85f6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_85f6;
     VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_cab3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_cab3;
     VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_08f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_08f7;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_7721 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_7721;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2404_c3_f06b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2404_c3_f06b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2413_c32_4e7d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_left;
     BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output := BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2393_c6_2931] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_left;
     BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output := BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2415_c11_f8ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output := result.is_sp_shift;

     -- BIN_OP_DIV[uxn_opcodes_h_l2419_c38_0514] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_left;
     BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output := BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2409_l2415_DUPLICATE_d75a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2409_l2415_DUPLICATE_d75a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2419_c24_9fb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_118b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2406_c11_856d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_6a5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_507b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2421_c11_4089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_left;
     BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output := BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2413_c32_4e7d_return_output;
     VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2419_c38_0514_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c6_2931_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_118b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_507b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2406_c11_856d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_6a5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_f8ca_return_output;
     VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c24_9fb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2421_c11_4089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2393_l2409_l2406_l2402_l2399_DUPLICATE_491b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2421_l2415_l2409_l2406_l2402_l2399_DUPLICATE_d8f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2393_l2415_l2406_l2402_l2399_DUPLICATE_92f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2406_l2399_l2409_l2402_DUPLICATE_a21a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2393_l2421_l2409_l2406_l2402_l2399_DUPLICATE_67b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2409_l2415_DUPLICATE_d75a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2409_l2415_DUPLICATE_d75a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2393_l2415_l2409_l2406_l2402_l2399_DUPLICATE_c7e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2393_c1_498c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     n8_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     n8_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2413_c32_235f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_left;
     BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output := BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2421_c7_3ebe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2415_c7_3195] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2415_c7_3195] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- MUX[uxn_opcodes_h_l2419_c24_74c5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2419_c24_74c5_cond <= VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_cond;
     MUX_uxn_opcodes_h_l2419_c24_74c5_iftrue <= VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_iftrue;
     MUX_uxn_opcodes_h_l2419_c24_74c5_iffalse <= VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_return_output := MUX_uxn_opcodes_h_l2419_c24_74c5_return_output;

     -- t8_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     t8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     t8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2421_c7_3ebe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2413_c32_235f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue := VAR_MUX_uxn_opcodes_h_l2419_c24_74c5_return_output;
     VAR_printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2393_c1_498c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2421_c7_3ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2415_c7_3195] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2415_c7_3195] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output := result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;

     -- printf_uxn_opcodes_h_l2394_c3_3fe2[uxn_opcodes_h_l2394_c3_3fe2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2394_c3_3fe2_uxn_opcodes_h_l2394_c3_3fe2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     t8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     t8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2415_c7_3195] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- n8_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- MUX[uxn_opcodes_h_l2413_c32_0fbc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2413_c32_0fbc_cond <= VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_cond;
     MUX_uxn_opcodes_h_l2413_c32_0fbc_iftrue <= VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_iftrue;
     MUX_uxn_opcodes_h_l2413_c32_0fbc_iffalse <= VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output := MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue := VAR_MUX_uxn_opcodes_h_l2413_c32_0fbc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_3195_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- t8_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     t8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     t8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- n8_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     n8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     n8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_f832] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_f832_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- n8_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     n8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     n8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2406_c7_5f55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2406_c7_5f55_return_output;
     -- n8_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     n8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     n8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_383a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_383a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_df72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_df72_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2393_c2_d957] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2426_l2389_DUPLICATE_33d4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2426_l2389_DUPLICATE_33d4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c2_d957_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c2_d957_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2426_l2389_DUPLICATE_33d4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2426_l2389_DUPLICATE_33d4_return_output;
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
