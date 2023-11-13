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
-- Submodules: 79
entity add2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_f74041be;
architecture arch of add2_0CLK_f74041be is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l830_c6_c197]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_538b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal t16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l830_c2_0bc1]
signal n16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l831_c3_d59a[uxn_opcodes_h_l831_c3_d59a]
signal printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_7a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal t16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l835_c7_d2e5]
signal n16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_4505]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l838_c7_7dad]
signal tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_7dad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_7dad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_7dad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_7dad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_7dad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_7dad]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l838_c7_7dad]
signal t16_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l838_c7_7dad]
signal n16_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_d780]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l843_c7_aed3]
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_aed3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_aed3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_aed3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_aed3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_aed3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l843_c7_aed3]
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l843_c7_aed3]
signal t16_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l843_c7_aed3]
signal n16_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l844_c3_e22d]
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l847_c11_4b39]
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l847_c7_4773]
signal tmp16_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_4773]
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_4773]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_4773]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_4773]
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_4773]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l847_c7_4773]
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l847_c7_4773]
signal n16_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_03ef]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l851_c7_e816]
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_e816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_e816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_e816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_e816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_e816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c7_e816]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l851_c7_e816]
signal n16_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l852_c3_a1c7]
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_0bbb]
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l855_c30_54b0]
signal sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_e253]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_c7f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_c7f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_c7f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_c7f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l860_c7_c7f4]
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l863_c31_948b]
signal CONST_SR_8_uxn_opcodes_h_l863_c31_948b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_d520]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_1860]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_1860]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197
BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1
tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1
result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c2_0bc1
t16_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- n16_MUX_uxn_opcodes_h_l830_c2_0bc1
n16_MUX_uxn_opcodes_h_l830_c2_0bc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond,
n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue,
n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse,
n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

-- printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a
printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a : entity work.printf_uxn_opcodes_h_l831_c3_d59a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e
BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5
tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5
result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- t16_MUX_uxn_opcodes_h_l835_c7_d2e5
t16_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- n16_MUX_uxn_opcodes_h_l835_c7_d2e5
n16_MUX_uxn_opcodes_h_l835_c7_d2e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond,
n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue,
n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse,
n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505
BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output);

-- tmp16_MUX_uxn_opcodes_h_l838_c7_7dad
tmp16_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad
result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- t16_MUX_uxn_opcodes_h_l838_c7_7dad
t16_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
t16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
t16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- n16_MUX_uxn_opcodes_h_l838_c7_7dad
n16_MUX_uxn_opcodes_h_l838_c7_7dad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l838_c7_7dad_cond,
n16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue,
n16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse,
n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780
BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output);

-- tmp16_MUX_uxn_opcodes_h_l843_c7_aed3
tmp16_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- t16_MUX_uxn_opcodes_h_l843_c7_aed3
t16_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
t16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
t16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- n16_MUX_uxn_opcodes_h_l843_c7_aed3
n16_MUX_uxn_opcodes_h_l843_c7_aed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l843_c7_aed3_cond,
n16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue,
n16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse,
n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d
BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_left,
BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_right,
BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39
BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_left,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_right,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l847_c7_4773
tmp16_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l847_c7_4773_cond,
tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773
result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_cond,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- n16_MUX_uxn_opcodes_h_l847_c7_4773
n16_MUX_uxn_opcodes_h_l847_c7_4773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l847_c7_4773_cond,
n16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue,
n16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse,
n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef
BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l851_c7_e816
tmp16_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l851_c7_e816_cond,
tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- n16_MUX_uxn_opcodes_h_l851_c7_e816
n16_MUX_uxn_opcodes_h_l851_c7_e816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l851_c7_e816_cond,
n16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue,
n16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse,
n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7
BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_left,
BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_right,
BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_left,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_right,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l855_c30_54b0
sp_relative_shift_uxn_opcodes_h_l855_c30_54b0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_ins,
sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_x,
sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_y,
sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4
result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l863_c31_948b
CONST_SR_8_uxn_opcodes_h_l863_c31_948b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l863_c31_948b_x,
CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output,
 tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output,
 tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output,
 tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output,
 tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output,
 tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output,
 tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output,
 BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output,
 sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output,
 CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_2e6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_fdda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_ab45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_689c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l853_c3_9dc3 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_9587 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_ecab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_b888 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_948b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_1c4d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l852_l848_DUPLICATE_d712_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_fb52_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l826_l870_DUPLICATE_d739_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_b888 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_b888;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_689c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_689c;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_9587 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_9587;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_fdda := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_fdda;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_2e6b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_2e6b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_ab45 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_ab45;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_948b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l863_c31_948b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l863_c31_948b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_948b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output := CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_d780] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l830_c6_c197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_03ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_4505] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_e253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l847_c11_4b39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_left;
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output := BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_fb52 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_fb52_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_d520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_7a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l852_l848_DUPLICATE_d712 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l852_l848_DUPLICATE_d712_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l855_c30_54b0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_ins;
     sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_x;
     sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output := sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_c197_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_7a5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_4505_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_d780_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_4b39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_03ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d520_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l852_l848_DUPLICATE_d712_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l852_l848_DUPLICATE_d712_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l844_l852_l848_DUPLICATE_d712_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_5d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_a30b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_3f9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_1ddc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_fb52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_fb52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_4191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_54b0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l844_c3_e22d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_left;
     BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output := BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_1860] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_1860] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_c7f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l852_c3_a1c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_left;
     BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output := BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_538b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l863_c21_1c4d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_1c4d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_948b_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_c7f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_e22d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_right := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_a1c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_1c4d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l849_DUPLICATE_9603_return_output;
     VAR_printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_538b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_1860_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_1860_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_c7f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l860_c7_c7f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- t16_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     t16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     t16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- n16_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     n16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     n16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output := n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_c7f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;

     -- printf_uxn_opcodes_h_l831_c3_d59a[uxn_opcodes_h_l831_c3_d59a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l831_c3_d59a_uxn_opcodes_h_l831_c3_d59a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_0bbb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l853_c3_9dc3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_0bbb_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_n16_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_c7f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := VAR_tmp16_uxn_opcodes_h_l853_c3_9dc3;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l858_c21_ecab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_ecab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l853_c3_9dc3);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output := tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- n16_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     n16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     n16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output := n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- t16_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     t16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     t16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_ecab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l851_c7_e816] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- n16_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     n16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     n16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- t16_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output := tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e816_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l847_c7_4773] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_cond;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output := result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- t16_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- n16_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     n16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     n16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_4773_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- n16_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l843_c7_aed3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output := result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aed3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_7dad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;

     -- n16_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_7dad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_d2e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_d2e5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l830_c2_0bc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l826_l870_DUPLICATE_d739 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l826_l870_DUPLICATE_d739_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_0bc1_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l826_l870_DUPLICATE_d739_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l826_l870_DUPLICATE_d739_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
