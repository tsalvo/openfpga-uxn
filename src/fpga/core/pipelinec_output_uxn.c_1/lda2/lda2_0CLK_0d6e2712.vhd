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
-- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_6bba]
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_192c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1678_c2_2a7b]
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1679_c3_3a6a[uxn_opcodes_h_l1679_c3_3a6a]
signal printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_3db3]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1683_c7_b5e4]
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_32dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_3357]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1686_c7_3357]
signal t16_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1686_c7_3357]
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1688_c3_db75]
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_9bef]
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_765a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1690_c7_765a]
signal t16_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1690_c7_765a]
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1691_c3_a768]
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1693_c30_7a6f]
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_4bd7]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1696_c7_46c0]
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_4812]
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_e93e]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_c3ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_c3ca]
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_c3ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_c3ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1700_c7_c3ca]
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1702_c3_7cad]
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_421a]
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_e943]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_e943]
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_e943]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_e943]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1704_c7_e943]
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1705_c3_9499]
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_7ce5]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_7ac4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_7ac4]
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_7ac4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_7ac4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1712_c31_2bc6]
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_dafb]
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_e975]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_e975]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a310( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
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
-- BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_left,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_right,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- t16_MUX_uxn_opcodes_h_l1678_c2_2a7b
t16_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b
tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond,
tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

-- printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a
printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a : entity work.printf_uxn_opcodes_h_l1679_c3_3a6a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- t16_MUX_uxn_opcodes_h_l1683_c7_b5e4
t16_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4
tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond,
tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- t16_MUX_uxn_opcodes_h_l1686_c7_3357
t16_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
t16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
t16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1686_c7_3357
tmp16_MUX_uxn_opcodes_h_l1686_c7_3357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_cond,
tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue,
tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse,
tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1688_c3_db75
CONST_SL_8_uxn_opcodes_h_l1688_c3_db75 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_x,
CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_left,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_right,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- t16_MUX_uxn_opcodes_h_l1690_c7_765a
t16_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
t16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
t16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1690_c7_765a
tmp16_MUX_uxn_opcodes_h_l1690_c7_765a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_cond,
tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768
BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_left,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_right,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f
sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_ins,
sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_x,
sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_y,
sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0
tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_cond,
tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_left,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_right,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca
tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond,
tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad
CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_x,
CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_left,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_right,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_cond,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1704_c7_e943
tmp16_MUX_uxn_opcodes_h_l1704_c7_e943 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_cond,
tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue,
tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse,
tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499
BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_left,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_right,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6
CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_x,
CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_left,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_right,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output,
 CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output,
 sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output,
 CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output,
 tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output,
 CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_bfef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_fcb3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1698_c3_b512 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_9d6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_84fe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_f998 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_bde2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_5ab9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_3376_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1719_l1674_DUPLICATE_7302_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_9d6d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_9d6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_f998 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_f998;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_bfef := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_bfef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_fcb3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_fcb3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1712_c31_2bc6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output := CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_9bef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_3376 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_3376_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_e93e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_5ab9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_5ab9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1693_c30_7a6f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_ins;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_x;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output := sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_32dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_7ce5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_4812] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_421a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_4bd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_3db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_6bba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_dafb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_6bba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_3db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_32dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_9bef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_4bd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_e93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_421a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_7ce5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_dafb_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1698_c3_b512 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_4812_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_5ab9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_5ab9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_3376_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_3376_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1683_l1686_l1678_l1690_DUPLICATE_e7df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_fcac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1683_l1710_l1704_l1700_l1696_l1690_l1686_l1714_DUPLICATE_0060_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1683_l1696_l1686_l1678_DUPLICATE_6432_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_l1714_DUPLICATE_b5ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1710_l1700_l1696_l1690_l1686_DUPLICATE_eb12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1683_l1710_l1678_l1700_l1696_l1690_l1686_DUPLICATE_5b35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_7a6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1698_c3_b512;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_7ac4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_e975] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_192c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1691_c3_a768] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_left;
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output := BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1688_c3_db75] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output := CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_e975] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1702_c3_7cad] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output := CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1712_c21_bde2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_bde2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_2bc6_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1705_c3_9499] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_left;
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output := BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_a768_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_bde2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_db75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_7cad_return_output;
     VAR_printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_192c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_e975_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_e975_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     t16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     t16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_e943] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1708_c21_84fe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_84fe_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_9499_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_7ac4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1704_c7_e943] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_cond;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output := tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_7ac4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- printf_uxn_opcodes_h_l1679_c3_3a6a[uxn_opcodes_h_l1679_c3_3a6a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1679_c3_3a6a_uxn_opcodes_h_l1679_c3_3a6a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_7ac4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_84fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_7ac4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1700_c7_c3ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output := tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_c3ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_e943] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;

     -- t16_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     t16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     t16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_e943] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_e943] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output := result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_e943_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_c3ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_c3ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_c3ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_c3ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_46c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_46c0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_765a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_765a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_3357] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_3357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_b5e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_b5e4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_2a7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1719_l1674_DUPLICATE_7302 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1719_l1674_DUPLICATE_7302_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a310(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_2a7b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1719_l1674_DUPLICATE_7302_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1719_l1674_DUPLICATE_7302_return_output;
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
