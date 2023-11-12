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
-- BIN_OP_EQ[uxn_opcodes_h_l830_c6_6fe6]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_760e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l830_c2_297f]
signal n16_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c2_297f]
signal t16_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_297f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_297f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_297f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_297f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_297f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l830_c2_297f]
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l830_c2_297f]
signal tmp16_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l831_c3_a49b[uxn_opcodes_h_l831_c3_a49b]
signal printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_e448]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l835_c7_897d]
signal n16_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l835_c7_897d]
signal t16_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_897d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_897d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_897d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_897d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_897d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_897d]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l835_c7_897d]
signal tmp16_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_d3a4]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l838_c7_d560]
signal n16_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l838_c7_d560]
signal t16_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_d560]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_d560]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_d560]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_d560]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_d560]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_d560]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l838_c7_d560]
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_1c0e]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l843_c7_e956]
signal n16_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l843_c7_e956]
signal t16_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_e956]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_e956]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_e956]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_e956]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_e956]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l843_c7_e956]
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l843_c7_e956]
signal tmp16_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l844_c3_b9fe]
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l847_c11_6948]
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l847_c7_689f]
signal n16_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_689f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_689f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_689f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_689f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_689f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l847_c7_689f]
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l847_c7_689f]
signal tmp16_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_c761]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l851_c7_0b77]
signal n16_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_0b77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_0b77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_0b77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_0b77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_0b77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c7_0b77]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l851_c7_0b77]
signal tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l852_c3_3ba9]
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_2e1c]
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l855_c30_ce3c]
signal sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_07a2]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_a421]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_a421]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_a421]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_a421]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l860_c7_a421]
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l863_c31_3669]
signal CONST_SR_8_uxn_opcodes_h_l863_c31_3669_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_d130]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_6f1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_6f1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6
BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output);

-- n16_MUX_uxn_opcodes_h_l830_c2_297f
n16_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l830_c2_297f_cond,
n16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
n16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c2_297f
t16_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c2_297f_cond,
t16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
t16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f
result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_cond,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l830_c2_297f
tmp16_MUX_uxn_opcodes_h_l830_c2_297f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l830_c2_297f_cond,
tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue,
tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse,
tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

-- printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b
printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b : entity work.printf_uxn_opcodes_h_l831_c3_a49b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output);

-- n16_MUX_uxn_opcodes_h_l835_c7_897d
n16_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l835_c7_897d_cond,
n16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
n16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- t16_MUX_uxn_opcodes_h_l835_c7_897d
t16_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l835_c7_897d_cond,
t16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
t16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d
result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l835_c7_897d
tmp16_MUX_uxn_opcodes_h_l835_c7_897d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l835_c7_897d_cond,
tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue,
tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse,
tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4
BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output);

-- n16_MUX_uxn_opcodes_h_l838_c7_d560
n16_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l838_c7_d560_cond,
n16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
n16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- t16_MUX_uxn_opcodes_h_l838_c7_d560
t16_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l838_c7_d560_cond,
t16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
t16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560
result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- tmp16_MUX_uxn_opcodes_h_l838_c7_d560
tmp16_MUX_uxn_opcodes_h_l838_c7_d560 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l838_c7_d560_cond,
tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue,
tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse,
tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e
BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output);

-- n16_MUX_uxn_opcodes_h_l843_c7_e956
n16_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l843_c7_e956_cond,
n16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
n16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- t16_MUX_uxn_opcodes_h_l843_c7_e956
t16_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l843_c7_e956_cond,
t16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
t16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956
result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_cond,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- tmp16_MUX_uxn_opcodes_h_l843_c7_e956
tmp16_MUX_uxn_opcodes_h_l843_c7_e956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l843_c7_e956_cond,
tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue,
tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse,
tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe
BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_left,
BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_right,
BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948
BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_left,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_right,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output);

-- n16_MUX_uxn_opcodes_h_l847_c7_689f
n16_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l847_c7_689f_cond,
n16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
n16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f
result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_cond,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l847_c7_689f
tmp16_MUX_uxn_opcodes_h_l847_c7_689f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l847_c7_689f_cond,
tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue,
tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse,
tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output);

-- n16_MUX_uxn_opcodes_h_l851_c7_0b77
n16_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
n16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
n16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77
result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l851_c7_0b77
tmp16_MUX_uxn_opcodes_h_l851_c7_0b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_cond,
tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue,
tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse,
tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9
BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_left,
BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_right,
BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_left,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_right,
BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c
sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_ins,
sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_x,
sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_y,
sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2
BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421
result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_cond,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output);

-- CONST_SR_8_uxn_opcodes_h_l863_c31_3669
CONST_SR_8_uxn_opcodes_h_l863_c31_3669 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l863_c31_3669_x,
CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e
CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output,
 n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output,
 n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output,
 n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output,
 n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output,
 BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output,
 n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output,
 n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output,
 BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output,
 sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output,
 CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_7147 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_0fd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_7bb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_bff5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_d244 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l853_c3_fa58 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_26bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_c624 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_3669_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_83bd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l848_l844_l852_DUPLICATE_1618_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_1fbf_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l870_l826_DUPLICATE_e434_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_bff5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_bff5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_0fd7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_0fd7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_c624 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_c624;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_7147 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_7147;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_d244 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l857_c3_d244;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_7bb4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_7bb4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_3669_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l830_c6_6fe6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l855_c30_ce3c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_ins;
     sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_x;
     sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output := sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l863_c31_3669] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l863_c31_3669_x <= VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_3669_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output := CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_d130] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l847_c11_6948] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_left;
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output := BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l848_l844_l852_DUPLICATE_1618 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l848_l844_l852_DUPLICATE_1618_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_c761] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_1fbf LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_1fbf_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_07a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_e448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_1c0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_d3a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c6_6fe6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e448_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_d3a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_1c0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_6948_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_c761_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_07a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_d130_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l848_l844_l852_DUPLICATE_1618_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l848_l844_l852_DUPLICATE_1618_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l839_l848_l844_l852_DUPLICATE_1618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l835_l830_l851_l847_l843_DUPLICATE_04c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l835_l865_l860_l851_l847_l843_DUPLICATE_e5a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_cc1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l835_l865_l830_l860_l847_l843_DUPLICATE_eb0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_1fbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l847_l860_DUPLICATE_1fbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l835_l830_l860_l847_l843_DUPLICATE_c6c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l855_c30_ce3c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_6f1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_a421] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l863_c21_83bd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_83bd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l863_c31_3669_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l844_c3_b9fe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_left;
     BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output := BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_6f1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_a421] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l830_c1_760e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l852_c3_3ba9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_left;
     BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output := BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_b9fe_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l852_c3_3ba9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l863_c21_83bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l849_l840_DUPLICATE_f00e_return_output;
     VAR_printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l830_c1_760e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_a421_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_6f1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_a421_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l860_c7_a421] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_cond;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output := result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_a421] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output;

     -- printf_uxn_opcodes_h_l831_c3_a49b[uxn_opcodes_h_l831_c3_a49b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l831_c3_a49b_uxn_opcodes_h_l831_c3_a49b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_a421] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output;

     -- n16_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     n16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     n16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- t16_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     t16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     t16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output := t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l853_c11_2e1c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l853_c3_fa58 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l853_c11_2e1c_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_a421_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_a421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_a421_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_t16_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := VAR_tmp16_uxn_opcodes_h_l853_c3_fa58;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- t16_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     t16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     t16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output := t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- n16_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     n16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     n16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output := n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l858_c21_26bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_26bb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l853_c3_fa58);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l858_c21_26bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_n16_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     -- n16_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     n16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     n16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output := n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- t16_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     t16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     t16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output := t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output := tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l851_c7_0b77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_n16_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_0b77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- t16_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     t16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output := t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- n16_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     n16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     n16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output := n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l847_c7_689f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output := result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output := tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l847_c7_689f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l830_c2_297f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l843_c7_e956] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_cond;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output := result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output;

     -- n16_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     n16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     n16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output := n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output := tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_e956_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output := tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- n16_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     n16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     n16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output := n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_d560] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l830_c2_297f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_d560_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_897d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output := tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_897d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l830_c2_297f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l830_c2_297f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output := result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l870_l826_DUPLICATE_e434 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l870_l826_DUPLICATE_e434_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c2_297f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c2_297f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l870_l826_DUPLICATE_e434_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l870_l826_DUPLICATE_e434_return_output;
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
