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
-- Submodules: 68
entity lit2_0CLK_a45e5d62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_a45e5d62;
architecture arch of lit2_0CLK_a45e5d62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l221_c6_4488]
signal BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l221_c1_0bdf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_pc_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l221_c2_5854]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l221_c2_5854]
signal tmp16_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l222_c3_a0cf[uxn_opcodes_h_l222_c3_a0cf]
signal printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l228_c11_1b84]
signal BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l228_c7_b5d1]
signal tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l232_c11_41b5]
signal BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l232_c7_7e4f]
signal tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l234_c3_5cec]
signal CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l235_c21_e366]
signal BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l237_c11_e56a]
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_pc_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l237_c7_6088]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l237_c7_6088]
signal tmp16_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l238_c21_8669]
signal BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l240_c11_9ed6]
signal BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l240_c7_c066]
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l240_c7_c066]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l240_c7_c066]
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l240_c7_c066]
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l240_c7_c066]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l240_c7_c066]
signal result_pc_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l240_c7_c066]
signal tmp16_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l241_c3_b7e1]
signal BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l243_c15_ba7e]
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l248_c11_8483]
signal BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l248_c7_fec8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l248_c7_fec8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l248_c7_fec8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l248_c7_fec8]
signal result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l248_c7_fec8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l251_c34_cd2d]
signal CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l253_c11_d1c0]
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l253_c7_31d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l253_c7_31d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ac32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.pc := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.stack_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488
BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_left,
BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_right,
BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854
result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854
result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_pc_MUX_uxn_opcodes_h_l221_c2_5854
result_pc_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854
result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854
result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854
result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854
result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854
result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- tmp16_MUX_uxn_opcodes_h_l221_c2_5854
tmp16_MUX_uxn_opcodes_h_l221_c2_5854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l221_c2_5854_cond,
tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iftrue,
tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iffalse,
tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

-- printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf
printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf : entity work.printf_uxn_opcodes_h_l222_c3_a0cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84
BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_left,
BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_right,
BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1
result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1
result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1
result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1
tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_cond,
tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5
BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_left,
BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_right,
BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f
result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f
result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f
tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_cond,
tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue,
tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse,
tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l234_c3_5cec
CONST_SL_8_uxn_opcodes_h_l234_c3_5cec : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_x,
CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366
BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_left,
BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_right,
BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a
BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_left,
BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_right,
BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088
result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088
result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- result_pc_MUX_uxn_opcodes_h_l237_c7_6088
result_pc_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- tmp16_MUX_uxn_opcodes_h_l237_c7_6088
tmp16_MUX_uxn_opcodes_h_l237_c7_6088 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l237_c7_6088_cond,
tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iftrue,
tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iffalse,
tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_left,
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_right,
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6
BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_left,
BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_right,
BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066
result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_cond,
result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- result_pc_MUX_uxn_opcodes_h_l240_c7_c066
result_pc_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l240_c7_c066_cond,
result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- tmp16_MUX_uxn_opcodes_h_l240_c7_c066
tmp16_MUX_uxn_opcodes_h_l240_c7_c066 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l240_c7_c066_cond,
tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iftrue,
tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iffalse,
tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1
BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_left,
BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_right,
BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_left,
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_right,
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483
BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_left,
BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_right,
BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8
result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8
result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8
result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_cond,
result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8
result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d
CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_x,
CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0
BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_left,
BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_right,
BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output,
 CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output,
 BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output,
 CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l224_c3_c59a : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l221_c2_5854_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l228_c7_b5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l235_c3_fa4a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l238_c3_3692 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l237_c7_6088_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l245_c3_eb64 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l243_c3_a1f5 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l246_c24_68a1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_f1e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c24_2174_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l233_DUPLICATE_d4b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l216_l258_DUPLICATE_3d82_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l224_c3_c59a := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l224_c3_c59a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_f1e3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_f1e3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l245_c3_eb64 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l245_c3_eb64;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := tmp16;
     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l237_c7_6088_return_output := result.ram_addr;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l228_c7_b5d1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l237_c11_e56a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_left;
     BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output := BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output := result.stack_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l221_c2_5854_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l253_c11_d1c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l228_c11_1b84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_left;
     BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output := BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l221_c6_4488] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_left;
     BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output := BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l248_c11_8483] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_left;
     BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output := BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l235_c21_e366] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_left;
     BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output := BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l251_c34_cd2d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output := CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l240_c11_9ed6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_left;
     BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output := BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l232_c11_41b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l238_c21_8669] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_left;
     BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output := BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l233_DUPLICATE_d4b3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l233_DUPLICATE_d4b3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l243_c15_ba7e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l221_c6_4488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_1b84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_41b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_e56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_9ed6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l248_c11_8483_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_d1c0_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l235_c3_fa4a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l235_c21_e366_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l238_c3_3692 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_8669_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l243_c3_a1f5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_ba7e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l233_DUPLICATE_d4b3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l233_DUPLICATE_d4b3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l237_l232_l228_l221_l240_DUPLICATE_f4d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l237_l232_l228_l253_l248_l240_DUPLICATE_aff8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_4b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l237_l232_l228_l221_l253_l248_DUPLICATE_81a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_75df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l237_l232_l228_l221_l248_DUPLICATE_b1b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l221_c2_5854_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := VAR_result_pc_uxn_opcodes_h_l243_c3_a1f5;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l235_c3_fa4a;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l238_c3_3692;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l253_c7_31d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l234_c3_5cec] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_x <= VAR_CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output := CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l241_c3_b7e1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_left;
     BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output := BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l248_c7_fec8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l253_c7_31d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l251_c24_2174] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c24_2174_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l251_c34_cd2d_return_output);

     -- result_pc_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output := result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l248_c7_fec8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l221_c1_0bdf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c24_2174_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l234_c3_5cec_return_output;
     VAR_printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l221_c1_0bdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_31d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_31d0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l246_c24_68a1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l246_c24_68a1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_b7e1_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l248_c7_fec8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;

     -- printf_uxn_opcodes_h_l222_c3_a0cf[uxn_opcodes_h_l222_c3_a0cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l222_c3_a0cf_uxn_opcodes_h_l222_c3_a0cf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l248_c7_fec8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output := result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output := tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l248_c7_fec8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l246_c24_68a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l248_c7_fec8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output := tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output := result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l240_c7_c066] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_c066_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l237_c7_6088] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l237_c7_6088_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l232_c7_7e4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_7e4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output := tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l228_c7_b5d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_b5d1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l221_c2_5854_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l221_c2_5854] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l216_l258_DUPLICATE_3d82 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l216_l258_DUPLICATE_3d82_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ac32(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l221_c2_5854_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l221_c2_5854_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l216_l258_DUPLICATE_3d82_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l216_l258_DUPLICATE_3d82_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
