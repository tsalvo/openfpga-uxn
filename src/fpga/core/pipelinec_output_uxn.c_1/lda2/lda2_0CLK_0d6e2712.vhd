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
-- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_4ae7]
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_9f4a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1678_c2_d759]
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_d759]
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1678_c2_d759]
signal t16_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1679_c3_894b[uxn_opcodes_h_l1679_c3_894b]
signal printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_fa3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1683_c7_f10e]
signal t16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_b3b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1686_c7_f553]
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_f553]
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1686_c7_f553]
signal t16_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1688_c3_cd29]
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_a07f]
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1690_c7_eae5]
signal t16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1691_c3_ca0f]
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1693_c30_f718]
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_0736]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1696_c7_52db]
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_52db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_52db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_52db]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_52db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_52db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_52db]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_fce3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_0d34]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1700_c7_50dc]
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_50dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_50dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_50dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_50dc]
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1702_c3_08f7]
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_ad0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1704_c7_039c]
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_039c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_039c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_039c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_039c]
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1705_c3_6203]
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_e00f]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_b857]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_b857]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_b857]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_b857]
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1712_c31_841d]
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_97b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_cdc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_cdc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_856e( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_left,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_right,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1678_c2_d759
tmp16_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- t16_MUX_uxn_opcodes_h_l1678_c2_d759
t16_MUX_uxn_opcodes_h_l1678_c2_d759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1678_c2_d759_cond,
t16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue,
t16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse,
t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

-- printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b
printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b : entity work.printf_uxn_opcodes_h_l1679_c3_894b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e
tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- t16_MUX_uxn_opcodes_h_l1683_c7_f10e
t16_MUX_uxn_opcodes_h_l1683_c7_f10e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond,
t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue,
t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse,
t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1686_c7_f553
tmp16_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- t16_MUX_uxn_opcodes_h_l1686_c7_f553
t16_MUX_uxn_opcodes_h_l1686_c7_f553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1686_c7_f553_cond,
t16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue,
t16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse,
t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29
CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_x,
CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_left,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_right,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5
tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- t16_MUX_uxn_opcodes_h_l1690_c7_eae5
t16_MUX_uxn_opcodes_h_l1690_c7_eae5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond,
t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue,
t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse,
t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f
BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_left,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_right,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1693_c30_f718
sp_relative_shift_uxn_opcodes_h_l1693_c30_f718 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_ins,
sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_x,
sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_y,
sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1696_c7_52db
tmp16_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc
tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_cond,
tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7
CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_x,
CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1704_c7_039c
tmp16_MUX_uxn_opcodes_h_l1704_c7_039c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_cond,
tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203
BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_left,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_right,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_cond,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1712_c31_841d
CONST_SR_8_uxn_opcodes_h_l1712_c31_841d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_x,
CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output,
 CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output,
 tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output,
 tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output,
 CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output,
 CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_72b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_523b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1698_c3_21f8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_3cd8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_d833_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_c3c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_23ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_c5ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_a90c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1719_l1674_DUPLICATE_e104_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_3cd8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_3cd8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_72b0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_72b0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_c3c4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_c3c4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_523b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_523b;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_c5ad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_c5ad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_97b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_0736] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_a90c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_a90c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_ad0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_a07f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_fa3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1693_c30_f718] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_ins;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_x;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output := sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_4ae7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_0d34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_fce3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_e00f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_b3b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1712_c31_841d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output := CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_4ae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_fa3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_b3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a07f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_0736_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_0d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_ad0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e00f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_97b8_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1698_c3_21f8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_fce3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_c5ad_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_c5ad_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_a90c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1701_l1705_DUPLICATE_a90c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1678_l1690_l1683_l1686_DUPLICATE_e963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_8bd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1704_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_98dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1678_l1683_l1696_l1686_DUPLICATE_fb13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1714_l1683_l1710_DUPLICATE_63c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_l1696_l1690_l1686_l1710_DUPLICATE_c1be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1700_l1696_l1690_l1686_l1683_l1710_DUPLICATE_0503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_f718_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1698_c3_21f8;
     -- CONST_SL_8[uxn_opcodes_h_l1688_c3_cd29] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output := CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_cdc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1705_c3_6203] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_left;
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output := BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1702_c3_08f7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output := CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1691_c3_ca0f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_left;
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output := BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_cdc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1712_c21_23ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_23ab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_841d_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_9f4a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_b857] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_ca0f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_23ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_cd29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_08f7_return_output;
     VAR_printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_9f4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_cdc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_b857] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output := result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1708_c21_d833] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_d833_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_6203_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_b857] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1704_c7_039c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_cond;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output := tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_b857] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;

     -- printf_uxn_opcodes_h_l1679_c3_894b[uxn_opcodes_h_l1679_c3_894b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1679_c3_894b_uxn_opcodes_h_l1679_c3_894b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_039c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_d833_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_b857_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_039c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_039c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1700_c7_50dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_cond;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output := tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_50dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     t16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     t16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_039c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_039c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_50dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_50dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_50dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_50dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- t16_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     t16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     t16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_52db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_52db_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_eae5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_eae5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_f553] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_f553_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_f10e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_f10e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_d759] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1719_l1674_DUPLICATE_e104 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1719_l1674_DUPLICATE_e104_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_856e(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_d759_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_d759_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1719_l1674_DUPLICATE_e104_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1719_l1674_DUPLICATE_e104_return_output;
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
