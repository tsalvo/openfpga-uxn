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
entity ldz2_0CLK_f255bac8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_f255bac8;
architecture arch of ldz2_0CLK_f255bac8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1297_c6_91af]
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1297_c2_ae1b]
signal tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_02c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_5841]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1304_c7_5841]
signal t8_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1304_c7_5841]
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_484c]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_da75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1307_c7_da75]
signal t8_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1307_c7_da75]
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1310_c30_5038]
signal sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_ab07]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1313_c7_875f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1313_c7_875f]
signal result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1313_c7_875f]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_875f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_875f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_875f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1313_c7_875f]
signal tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1315_c33_f951]
signal BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_a250]
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1317_c7_3be3]
signal result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1317_c7_3be3]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_3be3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_3be3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_3be3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1317_c7_3be3]
signal tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1319_c3_0f57]
signal CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1321_c11_83da]
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1321_c7_5553]
signal result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1321_c7_5553]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1321_c7_5553]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1321_c7_5553]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1321_c7_5553]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1321_c7_5553]
signal tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1322_c3_d3df]
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_1179]
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1328_c7_951f]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_951f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_951f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8152( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_operation_16bit := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_left,
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_right,
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- t8_MUX_uxn_opcodes_h_l1297_c2_ae1b
t8_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b
tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond,
tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841
result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- t8_MUX_uxn_opcodes_h_l1304_c7_5841
t8_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
t8_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
t8_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1304_c7_5841
tmp16_MUX_uxn_opcodes_h_l1304_c7_5841 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_cond,
tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue,
tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse,
tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75
result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- t8_MUX_uxn_opcodes_h_l1307_c7_da75
t8_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
t8_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
t8_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1307_c7_da75
tmp16_MUX_uxn_opcodes_h_l1307_c7_da75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_cond,
tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue,
tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse,
tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1310_c30_5038
sp_relative_shift_uxn_opcodes_h_l1310_c30_5038 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_ins,
sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_x,
sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_y,
sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f
result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1313_c7_875f
tmp16_MUX_uxn_opcodes_h_l1313_c7_875f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_cond,
tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951
BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_left,
BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_right,
BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_left,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_right,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3
result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3
tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_cond,
tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57
CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_x,
CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_left,
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_right,
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553
result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_cond,
result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1321_c7_5553
tmp16_MUX_uxn_opcodes_h_l1321_c7_5553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_cond,
tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue,
tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse,
tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df
BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_left,
BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_right,
BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_left,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_right,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output,
 sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output,
 CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output,
 tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_ceb9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_5e02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1311_c22_247a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1315_c22_e602_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_34d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1297_l1304_l1313_DUPLICATE_2efc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1297_l1307_l1304_DUPLICATE_7b99_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1322_l1318_DUPLICATE_9448_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1292_l1334_DUPLICATE_beb8_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_ceb9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_ceb9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_right := to_unsigned(5, 3);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_34d1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_34d1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_5e02 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_5e02;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l1310_c30_5038] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_ins;
     sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_x;
     sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output := sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1297_l1304_l1313_DUPLICATE_2efc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1297_l1304_l1313_DUPLICATE_2efc_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1315_c33_f951] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_ab07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_484c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_a250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_left;
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output := BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1321_c11_83da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1322_l1318_DUPLICATE_9448 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1322_l1318_DUPLICATE_9448_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1297_c6_91af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_02c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1297_l1307_l1304_DUPLICATE_7b99 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1297_l1307_l1304_DUPLICATE_7b99_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1311_c22_247a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1311_c22_247a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output := result.is_stack_operation_16bit;

     -- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_1179] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_left;
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output := BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_91af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_02c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_484c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ab07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_83da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_1179_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1311_c22_247a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1322_l1318_DUPLICATE_9448_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1322_l1318_DUPLICATE_9448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1297_l1307_l1304_DUPLICATE_7b99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1297_l1307_l1304_DUPLICATE_7b99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1297_l1307_l1304_DUPLICATE_7b99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1321_DUPLICATE_138d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1317_l1304_l1321_l1307_l1328_l1313_DUPLICATE_a63f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1297_l1304_l1313_DUPLICATE_2efc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1297_l1304_l1313_DUPLICATE_2efc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1297_l1304_l1313_DUPLICATE_2efc_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_45f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1297_l1317_l1304_l1307_l1328_l1313_DUPLICATE_1601_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1317_l1313_l1321_DUPLICATE_051a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1310_c30_5038_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1319_c3_0f57] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output := CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1315_c22_e602] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1315_c22_e602_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1315_c33_f951_return_output);

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1328_c7_951f] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1321_c7_5553] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_951f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1322_c3_d3df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_left;
     BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output := BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_951f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     t8_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     t8_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_d3df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1315_c22_e602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1319_c3_0f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_951f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1328_c7_951f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_951f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_3be3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1321_c7_5553] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1321_c7_5553] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_cond;
     tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output := tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1321_c7_5553] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output := result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;

     -- t8_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     t8_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     t8_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1321_c7_5553] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1321_c7_5553] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1321_c7_5553_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1317_c7_3be3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_cond;
     tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output := tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1317_c7_3be3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_3be3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1317_c7_3be3] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_3be3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1317_c7_3be3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1313_c7_875f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_cond;
     tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output := tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1313_c7_875f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_da75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_da75_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1304_c7_5841] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output := result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_5841_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1297_c2_ae1b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;

     -- Submodule level 8
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1292_l1334_DUPLICATE_beb8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1292_l1334_DUPLICATE_beb8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8152(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_ae1b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1292_l1334_DUPLICATE_beb8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1292_l1334_DUPLICATE_beb8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
