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
entity ldr2_0CLK_47454ab1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_47454ab1;
architecture arch of ldr2_0CLK_47454ab1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1454_c6_d54c]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1454_c2_3bbf]
signal tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_c4e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal t8_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1461_c7_30ab]
signal tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1464_c11_0809]
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1464_c7_a0ca]
signal tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1467_c30_183e]
signal sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1468_c22_826e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1470_c11_df8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1470_c7_47ae]
signal tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1472_c22_372f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1472_c22_5031]
signal BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1474_c11_c31b]
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1474_c7_5c7d]
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1474_c7_5c7d]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c7_5c7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c7_5c7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c7_5c7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1474_c7_5c7d]
signal tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1476_c3_cc77]
signal CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1478_c11_7ce7]
signal BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1478_c7_6a48]
signal result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1478_c7_6a48]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1478_c7_6a48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1478_c7_6a48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1478_c7_6a48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1478_c7_6a48]
signal tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1479_c3_9376]
signal BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_2a5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1485_c7_7f78]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_7f78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_7f78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c
BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- t8_MUX_uxn_opcodes_h_l1454_c2_3bbf
t8_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf
tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond,
tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab
result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- t8_MUX_uxn_opcodes_h_l1461_c7_30ab
t8_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab
tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_cond,
tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_left,
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_right,
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- t8_MUX_uxn_opcodes_h_l1464_c7_a0ca
t8_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca
tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond,
tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1467_c30_183e
sp_relative_shift_uxn_opcodes_h_l1467_c30_183e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_ins,
sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_x,
sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_y,
sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e
BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f
BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae
result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae
result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae
result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae
tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_cond,
tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_left,
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_right,
BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_left,
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_right,
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d
result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d
tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond,
tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77
CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_x,
CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7
BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_left,
BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_right,
BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48
result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_cond,
result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48
result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48
result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48
tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_cond,
tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue,
tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse,
tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376
BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_left,
BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_right,
BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output,
 sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output,
 tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_14c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1462_c3_5146 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1468_c3_6c1d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1468_c27_f8c2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1472_c3_6c5f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1472_c27_15fb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_b084 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1461_l1454_l1470_DUPLICATE_3c5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1461_l1464_l1454_DUPLICATE_d060_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1479_l1475_DUPLICATE_5ca0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1449_l1491_DUPLICATE_5c3b_return_output : opcode_result_t;
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
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1462_c3_5146 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1462_c3_5146;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_b084 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_b084;
     VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_14c1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_14c1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_right := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1474_c11_c31b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1468_c27_f8c2] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1468_c27_f8c2_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1461_l1454_l1470_DUPLICATE_3c5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1461_l1454_l1470_DUPLICATE_3c5d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_c4e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1470_c11_df8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1472_c27_15fb] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1472_c27_15fb_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1479_l1475_DUPLICATE_5ca0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1479_l1475_DUPLICATE_5ca0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c6_d54c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_2a5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1461_l1464_l1454_DUPLICATE_d060 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1461_l1464_l1454_DUPLICATE_d060_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output := result.is_stack_operation_16bit;

     -- BIN_OP_EQ[uxn_opcodes_h_l1464_c11_0809] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_left;
     BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output := BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1467_c30_183e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_ins;
     sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_x;
     sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output := sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1478_c11_7ce7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c6_d54c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_c4e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_0809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1470_c11_df8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_c31b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1478_c11_7ce7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_2a5b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1468_c27_f8c2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1472_c27_15fb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1479_l1475_DUPLICATE_5ca0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1479_l1475_DUPLICATE_5ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1461_l1464_l1454_DUPLICATE_d060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1461_l1464_l1454_DUPLICATE_d060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1461_l1464_l1454_DUPLICATE_d060_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1461_l1474_l1478_l1454_DUPLICATE_486e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1485_l1478_l1474_l1470_l1464_l1461_DUPLICATE_41c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1461_l1454_l1470_DUPLICATE_3c5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1461_l1454_l1470_DUPLICATE_3c5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1461_l1454_l1470_DUPLICATE_3c5d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_1304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_l1474_l1470_l1464_l1461_l1454_DUPLICATE_f028_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1474_l1464_l1478_l1470_DUPLICATE_0b46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1467_c30_183e_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1476_c3_cc77] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output := CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1479_c3_9376] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_left;
     BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output := BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1478_c7_6a48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;

     -- t8_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1468_c22_826e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_7f78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1485_c7_7f78] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1472_c22_372f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_7f78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1479_c3_9376_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1468_c3_6c1d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1468_c22_826e_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_372f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1476_c3_cc77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_7f78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1468_c3_6c1d;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1478_c7_6a48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1478_c7_6a48] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1478_c7_6a48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1478_c7_6a48] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output := result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1478_c7_6a48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_cond;
     tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output := tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;

     -- t8_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c7_5c7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1472_c22_5031] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1472_c3_6c5f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1472_c22_5031_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1478_c7_6a48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1472_c3_6c5f;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c7_5c7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1474_c7_5c7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond;
     tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output := tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1474_c7_5c7d] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1474_c7_5c7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c7_5c7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1474_c7_5c7d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1470_c7_47ae] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output := result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1470_c7_47ae_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c7_a0ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1464_c7_a0ca_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_30ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1461_c7_30ab_return_output;
     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c2_3bbf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;

     -- Submodule level 8
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1449_l1491_DUPLICATE_5c3b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1449_l1491_DUPLICATE_5c3b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8152(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c2_3bbf_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1449_l1491_DUPLICATE_5c3b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1449_l1491_DUPLICATE_5c3b_return_output;
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
