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
-- BIN_OP_EQ[uxn_opcodes_h_l830_c6_0cc9]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_d1e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l830_c2_99de]
signal n16_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l830_c2_99de]
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_99de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_99de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_99de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_99de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_99de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c2_99de]
signal t16_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l830_c2_99de]
signal tmp16_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l831_c3_6d65[uxn_opcodes_h_l831_c3_6d65]
signal printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_e27c]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l835_c7_2399]
signal n16_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_2399]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_2399]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_2399]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_2399]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_2399]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_2399]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l835_c7_2399]
signal t16_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l835_c7_2399]
signal tmp16_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_7186]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l838_c7_2fac]
signal n16_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_2fac]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_2fac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_2fac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_2fac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_2fac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_2fac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l838_c7_2fac]
signal t16_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l838_c7_2fac]
signal tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_da1e]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l843_c7_aee5]
signal n16_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l843_c7_aee5]
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_aee5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_aee5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_aee5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_aee5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_aee5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l843_c7_aee5]
signal t16_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l843_c7_aee5]
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l844_c3_473e]
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l847_c11_f150]
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l847_c7_5210]
signal n16_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l847_c7_5210]
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_5210]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_5210]
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_5210]
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_5210]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_5210]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l847_c7_5210]
signal tmp16_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_a212]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l851_c7_e8de]
signal n16_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c7_e8de]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_e8de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_e8de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_e8de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_e8de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_e8de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l851_c7_e8de]
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l852_c3_ebf1]
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_438f]
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l855_c30_fb90]
signal sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_618f]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l860_c7_85a3]
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_85a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_85a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_85a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_85a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l863_c31_19ca]
signal CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_0cc3]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_4f5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_4f5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9
BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output);

-- n16_MUX_uxn_opcodes_h_l830_c2_99de
n16_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l830_c2_99de_cond,
n16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
n16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de
result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_cond,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c2_99de
t16_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c2_99de_cond,
t16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
t16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l830_c2_99de
tmp16_MUX_uxn_opcodes_h_l830_c2_99de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l830_c2_99de_cond,
tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue,
tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse,
tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

-- printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65
printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65 : entity work.printf_uxn_opcodes_h_l831_c3_6d65_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output);

-- n16_MUX_uxn_opcodes_h_l835_c7_2399
n16_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l835_c7_2399_cond,
n16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
n16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399
result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- t16_MUX_uxn_opcodes_h_l835_c7_2399
t16_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l835_c7_2399_cond,
t16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
t16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- tmp16_MUX_uxn_opcodes_h_l835_c7_2399
tmp16_MUX_uxn_opcodes_h_l835_c7_2399 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l835_c7_2399_cond,
tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue,
tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse,
tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186
BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output);

-- n16_MUX_uxn_opcodes_h_l838_c7_2fac
n16_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
n16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
n16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- t16_MUX_uxn_opcodes_h_l838_c7_2fac
t16_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
t16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
t16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l838_c7_2fac
tmp16_MUX_uxn_opcodes_h_l838_c7_2fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_cond,
tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue,
tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse,
tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e
BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output);

-- n16_MUX_uxn_opcodes_h_l843_c7_aee5
n16_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
n16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
n16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- t16_MUX_uxn_opcodes_h_l843_c7_aee5
t16_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
t16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
t16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l843_c7_aee5
tmp16_MUX_uxn_opcodes_h_l843_c7_aee5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_cond,
tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue,
tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse,
tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l844_c3_473e
BIN_OP_OR_uxn_opcodes_h_l844_c3_473e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_left,
BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_right,
BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150
BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_left,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_right,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output);

-- n16_MUX_uxn_opcodes_h_l847_c7_5210
n16_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l847_c7_5210_cond,
n16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
n16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210
result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_cond,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- tmp16_MUX_uxn_opcodes_h_l847_c7_5210
tmp16_MUX_uxn_opcodes_h_l847_c7_5210 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l847_c7_5210_cond,
tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue,
tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse,
tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output);

-- n16_MUX_uxn_opcodes_h_l851_c7_e8de
n16_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
n16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
n16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l851_c7_e8de
tmp16_MUX_uxn_opcodes_h_l851_c7_e8de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_cond,
tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue,
tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse,
tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1
BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_left,
BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_right,
BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_left,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_right,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l855_c30_fb90
sp_relative_shift_uxn_opcodes_h_l855_c30_fb90 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_ins,
sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_x,
sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_y,
sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f
BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3
result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l863_c31_19ca
CONST_SR_8_uxn_opcodes_h_l863_c31_19ca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_x,
CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3
BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4
CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output,
 n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output,
 n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output,
 n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output,
 n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output,
 n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output,
 n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output,
 sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output,
 CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_98f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_9442 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_3a42 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_8831 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_da78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l853_c3_0bf6 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_7ae9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_7bca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_5dc2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l844_l848_l852_l839_DUPLICATE_7ad2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_608a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l870_l826_DUPLICATE_369b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_9442 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_9442;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_8831 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_8831;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_da78 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_da78;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_98f1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_98f1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_7bca := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_7bca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_3a42 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_3a42;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_0cc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_da1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l830_c6_0cc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_618f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l863_c31_19ca] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_x <= VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output := CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l855_c30_fb90] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_ins;
     sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_x <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_x;
     sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_y <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output := sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_608a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_608a_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l844_l848_l852_l839_DUPLICATE_7ad2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l844_l848_l852_l839_DUPLICATE_7ad2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l847_c11_f150] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_left;
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output := BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_e27c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_a212] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_7186] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_0cc9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e27c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_7186_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_da1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_f150_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_618f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_0cc3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l844_l848_l852_l839_DUPLICATE_7ad2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l844_l848_l852_l839_DUPLICATE_7ad2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l844_l848_l852_l839_DUPLICATE_7ad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l851_l847_DUPLICATE_234a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l838_l835_l865_l860_l851_l847_DUPLICATE_b979_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_4fa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l838_l835_l865_l830_l860_l847_DUPLICATE_ab8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_608a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l847_DUPLICATE_608a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l843_l838_l835_l830_l860_l847_DUPLICATE_9cf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_fb90_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_d1e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_85a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l852_c3_ebf1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_left;
     BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output := BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l863_c21_5dc2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_5dc2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_19ca_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_4f5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_4f5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l844_c3_473e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_left;
     BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output := BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_85a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_473e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_ebf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_5dc2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_a9d4_return_output;
     VAR_printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_d1e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_4f5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_438f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_85a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;

     -- t16_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     t16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     t16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- printf_uxn_opcodes_h_l831_c3_6d65[uxn_opcodes_h_l831_c3_6d65] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l831_c3_6d65_uxn_opcodes_h_l831_c3_6d65_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l860_c7_85a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_85a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     n16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     n16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l853_c3_0bf6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_438f_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_n16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_85a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := VAR_tmp16_uxn_opcodes_h_l853_c3_0bf6;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l858_c21_7ae9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_7ae9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l853_c3_0bf6);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- n16_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     n16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     n16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output := n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- t16_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     t16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     t16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_7ae9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_t16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- n16_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     n16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     n16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output := tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l851_c7_e8de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;

     -- t16_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     t16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     t16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output := t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e8de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_t16_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l847_c7_5210] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_cond;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output := result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- t16_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     t16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output := t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- n16_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     n16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     n16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_n16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_5210_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l830_c2_99de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- n16_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     n16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     n16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output := n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l843_c7_aee5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output := result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_aee5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output := tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- n16_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     n16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     n16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output := n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_2fac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l830_c2_99de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2fac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_2399] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output := tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_2399_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_99de_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l830_c2_99de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output := result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l870_l826_DUPLICATE_369b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l870_l826_DUPLICATE_369b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_99de_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_99de_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l870_l826_DUPLICATE_369b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l870_l826_DUPLICATE_369b_return_output;
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
