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
-- Submodules: 60
entity equ_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_1c7b7172;
architecture arch of equ_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1253_c6_720f]
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1253_c1_31e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1253_c2_6999]
signal n8_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1253_c2_6999]
signal t8_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1253_c2_6999]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1253_c2_6999]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1253_c2_6999]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1253_c2_6999]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1253_c2_6999]
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1253_c2_6999]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1254_c3_ffa6[uxn_opcodes_h_l1254_c3_ffa6]
signal printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1258_c11_ca14]
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1258_c7_438a]
signal n8_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1258_c7_438a]
signal t8_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1258_c7_438a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1258_c7_438a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1258_c7_438a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1258_c7_438a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1258_c7_438a]
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1258_c7_438a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1261_c11_c087]
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal n8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal t8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1261_c7_63bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_da2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_0e7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1268_c11_6ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1268_c7_29de]
signal n8_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1268_c7_29de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1268_c7_29de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1268_c7_29de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1268_c7_29de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1268_c7_29de]
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1268_c7_29de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1271_c32_1a28]
signal BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1271_c32_c1c6]
signal BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1271_c32_c758]
signal MUX_uxn_opcodes_h_l1271_c32_c758_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1271_c32_c758_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1271_c32_c758_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1271_c32_c758_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1273_c11_1a5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1273_c7_e271]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1273_c7_e271]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1273_c7_e271]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1273_c7_e271]
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1273_c7_e271]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1277_c24_9b64]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1277_c24_7254]
signal MUX_uxn_opcodes_h_l1277_c24_7254_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1277_c24_7254_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1277_c24_7254_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1277_c24_7254_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1279_c11_ec44]
signal BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1279_c7_3d43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1279_c7_3d43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_left,
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_right,
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output);

-- n8_MUX_uxn_opcodes_h_l1253_c2_6999
n8_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
n8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
n8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- t8_MUX_uxn_opcodes_h_l1253_c2_6999
t8_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
t8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
t8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

-- printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6
printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6 : entity work.printf_uxn_opcodes_h_l1254_c3_ffa6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_left,
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_right,
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output);

-- n8_MUX_uxn_opcodes_h_l1258_c7_438a
n8_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
n8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
n8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- t8_MUX_uxn_opcodes_h_l1258_c7_438a
t8_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
t8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
t8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_left,
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_right,
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output);

-- n8_MUX_uxn_opcodes_h_l1261_c7_63bd
n8_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- t8_MUX_uxn_opcodes_h_l1261_c7_63bd
t8_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output);

-- n8_MUX_uxn_opcodes_h_l1265_c7_0e7f
n8_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output);

-- n8_MUX_uxn_opcodes_h_l1268_c7_29de
n8_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
n8_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
n8_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28
BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_left,
BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_right,
BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6
BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_left,
BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_right,
BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output);

-- MUX_uxn_opcodes_h_l1271_c32_c758
MUX_uxn_opcodes_h_l1271_c32_c758 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1271_c32_c758_cond,
MUX_uxn_opcodes_h_l1271_c32_c758_iftrue,
MUX_uxn_opcodes_h_l1271_c32_c758_iffalse,
MUX_uxn_opcodes_h_l1271_c32_c758_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_cond,
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output);

-- MUX_uxn_opcodes_h_l1277_c24_7254
MUX_uxn_opcodes_h_l1277_c24_7254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1277_c24_7254_cond,
MUX_uxn_opcodes_h_l1277_c24_7254_iftrue,
MUX_uxn_opcodes_h_l1277_c24_7254_iffalse,
MUX_uxn_opcodes_h_l1277_c24_7254_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_left,
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_right,
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output,
 n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output,
 n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output,
 n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output,
 n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output,
 n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output,
 MUX_uxn_opcodes_h_l1271_c32_c758_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output,
 MUX_uxn_opcodes_h_l1277_c24_7254_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_65d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_aaa8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_f15e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_f3b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_c758_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_c758_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_c758_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_c758_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_cf96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_7254_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_7254_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_7254_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_7254_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_d0ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1249_l1284_DUPLICATE_9c20_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_f3b3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_f3b3;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1277_c24_7254_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_65d2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_65d2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1277_c24_7254_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_cf96 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_cf96;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_aaa8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_aaa8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_f15e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_f15e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1271_c32_c758_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1271_c32_c758_iffalse := resize(to_signed(-1, 2), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_da2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1279_c11_ec44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c24_9b64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1258_c11_ca14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1271_c32_1a28] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_left;
     BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output := BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1273_c11_1a5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_d0ed LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_d0ed_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1268_c11_6ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1261_c11_c087] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_left;
     BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output := BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1253_c6_720f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_1a28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_720f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_ca14_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_c087_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_da2d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_6ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_1a5b_return_output;
     VAR_MUX_uxn_opcodes_h_l1277_c24_7254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_9b64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1258_l1253_l1268_l1265_l1261_DUPLICATE_71fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1258_l1279_l1273_l1268_l1265_l1261_DUPLICATE_1672_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1265_l1261_DUPLICATE_02f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1258_l1253_l1279_l1268_l1265_l1261_DUPLICATE_7de3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_d0ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_d0ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1258_l1253_l1273_l1268_l1265_l1261_DUPLICATE_ec0b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1279_c7_3d43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1253_c1_31e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1279_c7_3d43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1271_c32_c1c6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_left;
     BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output := BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1273_c7_e271] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;

     -- n8_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     n8_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     n8_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1273_c7_e271] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;

     -- MUX[uxn_opcodes_h_l1277_c24_7254] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1277_c24_7254_cond <= VAR_MUX_uxn_opcodes_h_l1277_c24_7254_cond;
     MUX_uxn_opcodes_h_l1277_c24_7254_iftrue <= VAR_MUX_uxn_opcodes_h_l1277_c24_7254_iftrue;
     MUX_uxn_opcodes_h_l1277_c24_7254_iffalse <= VAR_MUX_uxn_opcodes_h_l1277_c24_7254_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1277_c24_7254_return_output := MUX_uxn_opcodes_h_l1277_c24_7254_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1271_c32_c758_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_c1c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue := VAR_MUX_uxn_opcodes_h_l1277_c24_7254_return_output;
     VAR_printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1253_c1_31e0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_3d43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1273_c7_e271] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output := result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;

     -- printf_uxn_opcodes_h_l1254_c3_ffa6[uxn_opcodes_h_l1254_c3_ffa6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1254_c3_ffa6_uxn_opcodes_h_l1254_c3_ffa6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     t8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     t8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- n8_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- MUX[uxn_opcodes_h_l1271_c32_c758] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1271_c32_c758_cond <= VAR_MUX_uxn_opcodes_h_l1271_c32_c758_cond;
     MUX_uxn_opcodes_h_l1271_c32_c758_iftrue <= VAR_MUX_uxn_opcodes_h_l1271_c32_c758_iftrue;
     MUX_uxn_opcodes_h_l1271_c32_c758_iffalse <= VAR_MUX_uxn_opcodes_h_l1271_c32_c758_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1271_c32_c758_return_output := MUX_uxn_opcodes_h_l1271_c32_c758_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1273_c7_e271] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1273_c7_e271] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue := VAR_MUX_uxn_opcodes_h_l1271_c32_c758_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_e271_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- n8_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- t8_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     t8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     t8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1268_c7_29de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_29de_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     n8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     n8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_0e7f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_0e7f_return_output;
     -- n8_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     n8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     n8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1261_c7_63bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_63bd_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1258_c7_438a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_438a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1253_c2_6999] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output := result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1249_l1284_DUPLICATE_9c20 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1249_l1284_DUPLICATE_9c20_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_6999_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_6999_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1249_l1284_DUPLICATE_9c20_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1249_l1284_DUPLICATE_9c20_return_output;
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
