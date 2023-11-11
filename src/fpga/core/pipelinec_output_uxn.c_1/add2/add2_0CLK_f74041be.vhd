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
-- Submodules: 79
entity add2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_f74041be;
architecture arch of add2_0CLK_f74041be is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l830_c6_2162]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_5c39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l830_c2_08e5]
signal tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l830_c2_08e5]
signal n16_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_08e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_08e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_08e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_08e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_08e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l830_c2_08e5]
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c2_08e5]
signal t16_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l831_c3_b59a[uxn_opcodes_h_l831_c3_b59a]
signal printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_1e16]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal n16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l835_c7_3bbc]
signal t16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_583e]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l838_c7_dd35]
signal tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l838_c7_dd35]
signal n16_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_dd35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_dd35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_dd35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_dd35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_dd35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_dd35]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l838_c7_dd35]
signal t16_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_a8ec]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l843_c7_d84c]
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l843_c7_d84c]
signal n16_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_d84c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_d84c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_d84c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_d84c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_d84c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l843_c7_d84c]
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l843_c7_d84c]
signal t16_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l844_c3_fa84]
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l847_c11_7aee]
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l847_c7_60f9]
signal tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l847_c7_60f9]
signal n16_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_60f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_60f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_60f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_60f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_60f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l847_c7_60f9]
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_c3ab]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l851_c7_d892]
signal tmp16_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l851_c7_d892]
signal n16_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_d892]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_d892]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_d892]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_d892]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_d892]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c7_d892]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l852_c3_5450]
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_8512]
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l855_c30_7e07]
signal sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_0440]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_73c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_73c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_73c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_73c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l860_c7_73c9]
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l863_c31_7c48]
signal CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_2d43]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_833e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_833e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162
BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l830_c2_08e5
tmp16_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- n16_MUX_uxn_opcodes_h_l830_c2_08e5
n16_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
n16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
n16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5
result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c2_08e5
t16_MUX_uxn_opcodes_h_l830_c2_08e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c2_08e5_cond,
t16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue,
t16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse,
t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

-- printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a
printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a : entity work.printf_uxn_opcodes_h_l831_c3_b59a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16
BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output);

-- tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc
tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- n16_MUX_uxn_opcodes_h_l835_c7_3bbc
n16_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- t16_MUX_uxn_opcodes_h_l835_c7_3bbc
t16_MUX_uxn_opcodes_h_l835_c7_3bbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond,
t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue,
t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse,
t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e
BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l838_c7_dd35
tmp16_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- n16_MUX_uxn_opcodes_h_l838_c7_dd35
n16_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
n16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
n16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35
result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- t16_MUX_uxn_opcodes_h_l838_c7_dd35
t16_MUX_uxn_opcodes_h_l838_c7_dd35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l838_c7_dd35_cond,
t16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue,
t16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse,
t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec
BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l843_c7_d84c
tmp16_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- n16_MUX_uxn_opcodes_h_l843_c7_d84c
n16_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
n16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
n16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- t16_MUX_uxn_opcodes_h_l843_c7_d84c
t16_MUX_uxn_opcodes_h_l843_c7_d84c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l843_c7_d84c_cond,
t16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue,
t16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse,
t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84
BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_left,
BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_right,
BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee
BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_left,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_right,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l847_c7_60f9
tmp16_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- n16_MUX_uxn_opcodes_h_l847_c7_60f9
n16_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
n16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
n16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9
result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l851_c7_d892
tmp16_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l851_c7_d892_cond,
tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- n16_MUX_uxn_opcodes_h_l851_c7_d892
n16_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l851_c7_d892_cond,
n16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
n16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892
result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l852_c3_5450
BIN_OP_OR_uxn_opcodes_h_l852_c3_5450 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_left,
BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_right,
BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_left,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_right,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output);

-- sp_relative_shift_uxn_opcodes_h_l855_c30_7e07
sp_relative_shift_uxn_opcodes_h_l855_c30_7e07 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_ins,
sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_x,
sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_y,
sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440
BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9
result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l863_c31_7c48
CONST_SR_8_uxn_opcodes_h_l863_c31_7c48 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_x,
CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output,
 tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output,
 tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output,
 tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output,
 tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output,
 BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output,
 sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output,
 CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_9e28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_9c05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_750b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_ef9d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l853_c3_aad7 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_c1d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_6f90_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_cf0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_a6bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l848_l852_DUPLICATE_f7a4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_8b4a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l870_l826_DUPLICATE_33cb_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_c1d9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_c1d9;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_9e28 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_9e28;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_cf0b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_cf0b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_9c05 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_9c05;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_750b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_750b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_ef9d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_ef9d;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l848_l852_DUPLICATE_f7a4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l848_l852_DUPLICATE_f7a4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_c3ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l863_c31_7c48] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_x <= VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output := CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l830_c6_2162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_2d43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_583e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_a8ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l847_c11_7aee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_left;
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output := BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l855_c30_7e07] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_ins;
     sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_x <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_x;
     sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_y <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output := sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_8b4a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_8b4a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_1e16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_0440] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_2162_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_1e16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_583e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_a8ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_7aee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c3ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_0440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2d43_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l848_l852_DUPLICATE_f7a4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l848_l852_DUPLICATE_f7a4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l848_l852_DUPLICATE_f7a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l851_DUPLICATE_e4d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l860_l851_DUPLICATE_0380_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_97c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l843_l838_l835_l865_l830_l860_DUPLICATE_ba53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_8b4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_8b4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l847_l843_l838_l835_l830_l860_DUPLICATE_0e07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_7e07_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_73c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_833e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l863_c21_a6bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_a6bb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_7c48_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_833e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l844_c3_fa84] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_left;
     BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output := BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_73c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l852_c3_5450] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_left;
     BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output := BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_5c39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_fa84_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_right := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_5450_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_a6bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_5f60_return_output;
     VAR_printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_5c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_833e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_833e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l860_c7_73c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_8512] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_left;
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output := BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output;

     -- printf_uxn_opcodes_h_l831_c3_b59a[uxn_opcodes_h_l831_c3_b59a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l831_c3_b59a_uxn_opcodes_h_l831_c3_b59a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_73c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     n16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     n16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output := n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_73c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;

     -- t16_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     t16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     t16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l853_c3_aad7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_8512_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_73c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_t16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := VAR_tmp16_uxn_opcodes_h_l853_c3_aad7;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l858_c21_6f90] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_6f90_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l853_c3_aad7);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     t16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     t16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- n16_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     n16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     n16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output := tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_6f90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     -- n16_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     n16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     n16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- t16_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l851_c7_d892] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_n16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_d892_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l847_c7_60f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- n16_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     n16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     n16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- t16_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     t16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_60f9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- n16_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l843_c7_d84c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output := result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d84c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- n16_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     n16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     n16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_dd35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_dd35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_3bbc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3bbc_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l830_c2_08e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l870_l826_DUPLICATE_33cb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l870_l826_DUPLICATE_33cb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_08e5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_08e5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l870_l826_DUPLICATE_33cb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l870_l826_DUPLICATE_33cb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
