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
entity ldz2_0CLK_1417ec42 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_1417ec42;
architecture arch of ldz2_0CLK_1417ec42 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1555_c6_a200]
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1555_c1_09d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1555_c2_396b]
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1555_c2_396b]
signal t8_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1555_c2_396b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1556_c3_38e1[uxn_opcodes_h_l1556_c3_38e1]
signal printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_810a]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal t8_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c7_cda5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_379c]
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1563_c7_034c]
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1563_c7_034c]
signal t8_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_034c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1566_c30_dbd4]
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1569_c11_a99c]
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1569_c7_8988]
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1569_c7_8988]
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1569_c7_8988]
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c7_8988]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c7_8988]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c7_8988]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c7_8988]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_784a]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1573_c7_314f]
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_314f]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_314f]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_314f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1573_c7_314f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_314f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1575_c3_9354]
signal CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c33_3d9b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_afca]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_e3c3]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_e3c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_e3c3]
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_e3c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_e3c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_e3c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1579_c33_1bed]
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_86dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1581_c7_c69a]
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_c69a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1581_c7_c69a]
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_c69a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_c69a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1582_c3_7351]
signal BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_7033]
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_78d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1587_c7_78d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_78d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_78d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1589_c31_08b7]
signal CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_40a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_fefe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_fefe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output : unsigned(0 downto 0);

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

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9969( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_left,
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_right,
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1555_c2_396b
tmp16_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- t8_MUX_uxn_opcodes_h_l1555_c2_396b
t8_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
t8_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
t8_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

-- printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1
printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1 : entity work.printf_uxn_opcodes_h_l1556_c3_38e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5
tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c7_cda5
t8_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_left,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_right,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1563_c7_034c
tmp16_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- t8_MUX_uxn_opcodes_h_l1563_c7_034c
t8_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
t8_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
t8_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4
sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_ins,
sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_x,
sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_y,
sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_left,
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_right,
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1569_c7_8988
tmp16_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1573_c7_314f
tmp16_MUX_uxn_opcodes_h_l1573_c7_314f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_cond,
tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1575_c3_9354
CONST_SL_8_uxn_opcodes_h_l1575_c3_9354 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_x,
CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3
tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_left,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_right,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a
tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_cond,
tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351
BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_left,
BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_right,
BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_left,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_right,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7
CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_x,
CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output,
 CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_60fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_aa5a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1567_c22_85ff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1571_c22_6a9e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_cf8d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_e948_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_6195 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1585_c21_87e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_791b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1589_c21_a7b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a4b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_1468_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_3616_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_f32a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1596_l1550_DUPLICATE_312d_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_60fa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_60fa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_aa5a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_aa5a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_791b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_791b;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_6195 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_6195;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1555_c6_a200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_left;
     BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output := BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1566_c30_dbd4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_ins;
     sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_x;
     sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output := sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_7033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_left;
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output := BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a4b7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a4b7_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_810a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_86dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1579_c33_1bed] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_1468 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_1468_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1589_c31_08b7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output := CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_40a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_afca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_784a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1567_c22_85ff] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1567_c22_85ff_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c33_3d9b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1569_c11_a99c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_f32a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_f32a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_379c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1571_c22_6a9e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1571_c22_6a9e_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_3616 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_3616_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_a200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_810a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_379c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_a99c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_784a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_afca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_86dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_7033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_40a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1567_c22_85ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1571_c22_6a9e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_f32a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_f32a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_1468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_1468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_1468_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a4b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a4b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a4b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1581_l1578_l1573_l1569_DUPLICATE_3937_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_3616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_3616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_3616_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1563_l1591_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_8bb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1563_l1587_l1578_l1573_l1569_DUPLICATE_8c3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1563_l1560_l1587_l1555_l1578_l1573_l1569_DUPLICATE_3c9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_dbd4_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1589_c21_a7b6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1589_c21_a7b6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_08b7_return_output);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1576_c22_cf8d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_cf8d_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_3d9b_return_output);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1579_c22_e948] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_e948_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_1bed_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1555_c1_09d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1582_c3_7351] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_left;
     BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output := BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_78d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_fefe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_fefe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     t8_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     t8_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1575_c3_9354] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output := CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_cf8d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_e948_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1589_c21_a7b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_9354_return_output;
     VAR_printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_09d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_fefe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1585_c21_87e0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1585_c21_87e0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_7351_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_78d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;

     -- printf_uxn_opcodes_h_l1556_c3_38e1[uxn_opcodes_h_l1556_c3_38e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1556_c3_38e1_uxn_opcodes_h_l1556_c3_38e1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1587_c7_78d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_c69a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1581_c7_c69a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_cond;
     tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output := tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_e3c3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_78d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1585_c21_87e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_78d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;
     -- t8_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     t8_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     t8_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_e3c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_e3c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_c69a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_c69a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_314f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1581_c7_c69a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_c69a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_e3c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_e3c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_e3c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1573_c7_314f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_cond;
     tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output := tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_314f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_e3c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_314f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1573_c7_314f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_314f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_314f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c7_8988] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_8988_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_034c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_034c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c7_cda5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_cda5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1555_c2_396b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1596_l1550_DUPLICATE_312d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1596_l1550_DUPLICATE_312d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9969(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_396b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_396b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1596_l1550_DUPLICATE_312d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1596_l1550_DUPLICATE_312d_return_output;
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
