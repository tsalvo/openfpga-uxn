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
entity lda2_0CLK_0d6e2712 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_0d6e2712;
architecture arch of lda2_0CLK_0d6e2712 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_e58a]
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_c449]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1678_c2_3799]
signal t16_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_3799]
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1678_c2_3799]
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1679_c3_e686[uxn_opcodes_h_l1679_c3_e686]
signal printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_154a]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1683_c7_e867]
signal t16_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_e867]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1683_c7_e867]
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_e309]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal t16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1686_c7_72a6]
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1688_c3_e7e7]
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_8668]
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal t16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1690_c7_ec57]
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1691_c3_9d3c]
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1693_c30_9551]
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_9694]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1696_c7_f0eb]
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_ce14]
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_eeb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_a928]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_a928]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_a928]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_a928]
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1700_c7_a928]
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1702_c3_6d15]
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_9ceb]
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_f373]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_f373]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_f373]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_f373]
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1704_c7_f373]
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1705_c3_f186]
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_a90d]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_a059]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_a059]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_a059]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_a059]
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1712_c31_2878]
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_08cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_b514]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_b514]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_left,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_right,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output);

-- t16_MUX_uxn_opcodes_h_l1678_c2_3799
t16_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
t16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
t16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1678_c2_3799
tmp16_MUX_uxn_opcodes_h_l1678_c2_3799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_cond,
tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue,
tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse,
tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

-- printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686
printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686 : entity work.printf_uxn_opcodes_h_l1679_c3_e686_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output);

-- t16_MUX_uxn_opcodes_h_l1683_c7_e867
t16_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
t16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
t16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1683_c7_e867
tmp16_MUX_uxn_opcodes_h_l1683_c7_e867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_cond,
tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue,
tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse,
tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output);

-- t16_MUX_uxn_opcodes_h_l1686_c7_72a6
t16_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6
tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond,
tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7
CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_x,
CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_left,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_right,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output);

-- t16_MUX_uxn_opcodes_h_l1690_c7_ec57
t16_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57
tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond,
tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue,
tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse,
tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c
BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_left,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_right,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1693_c30_9551
sp_relative_shift_uxn_opcodes_h_l1693_c30_9551 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_ins,
sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_x,
sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_y,
sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb
tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond,
tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_left,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_right,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_cond,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1700_c7_a928
tmp16_MUX_uxn_opcodes_h_l1700_c7_a928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_cond,
tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue,
tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse,
tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15
CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_x,
CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_left,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_right,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_cond,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1704_c7_f373
tmp16_MUX_uxn_opcodes_h_l1704_c7_f373 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_cond,
tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue,
tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse,
tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186
BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_left,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_right,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_cond,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1712_c31_2878
CONST_SR_8_uxn_opcodes_h_l1712_c31_2878 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_x,
CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output,
 t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output,
 t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output,
 t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output,
 t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output,
 tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output,
 CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output,
 tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output,
 CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_5b8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_fb6f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1698_c3_2660 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_d84a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_35a6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_fc85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_f8dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1687_l1691_DUPLICATE_8812_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_4a7d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1719_l1674_DUPLICATE_6bc9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_d84a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_d84a;
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_fb6f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_fb6f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_5b8a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_5b8a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_fc85 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_fc85;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_154a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_a90d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1687_l1691_DUPLICATE_8812 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1687_l1691_DUPLICATE_8812_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_eeb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_08cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_e58a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_4a7d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_4a7d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_9694] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_ce14] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1712_c31_2878] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output := CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_e309] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1693_c30_9551] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_ins;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_x;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output := sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_8668] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_left;
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output := BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_9ceb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_e58a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_154a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_e309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_8668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9694_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_eeb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_9ceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_a90d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_08cb_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1698_c3_2660 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_ce14_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1687_l1691_DUPLICATE_8812_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1687_l1691_DUPLICATE_8812_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_4a7d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_4a7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_648f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_b25e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_fa9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_c52c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_7e6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_fab9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_e17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_9551_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1698_c3_2660;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_b514] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_b514] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1712_c21_f8dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_f8dd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2878_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_a059] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1705_c3_f186] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_left;
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output := BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_c449] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1702_c3_6d15] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output := CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1691_c3_9d3c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_left;
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output := BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1688_c3_e7e7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output := CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_9d3c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_f8dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_e7e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_6d15_return_output;
     VAR_printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_c449_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_b514_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_b514_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_a059] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_a059] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_f373] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;

     -- t16_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- printf_uxn_opcodes_h_l1679_c3_e686[uxn_opcodes_h_l1679_c3_e686] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1679_c3_e686_uxn_opcodes_h_l1679_c3_e686_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_a059] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output := result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1704_c7_f373] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_cond;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output := tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1708_c21_35a6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_35a6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_f186_return_output);

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_35a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_a059_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_a928] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_f373] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_f373] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output := result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_f373] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1700_c7_a928] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_cond;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output := tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_f373_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_a928] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_a928] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output := result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;

     -- t16_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     t16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     t16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_a928] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_a928_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     t16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     t16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_f0eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f0eb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_ec57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_ec57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_72a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_72a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_e867] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_e867_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_3799] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1719_l1674_DUPLICATE_6bc9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1719_l1674_DUPLICATE_6bc9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_3799_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_3799_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1719_l1674_DUPLICATE_6bc9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1719_l1674_DUPLICATE_6bc9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
