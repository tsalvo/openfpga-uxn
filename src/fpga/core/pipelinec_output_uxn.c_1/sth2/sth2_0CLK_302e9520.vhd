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
entity sth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_302e9520;
architecture arch of sth2_0CLK_302e9520 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2294_c6_b92c]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2294_c1_20b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2294_c2_dcb6]
signal t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2295_c3_dc97[uxn_opcodes_h_l2295_c3_dc97]
signal printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2299_c11_d924]
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2299_c7_4230]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2299_c7_4230]
signal t16_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_f804]
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2302_c7_93ac]
signal t16_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2304_c3_7017]
signal CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2306_c11_1503]
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2306_c7_3391]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2306_c7_3391]
signal t16_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2307_c3_bf42]
signal BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2309_c30_9327]
signal sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_f61c]
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2311_c7_c5f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2318_c11_ca75]
signal BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2318_c7_f9a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2318_c7_f9a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2318_c7_f9a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2318_c7_f9a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2318_c7_f9a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2318_c7_f9a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2321_c31_4468]
signal CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2323_c11_4376]
signal BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2323_c7_492f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2323_c7_492f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2323_c7_492f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c
BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- t16_MUX_uxn_opcodes_h_l2294_c2_dcb6
t16_MUX_uxn_opcodes_h_l2294_c2_dcb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond,
t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue,
t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse,
t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

-- printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97
printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97 : entity work.printf_uxn_opcodes_h_l2295_c3_dc97_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_left,
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_right,
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230
result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- t16_MUX_uxn_opcodes_h_l2299_c7_4230
t16_MUX_uxn_opcodes_h_l2299_c7_4230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2299_c7_4230_cond,
t16_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue,
t16_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse,
t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_left,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_right,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- t16_MUX_uxn_opcodes_h_l2302_c7_93ac
t16_MUX_uxn_opcodes_h_l2302_c7_93ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2302_c7_93ac_cond,
t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue,
t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse,
t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2304_c3_7017
CONST_SL_8_uxn_opcodes_h_l2304_c3_7017 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_x,
CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_left,
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_right,
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391
result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391
result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- t16_MUX_uxn_opcodes_h_l2306_c7_3391
t16_MUX_uxn_opcodes_h_l2306_c7_3391 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2306_c7_3391_cond,
t16_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue,
t16_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse,
t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42
BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_left,
BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_right,
BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2309_c30_9327
sp_relative_shift_uxn_opcodes_h_l2309_c30_9327 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_ins,
sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_x,
sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_y,
sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_left,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_right,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75
BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_left,
BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_right,
BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4
result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4
result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4
result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2321_c31_4468
CONST_SR_8_uxn_opcodes_h_l2321_c31_4468 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_x,
CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_left,
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_right,
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output,
 CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output,
 sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output,
 CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_2dd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_348d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2315_c3_2aff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2313_c3_d395 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2316_c21_b31c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2320_c3_da98 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2321_c21_83d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2303_l2307_DUPLICATE_87bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2302_l2318_l2306_DUPLICATE_7fd4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fab_uxn_opcodes_h_l2290_l2329_DUPLICATE_eb8e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2313_c3_d395 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2313_c3_d395;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2320_c3_da98 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2320_c3_da98;
     VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2315_c3_2aff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2315_c3_2aff;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_348d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_348d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_2dd7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_2dd7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2303_l2307_DUPLICATE_87bd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2303_l2307_DUPLICATE_87bd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2302_l2318_l2306_DUPLICATE_7fd4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2302_l2318_l2306_DUPLICATE_7fd4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2306_c11_1503] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_left;
     BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output := BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c6_b92c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2321_c31_4468] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output := CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_f804] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_left;
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output := BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2323_c11_4376] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_left;
     BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output := BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2318_c11_ca75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2299_c11_d924] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_left;
     BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output := BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2316_c21_b31c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2316_c21_b31c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_f61c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2309_c30_9327] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_ins;
     sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_x;
     sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output := sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c6_b92c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_d924_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_f804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_1503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_f61c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2318_c11_ca75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_4376_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2303_l2307_DUPLICATE_87bd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2303_l2307_DUPLICATE_87bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2316_c21_b31c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2302_l2294_l2299_l2311_DUPLICATE_8582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2318_l2311_l2306_l2302_l2299_l2323_DUPLICATE_2b94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2318_l2311_l2302_l2299_l2294_DUPLICATE_ff3e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_d98e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_l2323_DUPLICATE_62be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2302_l2318_l2306_DUPLICATE_7fd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2302_l2318_l2306_DUPLICATE_7fd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2302_l2318_l2306_DUPLICATE_7fd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2318_l2306_l2302_l2299_l2294_DUPLICATE_4ebc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2309_c30_9327_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2294_c1_20b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2321_c21_83d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2321_c21_83d9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2321_c31_4468_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2304_c3_7017] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output := CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2323_c7_492f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2323_c7_492f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2318_c7_f9a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2323_c7_492f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2307_c3_bf42] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_left;
     BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output := BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2318_c7_f9a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2307_c3_bf42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2321_c21_83d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2304_c3_7017_return_output;
     VAR_printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2294_c1_20b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_492f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2323_c7_492f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_492f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;
     -- printf_uxn_opcodes_h_l2295_c3_dc97[uxn_opcodes_h_l2295_c3_dc97] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2295_c3_dc97_uxn_opcodes_h_l2295_c3_dc97_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2318_c7_f9a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2318_c7_f9a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     t16_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     t16_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2318_c7_f9a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2318_c7_f9a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2318_c7_f9a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- t16_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2311_c7_c5f8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2311_c7_c5f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2306_c7_3391] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- t16_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     t16_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     t16_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_3391_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2302_c7_93ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_93ac_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2299_c7_4230] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2299_c7_4230_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c2_dcb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fab_uxn_opcodes_h_l2290_l2329_DUPLICATE_eb8e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fab_uxn_opcodes_h_l2290_l2329_DUPLICATE_eb8e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fab(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c2_dcb6_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fab_uxn_opcodes_h_l2290_l2329_DUPLICATE_eb8e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fab_uxn_opcodes_h_l2290_l2329_DUPLICATE_eb8e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
