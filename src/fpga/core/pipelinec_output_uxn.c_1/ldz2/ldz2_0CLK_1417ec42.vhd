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
-- BIN_OP_EQ[uxn_opcodes_h_l1555_c6_1cf4]
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1555_c1_ad5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1555_c2_fcdf]
signal t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1556_c3_9d6a[uxn_opcodes_h_l1556_c3_9d6a]
signal printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_f6e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c7_e9b6]
signal t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_b5af]
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1563_c7_6daf]
signal t8_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1566_c30_f16b]
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1569_c11_6c96]
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1569_c7_107b]
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1569_c7_107b]
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c7_107b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c7_107b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c7_107b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c7_107b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1569_c7_107b]
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_430b]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1573_c7_e39a]
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_e39a]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_e39a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_e39a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1573_c7_e39a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_e39a]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1575_c3_23b2]
signal CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c33_c743]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_b5b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_9e84]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_9e84]
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_9e84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_9e84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_9e84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_9e84]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1579_c33_8fcb]
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_0d70]
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1581_c7_bff2]
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_bff2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_bff2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_bff2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1581_c7_bff2]
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1582_c3_75e2]
signal BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_ae52]
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_95ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_95ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_95ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1587_c7_95ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1589_c31_1499]
signal CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_4ac7]
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_00e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_00e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a88( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_left,
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_right,
BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf
tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- t8_MUX_uxn_opcodes_h_l1555_c2_fcdf
t8_MUX_uxn_opcodes_h_l1555_c2_fcdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond,
t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue,
t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse,
t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

-- printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a
printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a : entity work.printf_uxn_opcodes_h_l1556_c3_9d6a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6
tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c7_e9b6
t8_MUX_uxn_opcodes_h_l1560_c7_e9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond,
t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_left,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_right,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf
tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- t8_MUX_uxn_opcodes_h_l1563_c7_6daf
t8_MUX_uxn_opcodes_h_l1563_c7_6daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1563_c7_6daf_cond,
t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue,
t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse,
t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b
sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_ins,
sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_x,
sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_y,
sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_left,
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_right,
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1569_c7_107b
tmp16_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a
tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_cond,
tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2
CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_x,
CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84
tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_left,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_right,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_left,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_right,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2
tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_cond,
tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2
BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_left,
BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_right,
BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_left,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_right,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1589_c31_1499
CONST_SR_8_uxn_opcodes_h_l1589_c31_1499 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_x,
CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_left,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_right,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output,
 tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output,
 tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output,
 tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output,
 CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_4329 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_7f84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1567_c22_c953_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1571_c22_3f27_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_6076_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_0a13_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_ee81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1585_c21_9fb2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_711f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1589_c21_c0d8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_b82c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a38a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_e3fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_088f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1550_l1596_DUPLICATE_13e0_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_4329 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_4329;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_ee81 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_ee81;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_711f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_711f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_7f84 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_7f84;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_f6e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_b82c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_b82c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1567_c22_c953] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1567_c22_c953_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_b5af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1569_c11_6c96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1555_c6_1cf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a38a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a38a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_ae52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_left;
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output := BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_4ac7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_e3fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_e3fb_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_0d70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_088f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_088f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_430b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1589_c31_1499] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output := CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1566_c30_f16b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_ins;
     sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_x;
     sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output := sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c33_c743] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1579_c33_8fcb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_b5b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1571_c22_3f27] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1571_c22_3f27_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c6_1cf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_f6e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_b5af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_6c96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_430b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_b5b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_ae52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_4ac7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1567_c22_c953_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1571_c22_3f27_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_088f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1582_l1574_DUPLICATE_088f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_b82c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_b82c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1555_l1560_DUPLICATE_b82c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a38a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a38a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1578_l1555_l1560_DUPLICATE_a38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1581_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_f101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_e3fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_e3fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1555_l1569_l1560_DUPLICATE_e3fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1591_l1560_DUPLICATE_e2b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1587_l1578_l1573_l1569_l1563_DUPLICATE_d2b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1555_l1578_l1573_l1569_l1563_l1560_DUPLICATE_53c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1566_c30_f16b_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1582_c3_75e2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_left;
     BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output := BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_00e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1555_c1_ad5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1575_c3_23b2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output := CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1579_c22_0a13] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_0a13_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_8fcb_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1589_c21_c0d8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1589_c21_c0d8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1589_c31_1499_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1576_c22_6076] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_6076_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c33_c743_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_95ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_00e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_6076_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_0a13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1589_c21_c0d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1575_c3_23b2_return_output;
     VAR_printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1555_c1_ad5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_00e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_95ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1587_c7_95ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1581_c7_bff2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_cond;
     tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output := tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_95ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- printf_uxn_opcodes_h_l1556_c3_9d6a[uxn_opcodes_h_l1556_c3_9d6a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1556_c3_9d6a_uxn_opcodes_h_l1556_c3_9d6a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1585_c21_9fb2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1585_c21_9fb2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1582_c3_75e2_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_bff2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_9e84] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output := result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;

     -- t8_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1585_c21_9fb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_95ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_e39a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_9e84] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- t8_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1581_c7_bff2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_bff2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_9e84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_bff2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_bff2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_e39a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1573_c7_e39a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_cond;
     tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output := tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_9e84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_9e84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_9e84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_9e84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_e39a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_e39a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1573_c7_e39a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_e39a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c7_107b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1569_c7_107b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1563_c7_6daf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_6daf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_e9b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_e9b6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c2_fcdf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1550_l1596_DUPLICATE_13e0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1550_l1596_DUPLICATE_13e0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a88(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c2_fcdf_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1550_l1596_DUPLICATE_13e0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1550_l1596_DUPLICATE_13e0_return_output;
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
